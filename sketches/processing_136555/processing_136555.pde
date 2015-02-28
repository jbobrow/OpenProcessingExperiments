
size(400, 400); //This sets up the size of your application window

//This is an ellipse function that, well, draws an ellipse.
ellipse(200, 200, 100, 50);

//This is a rectangle function, called by typing rect(), it does what you would expect
rect(50, 50, 100, 40);

//Add some color, try adding a fill() function here

fill(125);
rect(250, 50, 100, 40);

ellipse(275, 150, 50, 50); //See this ellipse takes on the color of the fill above, precedence

stroke(255, 0, 0);
strokeWeight(20);
line(25, 80, 25, 280);

stroke(0, 0, 255);
fill(0, 255, 0);

triangle(width/2, height/2 + 100, width/2 - 50, height/2 + 150, width/2 + 50, height/2 + 150);

stroke(0, 0, 255, 100);

line(50, 50, 350, 350);




