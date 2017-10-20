import qbs 1.0
import qbs.File
import qbs.FileInfo

Product
{
    name: "SortFilterProxyModel"
    type:
    [
        "dynamiclibrary",
        "copied qbs resources"
    ]
    targetName: "sortfilterproxymodel"

    Depends { name: "Quarks" }
    Depends { name: "cpp" }
    Depends { name: "Qt.core" }
    Depends { name: "Qt.qml" }
    Depends { name: "Qt.gui" }

    condition: Quarks.enabledQuarks.contains("sortfilterproxymodel")
    destinationDirectory: Quarks.deployDirectory + "/" + name

    cpp.defines:
    [
        'SORT_FILTER_PROXY_MODEL_LIBRARY_BUILD'
    ]
    cpp.includePaths:
    [
        "."
    ]

    Export
    {
        Depends { name: "cpp" }
        Depends { name: "Qt.core" }
        Depends { name: "Qt.qml" }
        Depends { name: "Qt.gui" }

        cpp.includePaths:
        [
            "."
        ]
    }

    Group
    {
        name: "C++ Sources"
        files:
        [
            "filter.cpp",
            "qqmlsortfilterproxymodel.cpp",
            "qqmlsortfilterproxymodel_plugin.cpp",
            "sorter.cpp"
        ]
    }

    Group
    {
        name: "C++ Headers"
        files:
        [
            "filter.h",
            "qqmlsortfilterproxymodel.h",
            "qqmlsortfilterproxymodelexport.h",
            "qqmlsortfilterproxymodel_plugin.h",
            "sorter.h"
        ]
    }

    Group
    {
        name: "Other files"
        files:
        [
            "qmldir"
        ]
        fileTags: "qbs resources"
    }

    //FIXME: Replace this to actually install files in the right location
    Rule
    {
        inputs:
        [
            "qbs resources"
        ]

        Artifact
        {
            filePath: FileInfo.joinPaths(product.destinationDirectory,
                                         "qmldir")
            fileTags:
            [
                "copied qbs resources"
            ]
        }

        prepare:
        {
            var cmd = new JavaScriptCommand()

            cmd.description = "Copying " + input.fileName + " to " + output.filePath
            cmd.highlight = "codegen"
            cmd.sourceCode = function()
            {
                File.copy(input.filePath,
                          output.filePath)
            }

            return cmd
        }
    }
}
