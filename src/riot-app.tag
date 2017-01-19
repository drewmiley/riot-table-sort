import './tags/table-sort';

<riot-app>

	<table-sort tablesort={tablesort}>
	</table-sort>

	<script>

		this.tablesort = {
			headers: [
				{ name: 'id', sort: false, direction: 'desc' },
				{ name: 'name' },
				'score',
				'date'
			],
			data: [{
					id: 0,
					name: 'Delta',
					score: 100,
					date: new Date('11/21/1987')
				}, {
					id: 1,
					name: 'Alpha',
					score: 10,
					date: new Date('11/21/1997'),
					rogueProperty: false
				}, {
					id: 2,
					name: 'Omega',
					score: 50,
					date: new Date('11/21/1977')
				}],
			sort: {
				name: 'score',
				direction: 'desc'
			}
		}

	</script>

</riot-app>
