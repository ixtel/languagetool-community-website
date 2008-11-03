
<%@ page import="org.languagetool.CorpusMatch" %>
<%@ page import="org.languagetool.StringTools" %>
<html>
    <head>
        <meta name="layout" content="main" />
        <title><g:message code="ltc.corpus.match.title"/></title>
    </head>
    <body>

        <div class="body">

            <g:render template="/languageSelection"/>

            <h1><g:message code="ltc.corpus.match.title"/> (${CorpusMatch.countByLanguageCode(params.lang)})</h1>

            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>

            <div class="list">
                <table>
                    <thead>
                        <tr>
                            <th><g:message code="ltc.corpus.match.id"/></th>
                            <th><g:message code="ltc.corpus.match.match"/></th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${corpusMatchList}" status="i" var="match">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td>${match.id?.encodeAsHTML()}</td>
                        
                            <td>
                                ${StringTools.formatError(match.message.encodeAsHTML())}<br />
                                ${StringTools.formatError(match.errorContext.encodeAsHTML())}<br />
                                <span class="additional">URI: <g:link class="additional" url="${match.sourceURI}">${match.sourceURI.encodeAsHTML()}</g:link></span>
                                <span class="additional"> - check date: ${StringTools.formatDate(match.checkDate).encodeAsHTML()}
                                - <g:link controller="rule" action="show" id="${match.ruleID}"
           							params="${[lang: lang]}"><span class="additional"><g:message code="ltc.check.visit.rule"/></span></g:link></span>
                            </td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${CorpusMatch.countByLanguageCode(params.lang)}" 
                    params="${params}"/>
            </div>
        </div>
    </body>
</html>
