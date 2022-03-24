---
title: Semantic Version
separator: <!--h-->
verticalSeparator: <!--v-->
theme: moon
highlight-theme: a11y-dark
revealOptions:
  transition: 'concave'
---

# Semantic Version

<!--h-->

## Summary

```text
version 1.2.3
        ^ ^ ^
        ║ ║ ╚═ Patch : backward compatible bug fixes
        ║ ╚═══ Minor : features backward compatible manner
        ╚═════ Major : breaking changes API
```

Note: Semantic version is the set of rules dictating how version numbers of an API are assigned and incremented.

Based on but not limited to common practices of closed and open source software development.

Consider a version like `X.Y.Z` where `X` is `MAJOR` number, `Y` is `MINOR` number and `Z` is `PATCH` number.

 - Bug fixes represent the `PATCH` number with obvious backward compatibility.
 - Addition/changes with backward compatibility increment the `MINOR` number.
 - and any other changes with backward incompatibility increment the `MAJOR` number.
 
<!--v-->

### dependency hell

```text [|4,7,10|2,5,8]
my-app v4.7.2
╠═ internal lib v5.6.1
║  ╚═ logger lib v2016.3.4
║     ╚═ another external lib v0.3.0
╠═ database lib 12(cookie)
║  ╚═ io lib v3.0.0
║     ╚═ another external lib v0.3.0
╠═ list lib v0.1.2alpha
║  ╚═ external lib 4.8
║     ╚═ another external lib v0.3.0
```

Note: When version numbers are not standardized, solving a simple issue of a common dependency can be a real nightmare, since there is no common way to increment version of dependents libs


