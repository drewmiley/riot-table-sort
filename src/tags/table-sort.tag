<table-sort>

	<table class='table-sort'>
		<thead class='table-sort-head'>
			<tr class='table-sort-row table-sort-head-row'>
				<th
					each={header in headers}
					class='table-sort-head-cell'
					id={'table-sort-head-cell-' + header.name}
					onclick={onSort}>
					{header.name}
				</th>
			</tr>
		</thead>
		<tbody class='table-sort-body'>
			<tr
				each={datum, index in data}
				class='table-sort-row table-sort-body-row'>
				<td
					each={header in headers}
					class={'table-sort-body-cell table-sort-body-cell-' + header.name}
					id={'table-sort-body-cell-' + header.name + '-' + index}>
					{datum[header.name]}
				</td>
			</tr>
		</tbody>
	</table>

	<script>

		console.log(this.opts.tablesort);
		this.headers = this.opts.tablesort.headers.map(header => header.name ? header : { name: header });
		this.data = this.opts.tablesort.data;
		this.sort = this.opts.tablesort.sort;

		this.onSort = e => {
			console.log(e.item.header);
			this.update()
		};

	</script>

</table-sort>