<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/1999/xhtml"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" version="2.0">
    <xsl:output method="html" indent="yes" encoding="utf-8"/>
    <xsl:template match="TEI">
        <html>
            <head>
                <h1>NOBLE DEEDS OF WOMAN</h1>
                <link rel="stylesheet" type="text/css" href="all_chapters.css"/>
            </head>
            <body>
                <xsl:call-template name="personTOC"/>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="pb">
        <!--  <xsl:element name="a">
            <xsl:attribute name="href">
                <xsl:value-of select="concat('full/', @facs)"/>
            </xsl:attribute> -->
        <xsl:element name="img">
            <xsl:attribute name="src">
                <xsl:value-of select="@facs"/>
            </xsl:attribute>
        </xsl:element>
        <!-- </xsl:element> -->
    </xsl:template>


    <xsl:template match="p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>


    <xsl:template match="teiHeader"/>

    <xsl:template match="lb">
        <hr/>
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



    <xsl:template match="fw"/>





    <xsl:template match="front">
        <frontmatter>
            <xsl:apply-templates/>
        </frontmatter>
    </xsl:template>


    <xsl:template match="hi[@rend = 'italics']">
        <i>
            <xsl:apply-templates/>
        </i>
    </xsl:template>


    <xsl:template match="hi[@rend = 'smallCaps']">
        <small>
            <xsl:apply-templates/>
        </small>
    </xsl:template>

    
    <xsl:template match="quote">
        <q>
            <xsl:apply-templates/>
        </q>
    </xsl:template>
</xsl:stylesheet>
