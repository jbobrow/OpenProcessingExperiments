
Wall myWall1;
Wall myWall2;
PFont font;
PImage photo;
PFont f;
float b;
int num =3;

void setup() {
  noStroke();
  size(500, 500, P3D);
  myWall1 = new Wall(color(0), width/2, 150, 2.25);
  myWall2 = new Wall(color(0), width/2, 400, 1);
  photo= loadImage("fire.jpg");
  f = createFont("Garamond", 32, true);
  font = createFont("Garamond", 16, true);
}

void draw() {
  if(key=='q'){
    bias();
  }if(key=='w'){
    decision();
  }if(key=='r'){
    rain();
  }if(key=='e'){
    constrainedpath();
  }else{
  }
}

void bias() {
  rectMode(CENTER);
  background(255);
  fill(0);
  textFont(font, 16);
  text("Roll over the blue for a great surprise and roll over the red for ehh...", 10, 35);
  float e = dist(150, 250, mouseX, mouseY);
  float f = dist(350, 250, mouseX, mouseY);

  if (e<=50) {
    translate(150, 250);
    for (int i=0; i < num; i= i+1) {
      float offset = PI/6;
      pushMatrix();
      rotateY(b+offset*i);
      rotateX(b/2+offset*i);
      fill(20, 20, 209, 40);
      sphereDetail(mouseX/36);
      sphere(50);
      popMatrix();
    }
  } else {
    translate(150, 250);
    for (int i=0; i < num; i= i+1) {
      float offset = PI/6;
      pushMatrix();
      rotateY(b+offset*i);
      rotateX(b/2+offset*i);
      fill(20, 20, 209, 40);
      sphere(50);
      popMatrix();
      b= b + 0.001;
    }
  }
  if (f<=50) {
  } else {
    translate(200, 0);
    for (int i=0; i < num; i= i+1) {
      float offset = PI/6;
      pushMatrix();
      rotateY(b+offset*i);
      rotateX(b/2+offset*i);
      fill(209, 20, 20, 40);
      sphere(50);
      popMatrix();
      b= b + 0.001;
    }
  }
}

void decision() {
    image(photo, 0, 0);
    fill(255);
    textFont(f, 32);
    text("press 'r' to put out the fire", 100, 50);
  }

void rain() {
  fill(0, 0, random(255), 3);
  for (int i= 0; i<600; i=i+1) {
    rect(random(500), random(0), 20, i);
  }
}


void constrainedpath() {
  background(255);
  myWall1.move();
  myWall1.display();
  myWall2.move();
  myWall2.display();
  circle();
}
void circle() {
  translate(mouseX, mouseY);
  for (int i=0; i < num; i= i+1) {
    float offset = PI/6;
    pushMatrix();
    rotateY(b+offset*i);
    rotateX(b/2+offset*i);
    fill(20, 20, 209, 40);
    box(50);
    popMatrix();
    b= b + 0.01;
  }
}

class Wall{
  color c;
  float ysize;
  float ypos;
  float xspeed;
  float xpos;

Wall(color tempC,float locx, float locY, float tempXspeed){
c = tempC;
xpos=locx;
ypos = locY;
xspeed = tempXspeed;
}

void display(){
  rectMode(CENTER);
  fill(c);
  rect(ypos,xpos,500,150);
}

void move(){
  xpos= xpos+ xspeed;
  if(xpos>width){
    xpos=0;
  }
}
}


