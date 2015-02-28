
int numImages = 5;
PImage[] images = new PImage[numImages];

float y = 100.0;
float x = 200.0;
float velocity = 0.0;
float acceleration = 0.5;
boolean tractorBeam = false;  //UFO values
boolean up = false;
boolean down = false;
boolean left = false;
boolean right = false;

float o = 0;
float o2 = 0;      //Background Values
float timer = 0;
float timer2 = 0;

void setup() {  
size(1200, 657);
 
  images[0]  = loadImage("DefBr.png");
  images[1]  = loadImage("SecB.jpg");
  images[2]  = loadImage("UFOpurp.png");  //image list
  images[3]  = loadImage("UFO.png");
  images[4]  = loadImage("endTimes.jpg");
  smooth();
  noStroke();
}

void draw() {

pushMatrix();
tint(147, 239, 242);
//image(images[0], 0, 0);
popMatrix();

if (timer >= 0 && timer <= 500){
  timer += 1;
}
if (timer < 250){
  o += 1;
}
if (timer > 250 && timer < 500){       //cycle for the first and second background
  o -= 1;
}
if (timer > 500){
  timer = 0;
}
if (timer2 >= 0 && timer2 <= 1500){
  timer2 += 1;
}
if (timer2 > 1000 && timer2 < 1250){
  o2 += 1;
}
if (timer2 > 1250 && timer2 < 1500){       //cycle for the third background
  o2 -= 1;
}
if (timer2 > 1500){
  timer2 = 0;
}
 
 tint(255,o);
 image(images[1],0,0);
                               //draws the other two backgrounds
 tint(255,o2);
 image(images[4],0,0);

if(tractorBeam==true){

   smooth();
   noStroke();
   fill(o, 0, 132, 100);
   rect(x+80, y+80, 190, height - y);           //Tractor Beam
   image(images[2],x,y);
}
if (up ==true){
  velocity += acceleration;
  y -= velocity;
}
if (down ==true){
  velocity += acceleration;     //UFO physics
  y += velocity;
}
if (left ==true){
  velocity += acceleration;
  x -= velocity;
}
if (right ==true){
  velocity += acceleration;
  x += velocity;
}
if (x > 1100){
  x = -400;
}
if (x < -800){
  x = 1000;
}

tint(255);
image(images[2],x,y);   //draws the UFO image
tint(255,o);
image(images[3],x,y);
}


void keyPressed(){
  if (keyCode == UP){
    up = true;
  }
  if (keyCode == DOWN){
    down = true;
  }
  if (keyCode == LEFT){
    left = true;
  }
  if (keyCode == RIGHT){
    right = true;
  }
  if (key == ' '){
   tractorBeam = true;
   fill(255, 100);
   rect(x+80, y+80, 190, height - y);
   tint(255);
   image(images[2],x,y);
  }
}

void keyReleased(){
  if (keyCode == UP){
    up = false;
    velocity *= acceleration;
    y -= velocity;
  }
  if (keyCode == DOWN){
    down = false;
    velocity *= acceleration;
    y += velocity;
  }
  if (keyCode == LEFT){
    left = false;
    velocity *= acceleration;
    x -= velocity;
  }
  if (keyCode == RIGHT){
    right = false;
    velocity *= acceleration;
    x += velocity;
  }
  if (key == ' '){
    tractorBeam = false;
    }
}


