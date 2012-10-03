{extends file='default/super/footer/header/base.tpl'}
{block name='banner'}{strip}
{* sm-banner Start *}
<div id="sm-side-column">
	<ul id="inc-banner">
		{foreach $banners as $banner}
			{if $banner->getBannerTypeId() == '1'}
				top<li><a href="{$banner->getLinkUri()}"><img src="{$banner->getImage()->getWebPath()}" alt="{$banner->getShop()->getShortName()}"></a></li>
			{else if $banner->getBannerTypeId() == '2'}
				search<li><a href="{$banner->getLinkUri()}"><img src="{$banner->getImage()->getWebPath()}" alt="{$banner->getShop()->getShortName()}"></a></li>
		{/if}
		{/foreach}
		<li><a href="http://www.aaa-fuzoku.com/" target="_blank"><img src="/img/default/base/banner/aaa-fuzoku200-40m.gif" alt="Fuzoku情報局　トリプルA" /></a></li>
		<li><a href="http://www.furonavi.com/" target="_blank"><img src="/img/default/base/banner/furonavi.jpg" alt="吉原ソープランド情報　フロなび" /></a></li>
		<li><a href="http://www.e-wife.net/" target="_blank"><img src="/img/default/base/banner/250-50.gif" alt="e-wife" /></a></li>
		<li><a href="http://daigaku.nukinavi.com/" target="_blank"><img src="/img/default/base/banner/nukidai_200_40.gif" alt="ヌキなび大学" /></a></li>
		<li><a href="http://job.ppyn.com/" target="_blank"><img src="/img/default/base/banner/p-job_bn_234x60.gif" alt="パピヨン　ジョブ" /></a></li>
		<li><a href="http://www.nukinavi-kansai.com/" target="_blank"><img src="/img/default/base/banner/200x40.jpg" alt="関西版　ヌキなび" /></a></li>
		<li><a href="http://mfs.jpx.biz/sm/in.cgi?id=11390" target="_blank"><img src="/img/default/base/banner/MFSSM.gif" alt="My favorite SM" /></a></li>


		<li>
			<ul class="clearfix">
				<li class="smranking"><a href="http://www.sm-ranking.com/linkrank.cgi?mode=in&id=smnukinavi" target="blank"><img src="/img/default/base/banner/smr8831.gif" alt="日本最強のSMランキング"></a></li>
				<li class="mchan"><a href="http://m-chan.net/" target="blank"><img src="/img/default/base/banner/Mchan-d0881.gif" alt="m-chan.net"></a></li>
			</ul>
		</li>

	</ul>


	<div class="information">
		<h5>インフォメーション</h5>
		<ul class="information-body">
			<li>新規掲載店舗募集中！<a href="/request">掲載は掲載依頼フォームより≫</a></li>
			<li>相互リンク募集中！<a href="/link#about-mutual-link">詳しくは相互リンクについてより≫</a></li>
			<li class="note">SMサークルのイベントやライブ・パーティ・撮影会等募集しております。掲載をご希望の際はメールにてお知らせ下さい</li>
		</ul>
		<div class="information-footer-img"></div>
	</div>

</div>
{* /sm-banner End *}
{/strip}{/block}
