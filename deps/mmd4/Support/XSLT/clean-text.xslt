<?xml version='1.0' encoding='utf-8'?>

<!-- clean-text.xslt by Fletcher Penney

	Contains routine to convert text into a LaTeX-friendly format.
	
	Called by xhtml2latex.xslt.
	
	Requires MultiMarkdown 3.3 or greater
	
-->

<!-- 
# Copyright (C) 2005-2011  Fletcher T. Penney <fletcher@fletcherpenney.net>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the
#    Free Software Foundation, Inc.
#    59 Temple Place, Suite 330
#    Boston, MA 02111-1307 USA
-->

	
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:m="http://www.w3.org/1998/Math/MathML"
	exclude-result-prefixes="xsl"
	version="1.0">

	<!-- Pass XHTML Comments through unaltered (useful for including
		raw LaTeX in your MultiMarkdown document) -->
	<xsl:template match="comment()">
		<xsl:value-of select="."/>
	</xsl:template>
	
	<!-- Utility function to convert to lower case -->
	<xsl:template name="lower-case">
		<xsl:param name="source" />
		<xsl:variable name="smallcase" select="'abcdefghijklmnopqrstuvwxyz'" />
		<xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />
		<xsl:value-of select="translate($source, $uppercase, $smallcase)" />
	</xsl:template>
	
	<!-- This is a "pointer" function that can be over-ridden easily
	 	in order to add quick additional changes -->
	<xsl:template name="clean-text">
		<xsl:param name="source"/>
		<xsl:call-template name="clean-text-utility">
			<xsl:with-param name="source">
				<xsl:value-of select="$source"/>
			</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	
	<!-- This is the "real" function that does the work.  You can also
		override this if you need to make some real changes -->
	<xsl:template name="clean-text-utility">
		<xsl:param name="source" />
		<xsl:call-template name="replace-substring">
			<xsl:with-param name="original">
		<xsl:call-template name="replace-substring">
			<xsl:with-param name="original">
		<xsl:call-template name="replace-substring">
			<xsl:with-param name="original">
		<xsl:call-template name="replace-substring">
			<xsl:with-param name="original">
		<xsl:call-template name="replace-substring">
			<xsl:with-param name="original">
		<xsl:call-template name="replace-substring">
			<xsl:with-param name="original">
		<xsl:call-template name="replace-substring">
			<xsl:with-param name="original">
		<xsl:call-template name="replace-substring">
			<xsl:with-param name="original">
		<xsl:call-template name="replace-substring">
			<xsl:with-param name="original">
		<xsl:call-template name="replace-substring">
			<xsl:with-param name="original">
		<xsl:call-template name="replace-substring">
			<xsl:with-param name="original">
		<xsl:call-template name="replace-substring">
			<xsl:with-param name="original">
		<xsl:call-template name="replace-substring">
			<xsl:with-param name="original">
		<xsl:call-template name="replace-substring">
			<xsl:with-param name="original">
		<xsl:call-template name="replace-substring">
			<xsl:with-param name="original">
		<xsl:call-template name="replace-substring">
			<xsl:with-param name="original">
		<xsl:call-template name="replace-substring">
			<xsl:with-param name="original">
		<xsl:call-template name="replace-substring">
			<xsl:with-param name="original">
		<xsl:call-template name="replace-substring">
			<xsl:with-param name="original">
		<xsl:call-template name="replace-substring">
			<xsl:with-param name="original">
		<xsl:call-template name="replace-substring">
			<xsl:with-param name="original">
		<xsl:call-template name="replace-substring">
			<xsl:with-param name="original">
		<xsl:call-template name="replace-substring">
			<xsl:with-param name="original">
		<xsl:call-template name="replace-substring">
			<xsl:with-param name="original">
		<xsl:call-template name="replace-substring">
			<xsl:with-param name="original">
		<xsl:call-template name="replace-substring">
			<xsl:with-param name="original">
		<xsl:call-template name="replace-substring">
			<xsl:with-param name="original">
		<xsl:call-template name="replace-substring">
			<xsl:with-param name="original">
		<xsl:call-template name="replace-substring">
			<xsl:with-param name="original">
		<xsl:call-template name="replace-substring">
			<xsl:with-param name="original">
				<xsl:value-of select="$source"/>
			</xsl:with-param>
			<xsl:with-param name="substring">
				<xsl:text>%20</xsl:text>
			</xsl:with-param>
			<xsl:with-param name="replacement">
				<xsl:text> </xsl:text>
			</xsl:with-param>
		</xsl:call-template>
			</xsl:with-param>
			<xsl:with-param name="substring">
				<xsl:text>\</xsl:text>
			</xsl:with-param>
			<xsl:with-param name="replacement">
				<xsl:text>$\backslash$</xsl:text>
			</xsl:with-param>
		</xsl:call-template>
			</xsl:with-param>
			<xsl:with-param name="substring">
				<xsl:text>e.g. </xsl:text>
			</xsl:with-param>
			<xsl:with-param name="replacement">
				<xsl:text>e.g.\ </xsl:text>
			</xsl:with-param>
		</xsl:call-template>
			</xsl:with-param>
			<xsl:with-param name="substring">
				<xsl:text>i.e. </xsl:text>
			</xsl:with-param>
			<xsl:with-param name="replacement">
				<xsl:text>i.e.\ </xsl:text>
			</xsl:with-param>
		</xsl:call-template>
			</xsl:with-param>
			<xsl:with-param name="substring">
				<xsl:text>&#8212;</xsl:text>
			</xsl:with-param>
			<xsl:with-param name="replacement">
				<xsl:text>---</xsl:text>
			</xsl:with-param>
		</xsl:call-template>
			</xsl:with-param>
			<xsl:with-param name="substring">
				<xsl:text>&#8211;</xsl:text>
			</xsl:with-param>
			<xsl:with-param name="replacement">
				<xsl:text>--</xsl:text>
			</xsl:with-param>
		</xsl:call-template>
			</xsl:with-param>
			<xsl:with-param name="substring">
				<xsl:text>&#8216;</xsl:text>
			</xsl:with-param>
			<xsl:with-param name="replacement">
				<xsl:text>`</xsl:text>
			</xsl:with-param>
		</xsl:call-template>
			</xsl:with-param>
			<xsl:with-param name="substring">
				<xsl:text>&#8221;</xsl:text>
			</xsl:with-param>
			<xsl:with-param name="replacement">
				<xsl:text>''</xsl:text>
			</xsl:with-param>
		</xsl:call-template>
			</xsl:with-param>
			<xsl:with-param name="substring">
				<xsl:text>&#8220;</xsl:text>
			</xsl:with-param>
			<xsl:with-param name="replacement">
				<xsl:text>``</xsl:text>
			</xsl:with-param>
		</xsl:call-template>
			</xsl:with-param>
			<xsl:with-param name="substring">
				<xsl:text>&#8217;</xsl:text>
			</xsl:with-param>
			<xsl:with-param name="replacement">
				<xsl:text>'</xsl:text>
			</xsl:with-param>
		</xsl:call-template>
			</xsl:with-param>
			<xsl:with-param name="substring">
				<xsl:text>%</xsl:text>
			</xsl:with-param>
			<xsl:with-param name="replacement">
				<xsl:text>\%</xsl:text>
			</xsl:with-param>
		</xsl:call-template>
			</xsl:with-param>
			<xsl:with-param name="substring">
				<xsl:text>&amp;</xsl:text>
			</xsl:with-param>
			<xsl:with-param name="replacement">
				<xsl:text>\&amp;</xsl:text>
			</xsl:with-param>
		</xsl:call-template>
			</xsl:with-param>
			<xsl:with-param name="substring">
				<xsl:text>}</xsl:text>
			</xsl:with-param>
			<xsl:with-param name="replacement">
				<xsl:text>\}</xsl:text>
			</xsl:with-param>
		</xsl:call-template>
			</xsl:with-param>
			<xsl:with-param name="substring">
				<xsl:text>{</xsl:text>
			</xsl:with-param>
			<xsl:with-param name="replacement">
				<xsl:text>\{</xsl:text>
			</xsl:with-param>
		</xsl:call-template>
			</xsl:with-param>
			<xsl:with-param name="substring">
				<xsl:text>_</xsl:text>
			</xsl:with-param>
			<xsl:with-param name="replacement">
				<xsl:text>\_</xsl:text>
			</xsl:with-param>
		</xsl:call-template>
			</xsl:with-param>
			<xsl:with-param name="substring">
				<xsl:text>$</xsl:text>
			</xsl:with-param>
			<xsl:with-param name="replacement">
				<xsl:text>\$</xsl:text>
			</xsl:with-param>
		</xsl:call-template>
			</xsl:with-param>
			<xsl:with-param name="substring">
				<xsl:text>&#xA9;</xsl:text>
			</xsl:with-param>
			<xsl:with-param name="replacement">
				<xsl:text>\textcopyright{}</xsl:text>
			</xsl:with-param>
		</xsl:call-template>
			</xsl:with-param>
			<xsl:with-param name="substring">
				<xsl:text>#</xsl:text>
			</xsl:with-param>
			<xsl:with-param name="replacement">
				<xsl:text>\#</xsl:text>
			</xsl:with-param>
		</xsl:call-template>
			</xsl:with-param>
			<xsl:with-param name="substring">
				<xsl:text>\$\backslash\$</xsl:text>
			</xsl:with-param>
			<xsl:with-param name="replacement">
				<xsl:text>$\backslash$</xsl:text>
			</xsl:with-param>
		</xsl:call-template>
			</xsl:with-param>
			<xsl:with-param name="substring">
				<xsl:text>^</xsl:text>
			</xsl:with-param>
			<xsl:with-param name="replacement">
				<xsl:text>\^{}</xsl:text>
			</xsl:with-param>
		</xsl:call-template>
			</xsl:with-param>
			<xsl:with-param name="substring">
				<xsl:text>~</xsl:text>
			</xsl:with-param>
			<xsl:with-param name="replacement">
				<xsl:text>\ensuremath{\sim}</xsl:text>
			</xsl:with-param>
		</xsl:call-template>
			</xsl:with-param>
			<xsl:with-param name="substring">
				<xsl:text>&#160;</xsl:text>
			</xsl:with-param>
			<xsl:with-param name="replacement">
				<xsl:text>~</xsl:text>
			</xsl:with-param>
		</xsl:call-template>
			</xsl:with-param>
			<xsl:with-param name="substring">
				<xsl:text>&lt;</xsl:text>
			</xsl:with-param>
			<xsl:with-param name="replacement">
				<xsl:text>$&lt;$</xsl:text>
			</xsl:with-param>
		</xsl:call-template>
			</xsl:with-param>
			<xsl:with-param name="substring">
				<xsl:text>&gt;</xsl:text>
			</xsl:with-param>
			<xsl:with-param name="replacement">
				<xsl:text>$&gt;$</xsl:text>
			</xsl:with-param>
		</xsl:call-template>
			</xsl:with-param>
			<xsl:with-param name="substring">
				<xsl:text>&#8595;</xsl:text>
			</xsl:with-param>
			<xsl:with-param name="replacement">
				<xsl:text>${\displaystyle \downarrow}$</xsl:text>
			</xsl:with-param>
		</xsl:call-template>
			</xsl:with-param>
			<xsl:with-param name="substring">
				<xsl:text>&#8593;</xsl:text>
			</xsl:with-param>
			<xsl:with-param name="replacement">
				<xsl:text>${\displaystyle \uparrow}$</xsl:text>
			</xsl:with-param>
		</xsl:call-template>
			</xsl:with-param>
			<xsl:with-param name="substring">
				<xsl:text>&#8230;</xsl:text>
			</xsl:with-param>
			<xsl:with-param name="replacement">
				<xsl:text>{\ldots}</xsl:text>
			</xsl:with-param>
		</xsl:call-template>
			</xsl:with-param>
			<xsl:with-param name="substring">
				<xsl:text>|</xsl:text>
			</xsl:with-param>
			<xsl:with-param name="replacement">
				<xsl:text>\textbar{}</xsl:text>
			</xsl:with-param>
		</xsl:call-template>
			</xsl:with-param>
			<xsl:with-param name="substring">
				<xsl:text>/</xsl:text>
			</xsl:with-param>
			<xsl:with-param name="replacement">
				<xsl:text>\slash </xsl:text>
			</xsl:with-param>
		</xsl:call-template>
			</xsl:with-param>
			<xsl:with-param name="substring">
				<xsl:text>\slash \slash </xsl:text>
			</xsl:with-param>
			<xsl:with-param name="replacement">
				<xsl:text>/\slash </xsl:text>
			</xsl:with-param>
		</xsl:call-template>
	</xsl:template>

</xsl:stylesheet>
