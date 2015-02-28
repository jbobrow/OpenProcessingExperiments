
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/65669*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
 //GIOVANNA CASTRO
 //INTERACTIVITY
 //The idea for this workshop was simple: 
 //A train of thought in which a horse sees a unicorn and wants to become one himself.
 
 
 PImage endhorse;
 PImage beginhorse;
 PImage beginunicorn;
 PImage ideahorseface;
 PImage lightbulb;
 PImage endunicorn;
 
 float x = 600;
 float ux = 800;
 float ix = 1000;
 float lx = 1000;
 float ex = 1400;
 float eux = 1200;
 
 float angle = 0.0;
 float offset = 90;
 float scalar = 30;
 float speed = .05;
 
  float angle2 = 0.0;
 float offset2 = 200;
 float scalar2 = 40;
 float speed2 = .05;
 
 float angle3 = 0.0;
// float offset3 = 200;
 float scalar3 = 50;
 float speed3 = .04;
 
 
 
 
 
//VOID SETUP
 void setup() {
  size(600, 400);
  smooth();
endhorse = loadImage("endhorse.png");
 beginhorse = loadImage("beginhorse.png");
 beginunicorn = loadImage("beginunicorn.png");
 ideahorseface = loadImage("ideahorseface.png");
 endunicorn = loadImage("endunicorn.png");
 lightbulb = loadImage("lightbulb.png");
  imageMode(CENTER);
}

//VOID DRAW
 void draw() {
  int currentTime = millis();
  background(0);
  
//SPEED
  x -= 4;

//IF SPEED LINE 
  if (x < 400) {
   ux-=4;
   }
  if (ux < 400) {
    ix-=4;
    lx-=4;
  }
if (ix < 400) {
 eux-=4;
}
if (eux<400) {
  ex-=4;
}

float lux = lx + cos(angle) * scalar;
float uy = offset + sin(angle) * scalar;

float y1 = offset2 +sin(angle2) *scalar2;
float y2 = offset2 +sin(angle3)*scalar3;

    
    image(endhorse, ex, y2);
    image(beginhorse, x, y1);
    image(lightbulb, lux, uy);
    
    image(ideahorseface, ix, 300);
    image(beginunicorn, ux, y2);
    image(endunicorn, eux, y1);
    angle += speed;
    angle2 += speed2;
    angle3 +=speed3;
}

