
//draw ellipses that change in height and width depending one mouse coordinates


void setup() {
  ellipseMode(CENTER);
  rectMode(CENTER);
  size(800, 800);
  
  
  smooth();
  frameRate(24);
}

//shifting ellipses

void draw() {

  noCursor();

  stroke(20, 30, 50, 100);
  background(255);

  float vertStretch = PI*3;

  float horStretch=PI*5;
  int ellipSize = 4;
  float ellipRot = 0.3;
  translate(width/2, height/2); //center ellipse
  for (int i =0; i<height; i++) { //increment ellipse size
    //for (int h=0; h>width; h++)
    fill(0, 200, 100, 200);
    strokeWeight(4);



    scale(PI/ellipSize);

    ellipse(i, i, mouseX+vertStretch*random(3), mouseY+horStretch*random(3)); //random = jiggle effect
    fill(100, 0, 100, 200);
    ellipse(i, i, mouseY+vertStretch*random(3), mouseX+horStretch*random(3));
    rotate(PI/ellipRot);
    fill(16, 60, 90, 200);
    ellipse(i, i, mouseX+vertStretch*random(2), mouseY+horStretch*random(2));
    fill(90, 50, 25, 200);
    ellipse(i, i, mouseY+vertStretch*random(2), mouseX+horStretch*random(2));
  }
}



