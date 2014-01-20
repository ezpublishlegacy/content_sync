{if $is_new_created}
<div class="message-feedback">
	<h2><span class="time">[{currentdate()|l10n( shortdatetime )}]</span> {'New content synchronization request was sent.'|i18n( 'extension/content_sync' )}</h2>
</div>
{/if}

<div class="context-block">

	<div class="box-header"><div class="box-tc"><div class="box-ml"><div class="box-mr"><div class="box-tl"><div class="box-tr">
		<h1 class="context-title">&nbsp;{'Request logs'|i18n( 'extension/content_sync' )} ({$total_count})</h1>
		<div class="header-subline"></div>
	</div></div></div></div></div></div>

	<div class="box-ml"><div class="box-mr"><div class="box-content">
		{if $logs|count|gt( 0 )}
			<table class="list" cellspacing="0" cellpadding="0">
				<thead>
					<tr>
						<th>{'Object'|i18n( 'extension/content_sync' )}</th>
						<th>{'Version'|i18n( 'extension/content_sync' )}</th>
						<th>{'Date'|i18n( 'extension/content_sync' )}</th>
						<th>{'Response status'|i18n( 'extension/content_sync' )}</th>
						<th>{'Response time'|i18n( 'extension/content_sync' )}</th>
						<th class="tight">&nbsp;</th>
					</tr>
				</thead>
				<tbody>
					{foreach $logs as $log sequence array( 'bgdark', 'bglight' ) as $style }
					<tr class="{$style}">
						<td>{if $log.object}<a href="{$log.object.main_node.url_alias|ezurl( 'no' )}" target="_blank">{$log.object.name|wash}</a>{else}{'is removed'|i18n( 'extension/content_sync' )}{/if}</td>
						<td>{if $log.version}<a href="{concat( '/content/versionview/', $log.object_id, '/', $log.object_version, '/', $log.version.initial_language.locale )|ezurl( 'no' )}" target="_blank">{$log.object_version} ({$log.version.initial_language.locale})</a>{else}{$log.object_version}{/if}</td>
						<td>{$log.date|datetime( 'custom', '%d.%m.%Y %H:%i:%s' )}</td>
						<td>{$log.response_status}</td>
						<td>{$log.response_time}</td>
						<td class="tight"><a href="{concat( 'content_sync/request_details'|ezurl( 'no' ), '/', $log.id )}"><img src="{'share/icons/crystal-admin/16x16_original/mimetypes/readme.png'|ezroot( 'no' )}" alt="{'Details'|i18n( 'extension/ontent_sync' )}" /></a></td>
					</tr>
					{/foreach}
				</tbody>
			</table>
		{/if}
	</div></div></div>

	{include
		uri='design:navigator/google.tpl'
		page_uri='content_sync/request_logs'
		item_count=$total_count
		view_parameters=hash( 'limit', $limit, 'offset', $offset )
		item_limit=$limit
	}

</div>