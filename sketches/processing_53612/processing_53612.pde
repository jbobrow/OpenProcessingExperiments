
stroke(250);//outline of the rectangles 
background(300);//background colour
color from = color(200, 300, 0); //Colour 1 : interpolate from this color
color to = color(0, 99, 176);// colour 2: interpolate to this colour 
color interA = lerpColor(from, to, .33); // AMT:float between 0.00 and 1.0
color interB = lerpColor(from, to, .66);//AMT: float between 0.00 and 1.0
fill(from);
rect(10, 20, 20, 60);// size of the rectangle 
fill(interA);
rect(30, 20, 20, 60);
fill(interB);
rect(50, 20, 20, 60);
fill(to);
rect(70, 20, 20, 60);

//lerpcolor calculates color(s) between two differet colours at a specific point. 
// the AMT parameter is the total between the two values where 0.0 equal to the first point, 0.1 is very near the first point, 0.5 is half way in between ect. 

