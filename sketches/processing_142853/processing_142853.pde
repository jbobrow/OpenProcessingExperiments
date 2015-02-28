
school fish;
PImage img;
float yy;
float speed = .8;

void setup(){
  size(600, 400);
  ellipseMode(RADIUS);
  img = loadImage("seaBackground.jpg");
  fish = new school(mouseX, mouseY, 100, 60);
}

void draw(){
 image(img, 0, 0, 600, 400);

smooth();
strokeWeight(20);
fill(255, 125);
yy -= speed; //moves bubble upward
if(yy <= -20){
  yy = height+20;
}
ellipse(200, yy, 20, 20); //bubble

fish.display();
}




class school {
 
float x;
float y;
float radx;
float rady;
float d = 1;
float speed = .2;
float angle = 0.0;
float x1 = x;
float y1 = y;
float scalar = 10;

school(float tx, float ty, float tradx, float trady){ //changing size
  x = tx;
  y = ty;
  radx = tradx;
  rady = trady;
}

void display(){
  pushMatrix();
  scale(d,1);
  translate(d*x, y);
  noStroke();
  fill(255, 255, 0);
  ellipse(x, y, radx, rady);//body
  fill(0);
 ellipse(x+(radx/2), y-(rady/4), radx/10, rady/6);//eye
fill(0, 0, 255);
float x1 = sin(angle); //moves tailfin up and down
float y1 = sin(angle)*scalar;
angle += speed;
arc(x-(radx+45), y1, radx/2, rady-10,4.08, TWO_PI);//tailfin
arc(x-(radx+45), y1, radx/2, rady-10, 0, 2.2);
 rotate(.2);
arc(x, y+(rady/5), radx/5, rady+10,.16, PI); //fin
popMatrix();
}
}


