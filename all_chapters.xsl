<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/1999/xhtml"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" version="2.0">
    <xsl:output method="html" indent="yes" encoding="utf-8"/>
    <xsl:template match="TEI">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="all_chapters.css"/>
            </head>
            <body>
                <xsl:call-template name="personTOC"/>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="pb">
        <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="concat('full/', @facs)"/>
            </xsl:attribute>
            <xsl:element name="img">
                <xsl:attribute name="src">
                    <xsl:value-of select="concat('thumbs/', @facs)"/>
                </xsl:attribute>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    <xsl:template match="p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="teiHeader"/>
    <xsl:template match="lb">
        <p>----</p>
    </xsl:template>
    <xsl:template name="personTOC">
        <ul>
            <xsl:for-each select="//person">
                <li>
                    <xsl:element name="a">
                        <xsl:attribute name="href">
                            <xsl:value-of select="concat('#', @xml:id)"/>
                        </xsl:attribute>
                        <xsl:value-of select="persName"/>
                    </xsl:element>
                </li>
            </xsl:for-each>
        </ul>
    </xsl:template>
    <xsl:template match="persName">
        <xsl:element name="a">
            <xsl:attribute name="name">
                <xsl:value-of select="@ref"/>
            </xsl:attribute>
        </xsl:element>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="person/persName"></xsl:template>
    <xsl:template match="fw">
        <h3>
            <xsl:apply-templates/>
        </h3>
    </xsl:template>
    <xsl:template match="div3">
        <h2>
            <xsl:apply-templates/>
        </h2>
    </xsl:template>
    <xsl:template match="quote">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
</xsl:stylesheet>
