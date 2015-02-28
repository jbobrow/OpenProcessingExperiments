
int a = 0;

void setup( ) {
  size ( 500, 500);
  background (89, 152, 232);
  smooth();
  noStroke();
}


void draw() {
  float varx = sin(.008*a);
  float vary = cos(.008*a);
  a+=4;

  fill(107*(sin(.001*a)+1), 107*(cos(.003*a)+1), 107*(cos(.001*a)+1));
  ellipse( height/2 + 100*varx, width/2 + 100*vary, 50, 50 );

  fill(117*(sin(.006*a)+1), 147*(cos(.003*a)+1), 127*(cos(.001*a)+1));
  ellipse( height/2 + 100*-varx, width/2 + 100*-vary, 50, 50 );
  pushMatrix();


  fill(110*(sin(.05*a)+1), 87*(cos(.03*a)+1), 107*(cos(.01*a)+1));

  translate(height/2, width/2);
  rotate(frameCount/15.0);

  triangle(200, 100, 100, 250, 250, 100);
  popMatrix();

  fill(107*(sin(.02*a)+1), 107*(cos(.02*a)+1), 107*(cos(.02*a)+1));
  rect(height/2 + mouseX*varx/3, height/2 + mouseY*vary/3, 30, 30);


  translate(width/2, height/2);
  rotate(45);
  fill(random(255));
  rect(-26*varx*5, -26*varx*5, 52, 52);
}
/*
void keyPressed() {
  if (key == ' ') { 
    saveFrame("myFrame-#####.png");
  }
}
*/


