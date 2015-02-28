
PImage b;
float theta = 0;
float goal = 0;
PFont font;


void setup() {
  size(800, 800, P3D);
  b = loadImage("space.png");
  smooth();
  frameRate(30);


  font = loadFont("1.vlw"); 
  textFont(font); 
  textAlign(CENTER, CENTER);
}

void draw() {
  background(b);
  stroke(255);

  translate(width/2, height/2.4);

  goal = sin(theta);

  fill(255);
  textFont(font, int(map(mouseX, 0, width, 5, 48)));
  text("m u s e u m   o f   s c i e n c e", 0, int(map(mouseX, 0, width, 0, 100)));

  for (float i=0; i < TWO_PI; i+=0.9) {
    pushMatrix();
    rotateX(map(goal, -1, 1, 0, theta+i));
    for (float j = 0; j < PI; j+=0.4) {

      rotateY(map(goal, -1, 1, 0, -theta-j));
      rotateZ(map(goal, -1, 1, 0, -theta-j));


      stroke(255, 255, 255);
      noFill();
      ellipse(0, 0, int(map(mouseX, 0, width, 0, 300)), int(map(mouseX, 0, width, 0, 300)));
    }
    popMatrix();
    //endShape();
  }

  for (float i=0; i < TWO_PI; i+=0.9) {
    pushMatrix();
    rotateX(map(goal, -1, 1, 0, theta+i));
    for (float j = 0; j < PI; j+=0.4) {

      rotateY(map(goal, -1, 1, 0, +theta-j));
      rotateZ(map(goal, -1, 1, 0, +theta-j));


      stroke(200);
      noFill();
      ellipse(0, 225, int(map(mouseX, 0, width, 0, 800)), int(map(mouseX, 0, width, 0, 800)));
    }
    popMatrix();
    //endShape();
  }
  theta += map(goal, -1, 1, 0.0022, 0.045);
}


