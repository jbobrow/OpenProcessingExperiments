
/*

Text in between the forward slash asterisk is a "comment". 
This means this text is not sent to the compiler (the part of 
the program that turns text into the machine language) when you press 
the play button.

This method is good for commenting out lots of text
*/


//This method is good for commenting smaller pieces




// this first function controls the size of the window and has two
// "arguments" first the width then the height
size(600, 500);

background(255); // sets background color to white (note one color value means its gray scale)

//This line prints the statement inside quotes to the console
println("just drew the background");

//draws an ellipse at x = 10, y = 5 that is 100 pixels wide and 50 tall
ellipse(10, 5, 100, 50);

//The following statement sets the fill of ALL FOLLOWING OBJECTS 
//until another fill command is used
fill(0); 
rect(3, 4, 40, 20);

//Note the following fill command has 4 values: red, green, blue and alpha (i.e. transparency)
fill(17, 233, 50, 100);

//This line sets the width of the stroke to 5 pixels wide
strokeWeight(5);
//Then changes the color
stroke(255, 0, 0, 100);

//The following line has been commented out so it 
//is no longer active. Uncomment this one and then 
//comment out the previous "stroke" command to see
//All the following shapes have no stroke
//Also note this command has no arguments since there
//is nothing that needs to be specified
//noStroke();


ellipse(200, 200, 200, 300);
fill(255, 30, 255, 75);

//This lines creates a rectangle similar to an ellipse:
//First the x and y positions, then the width and height
rect(200, 200, 400, 50);

//Prints one last line to the console
println("this is a processing sketch");
