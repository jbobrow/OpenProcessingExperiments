

float theta = 0;

float goal = 0;

PFont font;


void setup() {
  size(800, 800, P3D);
  smooth();
  frameRate(30);


  font = loadFont("1.vlw"); 
  textFont(font); 
  textAlign(CENTER, CENTER);
}

void draw() {
  background(255);
  stroke(255);

  translate(width/2, height/2.4);

  goal = sin(theta);

  fill(100);
  textFont(font, int(map(mouseX, 0, width, 5, 48)));
  text("museum of science", 0, int(map(mouseX, 0, width, 0, 100)));

  for (float i=0; i < TWO_PI; i+=0.9) {
    pushMatrix();
    rotateX(map(goal, -1, 1, 0, theta+i));
    for (float j = 0; j < PI; j+=0.4) {

      rotateY(map(goal, -1, 1, 0, -theta-j));
      rotateZ(map(goal, -1, 1, 0, -theta-j));


      stroke(189, 183, 229);
      noFill();
      ellipse(0, 0, int(map(mouseX, 0, width, 0, 300)), int(map(mouseX, 0, width, 0, 300)));
    }
    popMatrix();
    //endShape();
  }
  theta += map(goal, -1, 1, 0.0022, 0.045);
}


