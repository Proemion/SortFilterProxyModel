#include "qqmlsortfilterproxymodel_plugin.h"

#include <qqml.h>

#include "qqmlsortfilterproxymodel.h"
#include "filters/filtercontainer.h"
#include "filters/rolefilter.h"
#include "filters/valuefilter.h"
#include "filters/indexfilter.h"
#include "filters/regexpfilter.h"
#include "filters/rangefilter.h"
#include "filters/expressionfilter.h"
#include "filters/filtercontainerfilter.h"
#include "filters/anyoffilter.h"
#include "filters/alloffilter.h"
#include "sorters/sorter.h"
#include "sorters/sortercontainer.h"
#include "sorters/rolesorter.h"
#include "sorters/stringsorter.h"
#include "sorters/expressionsorter.h"
#include "proxyroles/proxyrole.h"
#include "proxyroles/proxyrolecontainer.h"
#include "proxyroles/joinrole.h"
#include "proxyroles/switchrole.h"
#include "proxyroles/expressionrole.h"
#include "proxyroles/singlerole.h"
#include "proxyroles/regexprole.h"
#include "sorters/filtersorter.h"
#include "proxyroles/filterrole.h"

using namespace qqsfpm;

void QQmlSortFilterProxyModelPlugin::registerTypes(const char *uri)
{
    Q_UNUSED(uri)

    //Actual Model
    qmlRegisterType<QQmlSortFilterProxyModel>("SortFilterProxyModel", 0, 2, "SortFilterProxyModel");

    //Sorters
    qmlRegisterUncreatableType<Sorter>("SortFilterProxyModel", 0, 2, "Sorter", "Sorter is an abstract class");
    qmlRegisterType<RoleSorter>("SortFilterProxyModel", 0, 2, "RoleSorter");
    qmlRegisterType<StringSorter>("SortFilterProxyModel", 0, 2, "StringSorter");
    qmlRegisterType<FilterSorter>("SortFilterProxyModel", 0, 2, "FilterSorter");
    qmlRegisterType<ExpressionSorter>("SortFilterProxyModel", 0, 2, "ExpressionSorter");

    //Proxy Roles
    qmlRegisterUncreatableType<ProxyRole>("SortFilterProxyModel", 0, 2, "ProxyRole", "ProxyRole is an abstract class");
    qmlRegisterType<JoinRole>("SortFilterProxyModel", 0, 2, "JoinRole");
    qmlRegisterType<SwitchRole>("SortFilterProxyModel", 0, 2, "SwitchRole");
    qmlRegisterType<ExpressionRole>("SortFilterProxyModel", 0, 2, "ExpressionRole");
    qmlRegisterType<RegExpRole>("SortFilterProxyModel", 0, 2, "RegExpRole");
    qmlRegisterType<FilterRole>("SortFilterProxyModel", 0, 2, "FilterRole");

    //Filters
    qmlRegisterUncreatableType<Filter>("SortFilterProxyModel", 0, 2, "Filter", "Filter is an abstract class");
    qmlRegisterType<ValueFilter>("SortFilterProxyModel", 0, 2, "ValueFilter");
    qmlRegisterType<IndexFilter>("SortFilterProxyModel", 0, 2, "IndexFilter");
    qmlRegisterType<RegExpFilter>("SortFilterProxyModel", 0, 2, "RegExpFilter");
    qmlRegisterType<RangeFilter>("SortFilterProxyModel", 0, 2, "RangeFilter");
    qmlRegisterType<ExpressionFilter>("SortFilterProxyModel", 0, 2, "ExpressionFilter");
    qmlRegisterType<AnyOfFilter>("SortFilterProxyModel", 0, 2, "AnyOf");
    qmlRegisterType<AllOfFilter>("SortFilterProxyModel", 0, 2, "AllOf");
}

