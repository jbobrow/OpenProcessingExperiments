
/*Erica Coombs
Art 479
Final Project – Pseudo Code


Option 1// Interactive Visualization of Classic Literature

Basic Setup:
Create a full screen background
Fill background with designated color
Make all graphics anti aliased

User Control Set Up:
Draw box for user controls
	Draw gray drop down menu for book selection
		If mouse hover then menu shows and if mouse clicked, then book selected)
	Draw gray rectangle for hue slider bar
		If slide left, then cool hues, else warm colors
	Draw gray rectangle for opacity slider bar
		If slide left, then increase opacity, else decrease opacity
	Draw gray rectangle for shape slider bar 
		If slide left, then curved shapes, else sharp angular shapes
	Draw ‘save icon’
		If mouse pressed, then save screen (but not the user controls) as high resolution tif 
	

Data Input Setup:
If mouse clicked on book name, then search google books for text, and search googlebooks, amazon, barnes and noble and good reads for book reviews.
	


Drawing Setup:
	Stroke color: user defined
	Fill color: user defined
	Draw user defined shape where mouse clicked
		Size = number of pages
		Color saturation = book popularity
	Draw branched off lines/shapes for book chapters (stroke weight = number of paragraphs)
		Draw branched off lines/shapes for paragraphs (stroke weight = number of characters)
Draw branched off lines/shapes/nodule for word clusters (the more the word is repeated, the larger the shape/line/nodule)
	If word is >4 characters then draw shape, else ignore




Option 2
Book Finder, using reviews, blog feeds etc. 
//similar to we feel fine, but with books :)


Basic Setup:
Create a full screen background
Fill background with designated color
Make all graphics anti aliased


User input setup:
Draw text input box
	If keys pressed, then type in user defined words (book theme, author, title, # of ratings, genre etc.)
Draw ‘go’ button
	If pressed, then retrieve data
Draw nodule shape picker box (allows user to decide shape used to search through data)


Data Input Setup:
If ‘go’ button pressed, then search google, amazon, barnes and noble, good reads and  various literary blog rss feeds.


User Control/ Filter Set Up:
Draw type for filtering topics
	Book Genre
		If clicked then draw list of book genres
			If genre clicked then show list of sub genres
				If sub genre clicked, then show list of books
	Theme
		If clicked then draw circles for each theme (diameter = number of books within theme)
If word theme clicked, then draw circle/shape for each book (size = popularity/ sales)
	If circle/shape clicked, then show info on book
	Pages
		If clicked then draw line graph with number of pages increasing to the right
If spot on graph clicked, then show graph with books divided by genre
	If spot on graph clicked, then show book info
	
	Star Rating
		If clicked then draw pie chart of ratings
If section of pie chart clicked, then draw shapes for books with that star rating
(fill color = book genre; size = popularity/sales)
	if shape clicked, then show book info

Number of Reviews
*/

