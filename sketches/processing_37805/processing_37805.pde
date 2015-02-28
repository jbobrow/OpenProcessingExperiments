
size (300, 300);
background(209, 245, 250);

for (int x=30; x<width;x+=40) { // creates the header of the circle pattern 
  noStroke();
  fill(225, 255, x);  // color gradient 

  for (int y= 30; y<height; y+=30) {  // creates the rest of the cirlces 
    ellipse(x, y, 25, 25);  

    for (int r=10; r<width; r+=60) {
      ellipse ((x-2*r), (y-2*r), 10, 10);
    }
  }
}


