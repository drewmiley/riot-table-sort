<table-sort>

	<table class='table-sort'>
		<thead class='table-sort-head'>
			<tr class='table-sort-row table-sort-head-row'>
				<th
					each={header in headers}
					class={sort.name === header.name ?
						(sort.direction === 'desc' ?
							'table-sort-head-cell table-sort-head-cell-sort table-sort-head-cell-sort-desc':
							'table-sort-head-cell table-sort-head-cell-sort table-sort-head-cell-sort-asc'):
						'table-sort-head-cell'}
					id={'table-sort-head-cell-' + header.name}
					onclick={onSort}>
					{header.name}
				</th>
			</tr>
		</thead>
		<tbody class='table-sort-body'>
			<tr
				each={datum in data}
				class='table-sort-row table-sort-body-row'>
				<td
					each={header in headers}
					class={'table-sort-body-cell table-sort-body-cell-' + header.name}
					id={'table-sort-body-cell-' + header.name + '-' + datum[header.name]}>
					{datum[header.name]}
				</td>
			</tr>
		</tbody>
	</table>

	<script>

		const sort = (a, b) => {
			const aValue = a[this.sort.name];
			const bValue = b[this.sort.name];
			if (typeof aValue === typeof bValue && Object.prototype.toString.call(aValue) === '[object Date]') {
				return this.sort.direction === 'desc' ?
					bValue.getTime() - aValue.getTime():
					aValue.getTime() - bValue.getTime();
			} else if (typeof aValue === typeof bValue && typeof aValue === 'number') {
				return this.sort.direction === 'desc' ?
					bValue - aValue:
					aValue - bValue;
			} else if (typeof aValue === typeof bValue && typeof aValue === 'string') {
				return this.sort.direction === 'desc' ?
					(aValue.toLowerCase() < bValue.toLowerCase() ? 1 : (aValue.toLowerCase() > bValue.toLowerCase() ? -1 : 0)):
					(aValue.toLowerCase() < bValue.toLowerCase() ? -1 : (aValue.toLowerCase() > bValue.toLowerCase() ? 1 : 0));
			} else {
				return;
			}
		};

		const fromSortFromHeader = header => {
			let direction = direction = header.sort.direction || 'asc';
			return {
				name: header.name,
				direction
			};
		}

		const setSort = (header) => {
			if (header.sort !== false) {
				if (header.name === this.sort.name) {
					this.sort.direction = this.sort.direction === 'desc' ? 'asc' : 'desc';
				} else {
					this.sort = fromSortFromHeader(header.sort ? header : { name: header.name, sort: {} });
				}
			}
		};

		this.headers = this.opts.tablesort.headers.map(header => header.name ? header : { name: header });
		this.sort = (() => {
			if (this.headers.find(header => header.sort)) {
				return fromSortFromHeader(this.headers.find(header => header.sort));
			} else if (this.opts.tablesort.sort) {
				const sort = this.opts.tablesort.sort;
				return sort.name ?
					(sort.direction ? sort : { name: sort.name, direction: 'asc' }):
					{ name: sort, direction: 'asc' };
			}
			return undefined;
		})();
		this.data = this.opts.tablesort.data.sort((a, b) => sort(a, b));

		this.onSort = e => {
			setSort(e.item.header);
			this.data = this.opts.tablesort.data.sort((a, b) => sort(a, b));
			this.trigger('sort', e.item.header);
			this.update();
		};

	</script>

</table-sort>