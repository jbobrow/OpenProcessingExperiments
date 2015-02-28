
size(300, 300);
smooth();
noStroke();
background(255, 0, 120);


for (int x=40;x<width-8;x+=40) { //sets up the horizontal movement of the shapes
  for (int y=0; y<width-8; y+=40) { //sets up the vertical movemnt of the shapes

    noStroke();
    fill(244, x, 120); //this gradually changes the fill color as the circles/rectangles move across the screen
    rect(x, y-40, x, y); 
    ellipse(x, y, 20, 20);
  }
}


