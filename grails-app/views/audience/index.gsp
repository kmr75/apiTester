<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		
		<g:javascript library="jquery" plugin="jquery" />
		<title>Welcome to Grails</title>
		
		
	</head>
	<body>
		
		
		<g:javascript src="jqGrid/grid.locale-en.js" />
		<g:javascript src="jqGrid/grid.base.js" />
		<g:javascript src="jqGrid/grid.common.js" />
		<g:javascript src="jqGrid/grid.formedit.js" />
		<g:javascript src="jqGrid/grid.inlinedit.js" />
		<g:javascript src="jqGrid/grid.celledit.js" />
		<g:javascript src="jqGrid/grid.subgrid.js" />
		<g:javascript src="jqGrid/grid.treegrid.js" />
		<g:javascript src="jqGrid/grid.custom.js" />
		<g:javascript src="jqGrid/grid.postext.js" />
		<g:javascript src="jqGrid/grid.tbltogrid.js" />
		<g:javascript src="jqGrid/grid.setcolumns.js" />
		<g:javascript src="jqGrid/grid.import.js" />
		<g:javascript src="jqGrid/grid.grouping.js" />
		<g:javascript src="jqGrid/jquery.fmatter.js" />
		<g:javascript src="jqGrid/json2.js" />
		<g:javascript src="jqGrid/JsonXml.js" />
		<g:javascript src="jqGrid/grid.grouping.js" />
		<g:javascript> 
		$(document).ready(function(){
				jQuery("#list2").jqGrid({
				   	url:"<%= createLink(controller:"audience",action:"viewAudiences") %>",
					datatype: "json",
				   	colNames:['Unique Count','Page Views', 'Audience Targeting Code', 'Audience Name'],
				   	colModel:[
				   		{name:'uniques',index:'uniques', sortable: true, width:55,sortorder:'asc'},
				   		{name:'pageViews',index:'pageViews', sortable: true, width:90,sortorder:'asc'},
				   		{name:'audienceTargetingCode',index:'audienceTargetingCode', sortable: true, width:100,sortorder:'asc'},
				   		{name:'audienceName',index:'audienceName', width:80, sortable: true, align:"right",sortorder:'asc'}		
				   	],
				   	rowNum:20,
				   	rowList:[20],
					height: 450, 
					width: 700,
				   	pager: '#pager2',
				   	sortname: 'uniques',
				    viewrecords: true,
				    sortorder: "desc",
				    caption:"Audience Stats"
				});
				jQuery("#list2").jqGrid('navGrid','#pager2',{edit:false,add:false,del:false});
			
		});
		</g:javascript>
		
		<div style="border:0px solid black;width:70%;padding: 15px">
			<h1>The Task:</h1>

			<p>Build a UI which calls Lotame's ReST services and displays the top 20 audiences by unique count. In the UI include the audience name, number of page views, audience targeting code, and number of uniques.  Not every audience will have a targeting code. 

			Then provide a way to click on that UI and have the UI display the first 20 audiences by name with an AJAX call.  

			Basically, create an audience list feature that allows the user to sort the full list of audiences by either unique count or audience name.
			</p>
			<h1>Extra Credit:</h1>

			<p>I have provided the capability to sort on every column in the table</p>

			
			
		</div>
		<div align="center">
		<table id="list2" style="border:1px solid black;width:100%;"></table>
		<div id="pager2"></div>
		</div>
	</body>
</html>
