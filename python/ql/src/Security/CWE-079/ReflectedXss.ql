/**
 * @name Reflected server-side cross-site scripting
 * @description Writing user input directly to a web page
 *              allows for a cross-site scripting vulnerability.
 * @kind problem
 * @problem.severity error
 * @sub-severity high
 * @precision medium
 * @id py/reflective-xss
 * @tags security
 *       external/cwe/cwe-079
 *       external/cwe/cwe-116
 */

import python

/* Sources */
import semmle.python.web.HttpRequest

/* Sinks */

import semmle.python.web.HttpResponse

/* Flow */
import semmle.python.security.strings.Untrusted

from TaintSource src, TaintSink sink
where src.flowsToSink(sink)

select sink, "Cross-site scripting vulnerability due to $@.",
       src, "user-provided value"

