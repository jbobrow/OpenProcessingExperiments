
size (300, 300);
background(209, 245, 250);

translate(150, 150); // New origin point
rotate(radians(45));  //transforms the grid 45 degrees

for (int x=30; x<width;x+=40) { // creates the header of the circle pattern 
  noStroke();
  fill(225, 255, x);  // color gradient 

  for (int y= 30; y<height; y+=30) {  // creates the rest of the cirlces 
    ellipse(x, y, 25, 25);  
    stroke(y, 255, x);
       line(x,y,y,x);
    noStroke();
    for (int r=10; r<width; r+=60) {
      ellipse ((x-2*r), (y-2*r), 10, 10);

      }
    }
  }



