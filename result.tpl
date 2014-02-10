{extends file='mobile/super/footer/base.tpl'}
{block name='title'}aaaaab検索結果&nbsp;お店検索&nbsp;{/block}

{block name='container'}
{strip}
<body>
<div align="center">
<img src="/img/mobile/common/logo02.jpg" />
</div>

{* バナークリック集計用 *}
{if $params.new}
	{$action = SPECIAL_pack_20_new}
{elseif $current_category}
	{$action = "CATEGORY_shopSearch_category_{$current_category->getSubName2()}_{$current_category->getSearchBannerPrice()}"}
{elseif $current_narrow}
	{$action = "AREA_shopSearch_area_{$current_narrow->getMediumArea()->getWideArea()->getSubName()}_{$current_narrow->getSubName3()}_5"}
	{$action_bottom = "AREA_shopSearch_area_{$current_narrow->getMediumArea()->getWideArea()->getSubName()}_{$current_narrow->getSubName3()}_2"}
{/if}

{foreach $banners->shuffle() as $key => $banner_high}
	{$shop = $banner_high->getShop()}
	{if $params.new}
		{$label = $banner_high->getShortText()}
	{else}
		{$label = "/mise/{$shop->getCode()}"}
	{/if}
  <img src="/img/mobile/common/crown.gif" vspace="1" hspace="1">
    <a href="{Sdx_Mobile_GoogleAnalytics::trackEvent('MO-407033-23', 'banner', {$action}, {$label}, 1, "{$banner_high->getLinkUri()}")}">
      <font color="#0033ff">
		{$banner_high->getCurrentText() nofilter}<br />
		{if strpos($banner_high->getCurrentText(), "<br") === FALSE}{* 自由テキスト内に<brがないときに店名を出す指定 *}
			{if !$banner_high->getName()}{* グループ店は店名出さない指定 *}
				[{$shop->getDisplayStation()->getName()}]{$shop->getShortName()}<br />
			{/if}
		{/if}
      </font>
    </a>
{/foreach}
<hr size=1 width=90% align=center noshade color="#ff8000" />
<div align="center">

<font color="navy" size="-1">[{$condition_name}]の一覧</font>

</div>
<div align="right">
{sdx_emoji docomo_sjis=F8DF}
<font size="-3">…割引ﾁｹｯﾄあり</font>
</div>



{foreach $list as $key=>$shop}

	{if !$shop->isTestShop()}
	{$site_shop = $shop->getCurrentSiteShop()}

{* $key +1 *}<a href="{$shop->getShopPageUriMobile()}"><font size="2" color="#FF00FF">{$shop->getLongName()}</font></a>
<font size="2" color="navy">[{$site_shop->getDisplayStation()->getName()}]</font>
		{if $site_shop->isNewSiteShop() && !$site_shop->isFree()}{* NEWの場合 *}
			<img src="/img/mobile/common/new.gif" width="16" height="12" />&nbsp;
			{elseif $site_shop->isUpSiteShop() && !$site_shop->isFree()}{* UPの場合 *}
			<img src="/img/mobile/common/up.gif" width="16" height="12" />&nbsp;
		{/if}
		{if $shop->get('is_discount') && $site_shop->getContract() == 1}{* 有料で割引ありの場合 *}
			{sdx_emoji docomo_sjis=F8DF}
		{/if}
<br />
{/if}

{foreachelse}
<font size="2" color="navy">ただいま、登録店舗はありません。</font>
{/foreach}

{* エリアで絞込み *}
{if $count_area_list}
<hr size=1 width=90% align=center noshade color="#ff8000" />
<div align="center">
<font color="#0000FF" size="2">{$condition_name}のお店を<br />ｴﾘｱで絞り込む</font>
</div>

{foreach $count_area_list as $item}

	<a href="/i/search/{$mode}/result?{$query_string}&narea={$item["id"]}"><font color="FF00FF" size="2">{$item["name"]}</font></a><font size="2" color="#000080">[{$item["count"]}]</font><br />
{foreachelse}
<font size="2" color="navy">ただいま、登録店舗はありません。</font>

{/foreach}
{/if}


{* カテゴリで絞込み *}
{if $count_category_list}
<hr size=1 width=90% align=center noshade color="#ff8000" />
<font color="#0000FF" size="-1">◇ccca業種別に絞り込む</font>
<br />
{foreach $count_category_list as $item}
テストテストテストテストテストテストテスト変更変更
<a href="/i/search/{$mode}/result?{$query_string}&category={$item["id"]}"><font color="FF00FF" size="2">{$item["name"]}</font></a>
<font size="2" color="#000080">[{$item["count"]}]</font><br />
{/foreach}
{/if}




{if $params.price || $params.category}
<hr size=1 width=90% align=center noshade color="#ff8000" />
	{if $params.price}
	{sdx_emoji docomo_sjis=F97A}<a href="/i/search/{$mode}/price"><font size="-1">{if $mode=='deli'}ﾃﾞﾘﾍﾙ{/if}料金検索ﾄｯﾌﾟへ</font></a>
	{/if}
<br />
{/if}
<hr size=1 width=90% align=center noshade color="#ff8000">
<div align=left><font size="-1"><a href="/i/howto-search/">検索方法</a></font>

{if count($banner.nk_mb_area_lower_list) >0}
<hr size=1 width=90% align=center noshade color="#ff8000"> 
{foreach $banner as $item}
		{foreach $item->shuffle() as $key => $banner_low}
			{$shop = $banner_low->getShop()}
			{$label = "/mise/{$shop->getCode()}"}
			  <img src="/img/mobile/common/crown.gif" vspace="1" hspace="1">

				<a href="{Sdx_Mobile_GoogleAnalytics::trackEvent('MO-407033-23', 'banner', {$action_bottom}, {$label}, 1, "{$banner_low->getLinkUri()}")}">
				  <font color="#0033ff">
		{$banner_low->getCurrentText() nofilter}<br />
		
		{if strpos($banner_low->getCurrentText(), "<br") == FALSE}{* 自由テキスト内に<brがないときに店名を出す指定 *}
			{if !$banner_low->getName()}{* グループ店は店名出さない指定 *}
				[{$shop->getDisplayStation()->getName()}]{$shop->getShortName()}<br />
			{/if}
		{/if}
				  </font>
				</a>
		{/foreach}
{/foreach}
{/if}
{/strip}
{/block}