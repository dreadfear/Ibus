<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<div class="product-display-wrapper ajaxresponse">
			<div class="product-sort-wrapper">
				<div class="wrap-left">
					<div class="product-number">
            <xsl:value-of select="/ProductList/TotalProducts"></xsl:value-of><span>Sản phẩm</span></div>
				</div>
				<div class="wrap-right">
					<div class="sort-item  display-option">
						<div class="text">Hiển thị</div>
						<div class="custom-select ">
							<select class="ajaxsort">
								<xsl:apply-templates select="/ProductList/PageSize" />
							</select>
						</div>
					</div>
					<div class="sort-item  sort-by">
						<div class="custom-select  sort-amount sort-by">
							<select class='ajaxsort'>
								<xsl:apply-templates select="/ProductList/SortBy"></xsl:apply-templates>
							</select>
						</div>
					</div>
				</div>
			</div>
			<div class="row product-row-wrapper ajaxresponsewrap ">
				<xsl:apply-templates select="ProductList/Product"></xsl:apply-templates>
			</div>
			<div class="btn-center ajaxresponse-pager-wrap">
				<xsl:if test="/ProductList/NextPageUrl !=''">
					<a class="btn btn-primary view-more-product ajaxpagerlink">
						<xsl:attribute name="href">
							<xsl:value-of disable-output-escaping="yes" select="/ProductList/NextPageUrl"></xsl:value-of>
						</xsl:attribute>
						<span>Xem thêm</span>
					</a>
				</xsl:if>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="SortBy">

		<option>
			<xsl:if test="IsActive='true'">
				<xsl:attribute name="selected">
					<xsl:text>selected</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="value">
				<xsl:value-of select="Url"></xsl:value-of>
			</xsl:attribute>
			<xsl:value-of select="Title"></xsl:value-of>
		</option>
	</xsl:template>
	<xsl:template match="PageSize">
		<option>
			<xsl:if test="IsActive='true'">
				<xsl:attribute name="selected">
					<xsl:text>selected</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="value">
				<xsl:value-of select="Url"></xsl:value-of>
			</xsl:attribute>
			<xsl:value-of select="Title"></xsl:value-of>
		</option>
	</xsl:template>

	<xsl:template match="Product">
		<div class="col w-1/2 md:w-4/12">
		<div class="col-match-height">
			<div class="product-item">
        <xsl:if test="EnableBuyButton = 'True'">
					<xsl:choose>
						<xsl:when test="StockQuantity > 0">
							<a class="btn btn-primary" onclick="AjaxCart.addproducttocart_catalog(this);return false;">
								<xsl:attribute name="href">
									<xsl:value-of select="Url"></xsl:value-of>
								</xsl:attribute>              
								<xsl:attribute name="data-productid">
									<xsl:value-of select="ProductId"></xsl:value-of>
								</xsl:attribute>
								<span>Mua ngay</span>
							</a>
						</xsl:when>
						<xsl:otherwise>
							<a class="btn btn-out-stock" onclick="return false;">
								<span>Hết hàng</span>
							</a>
						</xsl:otherwise>
					</xsl:choose>
        </xsl:if>          
				
				<div class="figure-image opacity">
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="Url"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="title">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
						<img>
						<xsl:attribute name="src">
							<xsl:value-of select="ImageUrl"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="alt">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
						</img>
					</a>
				</div>
				<div class="figcaption">
					<div class="title">
						<a>
							<xsl:attribute name="href">
								<xsl:value-of select="Url"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="title">
								<xsl:value-of select="Title"></xsl:value-of>
							</xsl:attribute>
							<xsl:value-of select="Title"></xsl:value-of>
						</a>
						<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
					</div>
					<div class="price-wrapper">
						<div class="current">
							<xsl:value-of disable-output-escaping="yes" select="Price"></xsl:value-of>
						</div>
						<xsl:if test="OldPrice != ''">
							<div class="old"><xsl:value-of disable-output-escaping="yes" select="OldPrice"></xsl:value-of></div>
						</xsl:if>
						<xsl:if test="DiscountPercentage != ''">
							<div class="discount"><span>-<xsl:value-of disable-output-escaping="yes" select="DiscountPercentage"></xsl:value-of>%</span></div>
						</xsl:if>
						<!--<xsl:if test="floor(ShowOption div 8) mod 2 = 1">
							<a href="#" class="compare btn_compare">
								<xsl:if test="StockQuantity = 0">
									<xsl:attribute name="class">
										<xsl:text disable-output-escaping="yes">compare btn_compare no-border</xsl:text>
									</xsl:attribute>
								</xsl:if>
								<xsl:attribute name="data-productid">
									<xsl:value-of select="ProductId" />
								</xsl:attribute>
								<xsl:if test="AddedCompare='true'">
									<xsl:attribute name="class">
										<xsl:text>compare btn_compare active</xsl:text>
									</xsl:attribute>
								</xsl:if>
								<span class="mdi mdi-autorenew"></span>
							</a>
						</xsl:if>-->
					</div>
          <div class="colour-wrapper">
            <xsl:apply-templates select="ProductColorImage"></xsl:apply-templates>
          </div>
				</div>
				<!--<xsl:choose>
					<xsl:when test="floor(ShowOption div 1) mod 2 = 1">
						<div class="icon new">New</div>
					</xsl:when>
					<xsl:when test="floor(ShowOption div 2) mod 2 = 1">
						<div class="icon new">Hot</div>
					</xsl:when>
				</xsl:choose>
				<xsl:if test="IsFlashSale='true'">
					<div class="flash-sale">
						<div class="flash-icon">
							<span class="mdi mdi-flash"></span>
						</div>
						<div class="flash-info">
							<div class="flash-top">
								<span class="flash-discount">
									<xsl:text disable-output-escaping="yes">-</xsl:text>
									<xsl:value-of disable-output-escaping="yes" select="DiscountPercentage">
									</xsl:value-of>
									<xsl:text disable-output-escaping="yes">%</xsl:text>
								</span>
								<div class="flash-countdown">
									<xsl:attribute name="data-date">
										<xsl:value-of disable-output-escaping="yes" select="FlashSaleEndDate">
										</xsl:value-of>
									</xsl:attribute>
								</div>
							</div>
							<div class="flash-bottom">
								<div class="flash-progress">
									<div class="flash-progress-bar" style="width: 50%">
										<xsl:attribute name="style">
											<xsl:text>width: </xsl:text>
											<xsl:value-of select="Sold div Stock * 100" />
											<xsl:text>%</xsl:text>
										</xsl:attribute>
										<span>
											<xsl:text disable-output-escaping="yes">Sold: </xsl:text>
											<xsl:value-of disable-output-escaping="yes" select="Sold"></xsl:value-of>
										</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</xsl:if>-->
			</div>
		</div>
		</div>
	</xsl:template>

  <xsl:template match="ProductColorImage">
    <a>
      <xsl:attribute name="href">
        <xsl:value-of select="ProductUrl"></xsl:value-of>
      </xsl:attribute>            
      <xsl:attribute name="style">
        <xsl:text>background:</xsl:text><xsl:value-of select="ColorHexCode"></xsl:value-of><xsl:text>;</xsl:text>
      </xsl:attribute>      
    </a>
  </xsl:template>
  
</xsl:stylesheet>
