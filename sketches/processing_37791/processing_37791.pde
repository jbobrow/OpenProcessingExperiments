
size (300,300);
colorMode(HSB,50); //insead of using full width, I stopped the fade at 50 to give the composition an interesting bounding box

//background color grid
for(int y = 0; y < height; y++) { 
  for(int x = 0; x < width; x++) {
    stroke(width, x, y);
    point(x,y);
}
}

//ellipse on grid pattern
noFill();
smooth();
for(int x = 0; x < width; x+=50){ //x mode that creates horizontal grid lines
  for(int y = 0; y < height; y+=50){ //y mode that creates vertical grid lines
 for(int circSize = 25; circSize >=5; circSize -=5) //loop for size of ellipse who's radius gets smaller by 5 units
    ellipse(x+25, y+25, circSize, circSize); //ellipse moves 25 units from one another on grid and uses loop to size
  }
}

