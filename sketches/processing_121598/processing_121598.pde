


//for this we will use Hue Saturation and Brighness as a colour space
colorMode(HSB, 100);

//fill the background with white
background(255);

//coordonates are how we position shapes
// the x coordonate is given first and extends from left to right
// the y coordonate is given secodn and extend from top to bottom

//draw a single point 10 pixels in and down
point(10, 10);

// rectangle needs an x,y position of the upper left corner
// it also needs a width and height rect(x,y,width,height);
rect(20, 10, 30, 20);

// a line has a start point and an end point
line(20, 40, 60, 50);

//we can use a for loop to draw a colum of rectangles
// a for loop has three bits
// we need a variabel: int y=10
// deside when we want to loop until y<100
// and deside how much we add to our variable  y+=10
for(int y=10;y<100;y+=10){
  fill(y,100,100);
  rect(80,y,10,10);
}

// we can use two loops to draw a grid
// a for loop has three bits
// we need a variabel: int x
// deside when we want to loop until x<50
// and deside how much we add to our variable  x+=10
// we will use one for x and y
for (int x = 0; x<50;x+=10) {
  for (int y = 50; y<100;y+=10) {
    //this will use the last fill colour spesified 
    rect(x, y, 10, 10);
  }
}

//we can change the colour and thikness of the lines two 
strokeWeight(5);
stroke(20,100,100);
line(95,10,95,90);


