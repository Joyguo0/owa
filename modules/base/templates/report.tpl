<script>
OWA.items['<?php echo $dom_id;?>'] = new OWA.report();
OWA.items['<?php echo $dom_id;?>'].dom_id = "<?php echo $dom_id;?>";
OWA.items['<?php echo $dom_id;?>'].page_num = "<?php $this->out( $this->getValue( 'page_num', 'pagination' ),false );?>1";
OWA.items['<?php echo $dom_id;?>'].max_page_num = "<?php $this->out( $this->getValue( 'max_page_num', 'pagination' ), false );?>";
OWA.items['<?php echo $dom_id;?>'].max_page_num = "<?php $this->out( $this->getValue( 'more_pages', 'pagination' ), false );?>";
OWA.items['<?php echo $dom_id;?>'].properties = <?php echo $this->makeJson($params);?>;

<?php if ( ! $this->get( 'hideReportingNavigation' ) ):?>
// Bind event handlers
jQuery(document).ready(function(){   
	
	// report side navigaion panels - toggle
	jQuery('.owa_admin_nav_topmenu_toggle').click(function () { 
      jQuery(this).parent().siblings('.owa_admin_nav_subgroup').toggle(); 
    });
});
<?php endif;?>
</script>

<div id="<?php echo $dom_id;?>" class="owa_reportContainer">

	<table width="100%" cellpadding="0" cellspacing="0">
		
		<TR>
			<?php if ( ! $this->get( 'hideReportingNavigation' ) ):?>
			<TD valign="top"  <?php if(!$_GET['isMagento']){?>class="owa_reportLeftNavColumn"<?php }?>	>
				<?php if(!$_GET['isMagento']){?>
					<div class="reportSectionContainer">
						<div id="owa_reportNavPanel">
							<?php echo $this->makeNavigationMenu($top_level_report_nav, $currentSiteId);?>
						</div>
					</div>		
				<?php }?>	
			</TD>
			<?php endif;?>
			<TD valign="top" width="*">
				
				
				<div class="reportSectionContainer">
					<div id="owa_timePeriodControl" class="owa_reportPeriod" style="float:right;"></div>
					<div id="liveViewSwitch" style="width:auto;float:right; padding-right:30px;"></div>	
					<div class="owa_reportTitle"><?php echo $title;?><span class="titleSuffix"><?php echo $this->get('titleSuffix');?></span></div>
					
					<div class="clear"></div>
					<?php echo $subview;?>
				
				</div>
			</TD>
		</TR>
	</table>	
</div>
<script>
<?php if(!$_GET['isMagento']){?>
OWA.items['<?php echo $dom_id;?>'].displayTimePeriodPicker('#owa_timePeriodControl');
<?php }?>
OWA.items['<?php echo $dom_id;?>'].showSiteFilter();
OWA.items['<?php echo $dom_id;?>'].showAutoRefreshControl({label: '实时查看:', target: '#liveViewSwitch'});
</script>
