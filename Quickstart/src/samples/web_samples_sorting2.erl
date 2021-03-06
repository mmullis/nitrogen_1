-module (web_samples_sorting2).
-include ("wf.inc").
-compile(export_all).

main() -> #template { file="./wwwroot/onecolumn.html", bindings=[
	{'Group', learn},
	{'Item', samples}
]}.

title() -> "Nested Sorting".
headline() -> "Nested Sorting".
right() -> linecount:render().

body() -> [
	#sortblock { class=advanced, tag=sort, handle=handle, items=[
		#sortitem { tag=parent1, body=#panel { body=[
			#span { class=handle, text="(Grab)" }, " Parent 1",
			#sortblock { tag=child1sort, items=[
				#sortitem { tag=child1_1, body="Child 1" },
				#sortitem { tag=child1_2, body="Child 2" },
				#sortitem { tag=child1_3, body="Child 3" },
				#sortitem { tag=child1_4, body="Child 4" }
			]}
		]}},
		#sortitem { tag=parent2, body=#panel { body=[
			#span { class=handle, text="(Grab)" }, " Parent 2",
			#sortblock { tag=child2sort, items=[
				#sortitem { tag=child2_1, body="Child 1" },
				#sortitem { tag=child2_2, body="Child 2" },
				#sortitem { tag=child2_3, body="Child 3" },
				#sortitem { tag=child2_4, body="Child 4" }
			]}
		]}},
		#sortitem { tag=parent3, body=#panel { body=[
			#span { class=handle, text="(Grab)" }, " Parent 3",
			#sortblock { tag=child3sort, items=[
				#sortitem { tag=child3_1, body="Child 1" },
				#sortitem { tag=child3_2, body="Child 2" },
				#sortitem { tag=child3_3, body="Child 3" },
				#sortitem { tag=child3_4, body="Child 4" }
			]}
		]}}
	]}
].
	
sort_event(_Tag, Items) -> 
	Message = wf:f("Order: ~p", [Items]),
	wf:wire(#alert { text=Message }),
	ok.

event(_) -> ok.