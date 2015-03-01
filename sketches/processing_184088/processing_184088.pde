
//first class intro code
//basic shapes and colors
size(500, 400); //window size is 500 by 400 pixels

background(255, 255, 240); //set the background to off-white 

// purple ellipse with no stroke
noStroke();
fill(120, 0, 255);
ellipse(200, 130, 80, 50); 

//grey rectangle with green stroke
fill(100, 105, 115);
stroke(0, 255, 0);
rect(200, 130, 100, 140);

// blue x
stroke(20, 40, 210);
line(0, 0, 500, 400); // top left to bottom right
line(0, 400, 500, 0); //bottom left to top right

// funky pink shape
fill(255, 4, 255);
noStroke();
beginShape(); //start of the vertexes
vertex(20, 120);
vertex(40, 356);
vertex(145, 315);
vertex(300, 356);
vertex(100, 250);
endShape(); //This shape ends here
