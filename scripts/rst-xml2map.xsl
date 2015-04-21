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
            <xd:p><xd:b>Usage:</xd:b> Apply this stylesheet to an .xml file (generated with rst2xml.py), to create a DITAMAP of referenced TOPICS.</xd:p>
        </xd:desc>
    </xd:doc>
<xsl:output method="xml" indent="yes" doctype-system="map.dtd" doctype-public="-//OASIS//DTD DITA Map//EN"/>

    <xsl:template match="*|@*|text()">
        <xsl:copy>
            <xsl:apply-templates select="*|@*|text()"/>
        </xsl:copy>
    </xsl:template>
    
<xsl:template match="document">
    <xsl:result-document href="../source/sdk/sdk.ditamap">
    <map>
        <title translate="no">SDK Documentation</title>
        <topicmeta>
            <prodinfo>
                <prodname>Test product</prodname>
                <vrmlist>
                    <vrm version=""/>
                </vrmlist>
            </prodinfo>
        </topicmeta>
        <xsl:for-each select="section">
            <topicref href="{@ids}.xml" type="topic" format="dita" scope="local" navtitle="{title}">
                <xsl:for-each select="section">
                    <topicref href="{@ids}.xml" type="topic" format="dita" scope="local" navtitle="{title}"/>
                    <xsl:for-each select="section">
                        <topicref href="{@ids}.xml" type="topic" format="dita" scope="local" navtitle="{title}"/>
                        <xsl:for-each select="section">
                            <topicref href="{@ids}.xml" type="topic" format="dita" scope="local" navtitle="{title}"/>
                        </xsl:for-each>
                    </xsl:for-each>
                </xsl:for-each>
            </topicref>
        </xsl:for-each>
    </map>
    </xsl:result-document>
</xsl:template>

</xsl:stylesheet>