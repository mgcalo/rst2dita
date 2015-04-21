<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:fn="http://www.w3.org/2005/xpath-functions"
    exclude-result-prefixes="xs xd fn">
    
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created:</xd:b> Dec 6, 2012</xd:p>
			<xd:p><xd:b>Modified:</xd:b> Mar 1, 2015</xd:p>
            <xd:p><xd:b>Author:</xd:b> Magda Caloian</xd:p>
            <xd:p><xd:b>Usage:</xd:b> Apply this stylesheet to an .xml file (generated with rst2xml.py), to create DITA TOPICS.</xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:output method="xml" indent="yes" doctype-system="topic.dtd" doctype-public="-//OASIS//DTD DITA Topic//EN"/>
    <xsl:strip-space elements="*" />
    <xsl:template match="*|@*|text()">
            <xsl:copy>
                <xsl:apply-templates select="*|@*|text()"/>
            </xsl:copy>
    </xsl:template>
    
    <xsl:template match="warning">
        <note type="warning"><xsl:apply-templates/></note>
    </xsl:template>
    
    <xsl:template match="definition_list">
        <dl>
        <xsl:for-each select="definition_list_item">
            <dlentry>
                <dt><xsl:value-of select="term/strong"/></dt>
                <dd><xsl:value-of select="definition/paragraph"/></dd>
            </dlentry>
        </xsl:for-each>
        </dl>
    </xsl:template>
    
    <xsl:template match="literal_block">
        <msgblock><xsl:value-of select="."/></msgblock>
    </xsl:template>
    
    <xsl:template match="colspec">
        <colspec colwidth="{@colwidth}*"/>
    </xsl:template>
    
    
    <xsl:template match="bullet_list">
        <ul>
            <xsl:for-each select="list_item">
                <li><xsl:apply-templates/></li>
            </xsl:for-each></ul>
    </xsl:template>
    
    <xsl:template match="reference">
        <xsl:choose>
            <xsl:when test="exists(@refuri)">
                <xref href="{@refuri}" format="html" scope="external"><xsl:value-of select="."/></xref>
            </xsl:when>
            <xsl:when test="exists(@refid)">
                <xref href="{@refid}.xml" format="dita" scope="local"><xsl:value-of select="."/></xref>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
     
    <xsl:template match="paragraph">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="literal">
        <codeph><xsl:apply-templates/></codeph>
    </xsl:template>
    
    <xsl:template match="emphasis">
        <b><xsl:apply-templates/></b>
    </xsl:template>
    
    <xsl:template match="strong">
        <b><xsl:apply-templates/></b>
    </xsl:template>
    
    <xsl:template match="image">
        <image href="{@uri}" placement="break"/>
    </xsl:template>
    
    
    <xsl:template match="target"/>
    
    <xsl:template match="document">
        <topic id="{@source}" xml:lang="en-US">
            <xsl:apply-templates/>
        </topic>
    </xsl:template>
    
    <xsl:template match="//section">
            <xsl:result-document href="../source/sdk/{@ids}.xml">
            <topic id="{@ids}" otherprops="{@names}" xml:lang="en-US">
                <title><xsl:value-of select="title"/></title>
                <body>
                    <xsl:apply-templates select="title/following-sibling::node()"/>
                </body>
            </topic>
        </xsl:result-document>
    </xsl:template>
    
</xsl:stylesheet>