$ = jQuery

numberAsText = (n) ->
	switch n
		when 1 then "one"
		when 2 then "two"
		when 3 then "three"
		when 4 then "four"
		when 5 then "five"
		when 6 then "six"
		when 7 then "seven"
		when 8 then "eight"
		when 9 then "nine"
		when 10 then "ten"
		when 11 then "eleven"
		when 12, 0 then "twelve"

highlight = (selector) ->
	$("##{selector}").addClass "white"

removeAllHighlights = () ->
	$(".clock-text span").removeClass "white"

displayHighlights = () ->
	highlight "itis"

	date = new Date()
	hours = date.getHours()
	minutes = date.getMinutes()
	to = false
	oclock = false

	if hours >= 12 then hours -= 12
	if minutes >= 33 then to = true; hours++

	highlight "#{numberAsText(hours)}"

	if (minutes >= 0 and minutes <= 2) or (minutes >= 58 and minutes <= 59) then oclock = true
	if (minutes >= 3 and minutes <= 7) or (minutes >= 53 and minutes <= 57) then highlight "five-past-to"
	if (minutes >= 8 and minutes <= 12) or (minutes >= 48 and minutes <= 52) then highlight "ten-past-to"
	if (minutes >= 13 and minutes <= 17) or (minutes >= 43 and minutes <= 47) then highlight "quarter-past-to"
	if (minutes >= 18 and minutes <= 22) or (minutes >= 38 and minutes <= 42) then highlight "twenty-past-to"
	if (minutes >= 23 and minutes <= 27) or (minutes >= 33 and minutes <= 37) then highlight "twenty-five-past-to"
	if (minutes >= 28 and minutes <= 32) then highlight "half-past-to"

	if oclock then highlight "oclock" else if to then highlight "to" else highlight "past"

displayHighlights()

setInterval -> 
	removeAllHighlights()
	displayHighlights()
, 5000
