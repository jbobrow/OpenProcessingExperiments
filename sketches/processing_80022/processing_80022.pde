
PVector startPosition;
PVector position;
PVector velocity;
 
PVector gravity;
 
int mass = 10;
float d = 0;
float _d = 0;

int points = 0;

float target_size = 0;

PVector target_position;
PVector target_velocity;
PFont font;


 
void setup() {
  size(800, 500);
  frameRate(25);
  smooth();
   
  startPosition = new PVector();
   
  position = new PVector(0, 0);
  velocity = new PVector(0, 0);
  gravity = new PVector(0, 1);  // gravity goes down

  target_position = new PVector(width/2, 170);  // gravity goes down
  target_velocity = new PVector(0, 0);  // gravity goes down

  font = loadFont("caslon.vlw");
  textFont(font, 48);

}
 
void draw() {
  background(44);
 
  /* Calculate the movement */   
  PVector acceleration = new PVector();
  acceleration.add(gravity);
  velocity.add(acceleration);
  position.add(velocity);

  if(position.y > (height-50)) {
  	velocity.y = 0;
  	acceleration.y = 0;
  	position.y = height-50;
  }
 
  velocity.limit(14);

  //walls
  if(position.x < 20) {
  	velocity.x = 0;
  	acceleration.x = 0;
  	position.x = 25;
  }
  if(position.x > width-20) {
  	velocity.x = 0;
  	acceleration.x = 0;
  	position.x = width-25;
  }
   
  //calc target
  target_velocity.add(random(-0.3,0.3),0,0);
  target_position.add(target_velocity);

  //walls
  if(target_position.x < 0) target_position.x = width;
  if(target_position.x > width) target_position.x = 0;


  //distance

  _d = PVector.dist(target_position,position);
  //d = map(d,0,400,0,1);

   target_size = map(_d,0,200,5,80);

  if (_d <= 12 ) {
    background(0,20,70);
    fill(255);
    text("That's Right!", width/2-100, height/2 -40);
    points++;
  }

  stroke(77);
  //line(position.x, position.y, target_position.x, target_position.y);

  /* Draw the object */
  noStroke();
  fill(255);
 
  ellipse(position.x, position.y, 20, 20);
   

  //draw target
  fill(60,100,20);
 ellipse(target_position.x, target_position.y, target_size, target_size);

   //draw walls

   rectMode(CORNER);
   fill(255);
   rect(0, 0, 20, height);
   rect(width-20, 0, 20, height);
   rect(0, height-45, width, 45);


  /* Draw vectors (DO NOT COPY)  */
  //stroke(255, 0, 0);
  //drawVector(velocity, position, 20);
  //stroke(0, 255, 0);
  //drawVector(acceleration, position, 200);


  for (int i = 0; i<points; i++){
    fill(44);
    noStroke();
    ellipse(width-12, height - (i*20) -50, 10, 10);
  }
}
 
 
void mousePressed() {
}
 
 
void mouseReleased() {

  velocity.x = map(mouseX-position.x,-width,width,-20,20);
  velocity.y = -9;
}
 
void drawVector(PVector vec, PVector base, float len) {
  pushMatrix();
  float arrowSize = 4;
  translate(base.x, base.y);
  rotate(vec.heading2D());
  float lineLength = vec.mag() * len;
  line(0, 0, lineLength, 0);
  line(lineLength, 0,lineLength - arrowSize, arrowSize * 0.5);
  line(lineLength, 0,lineLength - arrowSize,-arrowSize * 0.5);
  popMatrix();
}


