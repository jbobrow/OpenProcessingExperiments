
int blockWidth;
int blockHeight;
int Circle;
int Inner;
int Small;

void setup () {
  size (600, 600);
  smooth ();
  background (#FFFFFF);
  blockWidth = 150;
  blockHeight = 150;
  Circle = 145;
  Inner = 90;
  Small = 45;
}

void draw () {
  // checkerboard
  fill (#000000);
  rect (0, 0, blockWidth, blockHeight);
  rect (300, 0, blockWidth, blockHeight);
  rect (150, 150, blockWidth, blockHeight);
  rect (450, 150, blockWidth, blockHeight);
  rect (0, 300, blockWidth, blockHeight);
  rect (300, 300, blockWidth, blockHeight);
  rect (150, 450, blockWidth, blockHeight);
  rect (450, 450, blockWidth, blockHeight);
  
  // target outside rings white
  fill (#FFFFFF);
  noStroke ();
  ellipse (75, 75, Circle, Circle);
  ellipse (375, 75, Circle, Circle);
  ellipse (225, 225, Circle, Circle);
  ellipse (525, 225, Circle, Circle);
  ellipse (75, 375, Circle, Circle);
  ellipse (375, 375, Circle, Circle);
  ellipse (225, 525, Circle, Circle);
  ellipse (525, 525, Circle, Circle);
  
  // target outside rings black
  fill (#000000);
  noStroke ();
  ellipse (225, 75, Circle, Circle);
  ellipse (525, 75, Circle, Circle);
  ellipse (75, 225, Circle, Circle);
  ellipse (375, 225, Circle, Circle);
  ellipse (225, 375, Circle, Circle);
  ellipse (525, 375, Circle, Circle);
  ellipse (75, 525, Circle, Circle);
  ellipse (375, 525, Circle, Circle);
  
  // target inside rings black
  fill (#000000);
  noStroke ();
  ellipse (75, 75, Inner, Inner);
  ellipse (375, 75, Inner, Inner);
  ellipse (225, 225, Inner, Inner);
  ellipse (525, 225, Inner, Inner);
  ellipse (75, 375, Inner, Inner);
  ellipse (375, 75, Inner, Inner);
  ellipse (375, 375, Inner, Inner);
  ellipse (225, 525, Inner, Inner);
  ellipse (525, 525, Inner, Inner);  
  
  // target inside rings white
  fill (#FFFFFF);
  noStroke ();
  ellipse (225, 75, Inner, Inner);
  ellipse (525, 75, Inner, Inner);
  ellipse (75, 225, Inner, Inner);
  ellipse (375, 225, Inner, Inner);
  ellipse (225, 375, Inner, Inner);
  ellipse (525, 375, Inner, Inner);
  ellipse (75, 525, Inner, Inner);
  ellipse (375, 525, Inner, Inner);
  
  // smallest rings white
  fill (#FFFFFF);
  noStroke ();
  ellipse (75, 75, Small, Small);
  ellipse (375, 75, Small, Small);
  ellipse (225, 225, Small, Small);
  ellipse (525, 225, Small, Small);
  ellipse (75, 375, Small, Small);
  ellipse (375, 375, Small, Small);
  ellipse (225, 525, Small, Small);
  ellipse (525, 525, Small, Small);
  
  // smallest rings black
  fill (#000000);
  noStroke ();
  ellipse (225, 75, Small, Small);
  ellipse (525, 75, Small, Small);
  ellipse (75, 225, Small, Small);
  ellipse (375, 225, Small, Small);
  ellipse (225, 375, Small, Small);
  ellipse (525, 375, Small, Small);
  ellipse (75, 525, Small, Small);
  ellipse (375, 525, Small, Small);
}
