
PImage bg;
PImage plankton;
PImage plankton1;
PImage plankton2;
float x=0;
float y=50;
float z=200;
float p=50;
float speed = .5;

 
void setup() {
  size(600,450);
  bg=loadImage("bg.jpg"); 
  plankton=loadImage("plankton.png");
  plankton1=loadImage("plankton1.png");
  plankton2=loadImage("plankton2.png");
}

void draw() {
image(bg,0,0,600,450);

y += speed+1;
if (y > 599) { 
y = 0; 
}
image(plankton1,y,250);

z += speed;
if (z > 599) {
z = 0; 
}
image(plankton2,z,375);


x += speed+4;
if (x > 599) { // If the shape is off screen,
x = 0; // move to the left edge
}
 if (keyPressed){
    if (key=='p'){
p = random(-0,+150);
    }
}
image(plankton,x,p,35,35);
}

