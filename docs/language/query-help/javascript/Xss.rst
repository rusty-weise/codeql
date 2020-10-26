Client-side cross-site scripting
================================

::

    ID: js/xss
    Kind: path-problem
    Severity: error
    Precision: high
    Tags: security external/cwe/cwe-079 external/cwe/cwe-116

`Click to see the query in the CodeQL
repository <https://github.com/github/codeql/tree/main/javascript/ql/src/Security/CWE-079/Xss.ql>`__

Directly writing user input (for example, a URL query parameter) to a
webpage without properly sanitizing the input first, allows for a
cross-site scripting vulnerability.

This kind of vulnerability is also called *DOM-based* cross-site
scripting, to distinguish it from other types of cross-site scripting.

Recommendation
--------------

To guard against cross-site scripting, consider using contextual output
encoding/escaping before writing user input to the page, or one of the
other solutions that are mentioned in the references.

Example
-------

The following example shows part of the page URL being written directly
to the document, leaving the website vulnerable to cross-site scripting.

.. code:: javascript

    function setLanguageOptions() {
        var href = document.location.href,
            deflt = href.substring(href.indexOf("default=")+8);
        document.write("<OPTION value=1>"+deflt+"</OPTION>");
        document.write("<OPTION value=2>English</OPTION>");
    }

References
----------

-  OWASP: `DOM based XSS Prevention Cheat
   Sheet <https://cheatsheetseries.owasp.org/cheatsheets/DOM_based_XSS_Prevention_Cheat_Sheet.html>`__.
-  OWASP: `XSS (Cross Site Scripting) Prevention Cheat
   Sheet <https://cheatsheetseries.owasp.org/cheatsheets/Cross_Site_Scripting_Prevention_Cheat_Sheet.html>`__.
-  OWASP `DOM Based
   XSS <https://www.owasp.org/index.php/DOM_Based_XSS>`__.
-  OWASP `Types of Cross-Site
   Scripting <https://www.owasp.org/index.php/Types_of_Cross-Site_Scripting>`__.
-  Wikipedia: `Cross-site
   scripting <http://en.wikipedia.org/wiki/Cross-site_scripting>`__.
-  Common Weakness Enumeration:
   `CWE-79 <https://cwe.mitre.org/data/definitions/79.html>`__.
-  Common Weakness Enumeration:
   `CWE-116 <https://cwe.mitre.org/data/definitions/116.html>`__.
