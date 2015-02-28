
//bg size
size(250,250);
//bg color
background(255);
//no jagged edges & stroke
smooth();
noStroke();
//rectangles will start from center point
rectMode(CENTER);
//color of rectangle
fill(50,0,0);
//center the image
translate(125,125);
//sets parameters for the loop 
for(int x=180; x>0;x-=10){
//makes the color lighter
fill((x-255)*-1,0,0);
//changes rectangle size
rect(0,0,x,x);
//turns rectangles by 0.5 Radians
rotate (0.5);
}

