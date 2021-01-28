/**
 * Provides classes and predicates related to `org.apache.http.*`.
 */

import java

class ApacheHttpGetParams extends Method {
  ApacheHttpGetParams() {
    this.getDeclaringType().getQualifiedName() = "org.apache.http.HttpMessage" and
    this.getName() = "getParams"
  }
}

class ApacheHttpEntityGetContent extends Method {
  ApacheHttpEntityGetContent() {
    this.getDeclaringType().getQualifiedName() = "org.apache.http.HttpEntity" and
    this.getName() = "getContent"
  }
}

/**
 * An HTTP request as represented by the Apache HTTP Client library. This is
 * either `org.apache.http.client.methods.HttpRequestBase`,
 * `org.apache.http.message.BasicHttpRequest`, or one of their subclasses.
 */
class ApacheHttpRequest extends RefType {
  ApacheHttpRequest() {
    this.getASourceSupertype*()
        .hasQualifiedName("org.apache.http.client.methods", "HttpRequestBase") or
    this.getASourceSupertype*().hasQualifiedName("org.apache.http.message", "BasicHttpRequest")
  }
}

/**
 * The `org.apache.http.client.methods.RequestBuilder` class.
 */
class TypeApacheHttpRequestBuilder extends Class {
  TypeApacheHttpRequestBuilder() {
    this.hasQualifiedName("org.apache.http.client.methods", "RequestBuilder")
  }
}

/**
 * The `request` parameter of an implementation of `org.apache.http.protocol.HttpRequestHandler.handle`
 */
class ApacheHttpRequestHandlerParameter extends Parameter {
  ApacheHttpRequestHandlerParameter() {
    exists(Method m, Interface i |
      i.hasQualifiedName("org.apache.http.protocol", "HttpRequestHandler") and
      m.getDeclaringType().extendsOrImplements+(i) and
      m.hasName("handle") and
      this = m.getParameter(0)
    )
  }
}
