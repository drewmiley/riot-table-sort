<table-sort>

	<div>
		table-sort
		<table class='table-sort'>
			<thead class='table-sort-head'>
				<tr class='table-sort-row table-sort-head-row'>
					<th
						each={header in opts.tablesort.headers}
						class='table-sort-header' id={'header-' + (header.name ? header.name : header)}>
						{header.name || header}
					</th>
				</tr>
			</thead>
			<tbody class='table-sort-body'>
				
			</tbody>
		</table>
	</div>

	<script>

		console.log(this.opts.tablesort);

	</script>

</table-sort>