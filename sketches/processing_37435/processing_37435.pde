
//circles inscribed on top of squares

size(600, 600);
smooth();
rectMode(CENTER);
background(255);

int wh = 90; //controls width and height of squares; allows for easy experimentation of composition

for (int p = 50; p < width; p+=100) { //p = 50 creates 6 columns
  fill(2, 28, 245);
  rect(p, 50, wh, wh);
  rect(p, 150, wh, wh);
  rect(p, 250, wh, wh);
  rect(p, 350, wh, wh);
  rect(p, 450, wh, wh); 
  rect(p, 550, wh, wh);
  strokeWeight(1);
  noFill();
  ellipse(p, 50, 100, 100);
  ellipse(p, 150, 100, 100);
  ellipse(p, 250, 100, 100);
  ellipse(p, 350, 100, 100);
  ellipse(p, 450, 100, 100);
  ellipse(p, 550, 100, 100);
}


