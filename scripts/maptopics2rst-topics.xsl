<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="xs xd"
    version="2.0">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created:</xd:b> Dec 7, 2012</xd:p>
			<xd:p><xd:b>Modified:</xd:b> Mar 1, 2015</xd:p>
            <xd:p><xd:b>Author:</xd:b> Magda Caloian</xd:p>
            <xd:p><xd:b>Usage:</xd:b> Apply this stylesheet to a DITAMAP, to transform all referenced files of type TOPIC.</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:output method="text" />
    <xsl:strip-space elements="*" />
    
    <xsl:template match="*|@*|text()">
        <xsl:copy>
            <xsl:apply-templates select="*|@*|text()"/>
        </xsl:copy>
    </xsl:template>
      
    <xsl:template match="title">
        <xsl:variable name="title_len" select="string-length(.)"/>
        <xsl:value-of select="."/>
        <xsl:text>&#xA;</xsl:text>
        <xsl:choose>
            <xsl:when test="following-sibling::body/*">
                <xsl:for-each select="1 to $title_len">
                    <xsl:value-of select="'-'"/>
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
                <xsl:for-each select="1 to $title_len">
                    <xsl:value-of select="'='"/>
                </xsl:for-each>
            </xsl:otherwise>
            </xsl:choose>
        <xsl:text>&#xA;</xsl:text>
        <xsl:text>&#xA;</xsl:text>
    </xsl:template>
    
    <xsl:template match="codeph|cmdname">
        <xsl:text>``</xsl:text>
        <xsl:value-of select="."/>
        <xsl:text>`` </xsl:text>
    </xsl:template>
    
    <xsl:template match="b|varname|parmname">
        <xsl:text>**</xsl:text>
        <xsl:value-of select="."/>
        <xsl:text>** </xsl:text>
    </xsl:template>
    
    <xsl:template match="i|msgph|filepath">
        <xsl:text>*</xsl:text>
        <xsl:value-of select="."/>
        <xsl:text>* </xsl:text>
    </xsl:template>
    
    <xsl:template match="msgblock|codeblock">
        <xsl:text>::&#xA;</xsl:text>
        <xsl:text>&#9;</xsl:text>
        <xsl:value-of select="."/>
        <xsl:text>&#xA;</xsl:text>
    </xsl:template>
    
    <xsl:template match="xref">
        <xsl:text>`</xsl:text>
        <xsl:value-of select="."/>
        <xsl:text> &lt;</xsl:text>
        <xsl:value-of select="@href"/>
        <xsl:text>&gt;`_ </xsl:text>
    </xsl:template>
    
    <xsl:template match="image">
        <xsl:text>&#xA;</xsl:text>
        <xsl:text>.. image:: </xsl:text>
        <xsl:value-of select="@href"/>
        <xsl:text>&#xA;</xsl:text>
        <xsl:text>&#xA;</xsl:text>
    </xsl:template>
        
    <xsl:template match="table">
        <xsl:text>&#xA;</xsl:text>
        <xsl:variable name="max_col" as="xs:integer"><xsl:value-of select="floor(max(tgroup/colspec/number(substring-before(@colwidth, '*'))))"/></xsl:variable>
        <xsl:variable name="table_line">            
            <xsl:text>+</xsl:text>
        <xsl:for-each select="tgroup/colspec">
            <xsl:for-each select="1 to $max_col">
                <xsl:value-of select="'-'"/>
            </xsl:for-each>
            <xsl:text>+</xsl:text>
        </xsl:for-each>
        <xsl:text>&#xA;</xsl:text>
        </xsl:variable>
        <xsl:value-of select="$table_line"/>
        <xsl:for-each select="//row">
            <xsl:text>|</xsl:text>
            <xsl:for-each select="entry">
                <xsl:text> </xsl:text>
                <xsl:value-of select="p|text()"/>
                <xsl:for-each select="1 to floor($max_col)-string-length(.)-2">
                    <xsl:value-of select="' '"/>
                </xsl:for-each>
                <xsl:text> |</xsl:text>
            </xsl:for-each>
            <xsl:text>&#xA;</xsl:text>
            <xsl:value-of select="$table_line"/>
        </xsl:for-each>
        <xsl:text>&#xA;</xsl:text>
    </xsl:template>
        
    <xsl:template match="p">
        <xsl:apply-templates/>
        <xsl:text>&#xA;</xsl:text>
        <xsl:text>&#xA;</xsl:text>
    </xsl:template>
    
    <xsl:template match="dl">
        <xsl:text>&#xA;&#xA;</xsl:text>
        <xsl:for-each select="dlentry">
            <xsl:text>**</xsl:text>
            <xsl:value-of select="dt"/>
            <xsl:text>**</xsl:text>
            <xsl:text>&#xA;</xsl:text>
            <xsl:text>&#9;</xsl:text>
            <xsl:value-of select="dd"/>
            <xsl:text>&#xA;</xsl:text>
            <xsl:text>&#xA;</xsl:text>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="ul|ol">
        <xsl:text>&#xA;&#xA;</xsl:text>
        <xsl:for-each select="li">
            <xsl:text>* </xsl:text>
            <xsl:apply-templates select="p|text()"/>
            <xsl:text>&#xA;</xsl:text>
            <xsl:text>&#xA;</xsl:text>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="note">
        <xsl:choose>
        <xsl:when test="@type='warning'">
            <xsl:text>&#xA;</xsl:text>
            <xsl:text>.. warning::&#xA;</xsl:text>
            <xsl:text>&#9;</xsl:text>
            <xsl:apply-templates select="p|text()"/>
            <xsl:text>&#xA;</xsl:text>
            <xsl:text>&#xA;</xsl:text>
        </xsl:when>
        <xsl:otherwise>
            <xsl:text>&#xA;</xsl:text>
            <xsl:text>.. note::&#xA;</xsl:text>
            <xsl:text>&#9;</xsl:text>
            <xsl:apply-templates select="p|text()"/>            
            <xsl:text>&#xA;</xsl:text>
            <xsl:text>&#xA;</xsl:text>
        </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="map">
        <xsl:for-each select="//topicref">
            <xsl:variable name="filename" select="concat('../output/rst-topics/',document(@href)/topic/@id,'.rst')" />
            <xsl:value-of select="$filename" /> 
            <xsl:result-document href="{$filename}">
                <!--<xsl:result-document href="../source/rst/{@href}.rst">-->
                <xsl:apply-templates select="document(@href)/topic/title"/>
                <xsl:apply-templates select="document(@href)/topic/body"/>
<!--            <xsl:for-each select="//xref">
                <xsl:variable name="reftarget" select="@href"/>
                <xsl:variable name="refname"><xsl:value-of select="."/></xsl:variable>
                <xsl:text>&#xA;</xsl:text>
                <xsl:text>.. _</xsl:text><xsl:value-of select="$refname"/><xsl:text>: &#xA;</xsl:text>
                <xsl:value-of select="$reftarget"></xsl:value-of>
                <xsl:text>&#xA;</xsl:text>
                </xsl:for-each>-->
           </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>