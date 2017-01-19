import './tags/table-sort';

<riot-app>

	<table-sort tablesort={tablesort}>
	</table-sort>

	<script>

		this.tablesort = {
			headers: [
				{ name: 'id', sort: false, direction: 'desc' },
				{ name: 'name', sort: { direction: 'desc'} },
				'score'
			],
			data: [{
					id: 0,
					name: 'Delta',
					score: 100
				}, {
					id: 1,
					name: 'Alpha',
					score: 10,
					rogueProperty: false
				}, {
					id: 2,
					name: 'Omega',
					score: 50
				}],
			sort: [{
				name: 'score',
				direction: 'desc'
			},
			'name']
		}

	</script>

</riot-app>
