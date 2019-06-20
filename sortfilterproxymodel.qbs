import qbs
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
            "qqmlsortfilterproxymodel.cpp",
            "qqmlsortfilterproxymodel_plugin.cpp",

            "sorters/filtersorter.cpp",
            "sorters/stringsorter.cpp",
            "sorters/sorter.cpp",
            "sorters/sortercontainer.cpp",
            "sorters/expressionsorter.cpp",
            "sorters/rolesorter.cpp",
            "sorters/sortersqmltypes.cpp",

            "proxyroles/joinrole.cpp",
            "proxyroles/regexprole.cpp",
            "proxyroles/proxyrolecontainer.cpp",
            "proxyroles/switchrole.cpp",
            "proxyroles/proxyrolesqmltypes.cpp",
            "proxyroles/filterrole.cpp",
            "proxyroles/expressionrole.cpp",
            "proxyroles/proxyrole.cpp",
            "proxyroles/singlerole.cpp",

            "filters/filtersqmltypes.cpp",
            "filters/rangefilter.cpp",
            "filters/filtercontainerfilter.cpp",
            "filters/expressionfilter.cpp",
            "filters/anyoffilter.cpp",
            "filters/rolefilter.cpp",
            "filters/filter.cpp",
            "filters/regexpfilter.cpp",
            "filters/valuefilter.cpp",
            "filters/filtercontainer.cpp",
            "filters/alloffilter.cpp",
            "filters/indexfilter.cpp"
        ]
    }

    Group
    {
        name: "C++ Headers"
        files:
        [
            "qqmlsortfilterproxymodel.h",
            "qqmlsortfilterproxymodelexport.h",
            "qqmlsortfilterproxymodel_plugin.h",

            "sorters/filtersorter.h",
            "sorters/stringsorter.h",
            "sorters/sorter.h",
            "sorters/sortercontainer.h",
            "sorters/expressionsorter.h",
            "sorters/rolesorter.h",

            "proxyroles/joinrole.h",
            "proxyroles/regexprole.h",
            "proxyroles/proxyrolecontainer.h",
            "proxyroles/switchrole.h",
            "proxyroles/filterrole.h",
            "proxyroles/expressionrole.h",
            "proxyroles/proxyrole.h",
            "proxyroles/singlerole.h",

            "filters/rangefilter.h",
            "filters/filtercontainerfilter.h",
            "filters/expressionfilter.h",
            "filters/anyoffilter.h",
            "filters/rolefilter.h",
            "filters/filter.h",
            "filters/regexpfilter.h",
            "filters/valuefilter.h",
            "filters/filtercontainer.h",
            "filters/alloffilter.h",
            "filters/indexfilter.h"
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
        qbs.install: true
        qbs.installDir: product.name
    }

    Group
    {
        fileTagsFilter: "dynamiclibrary"
        qbs.install: true
        qbs.installDir: product.name
    }
}
