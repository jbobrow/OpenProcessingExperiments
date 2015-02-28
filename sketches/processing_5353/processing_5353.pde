

//// TIM SUGLINAN ////
/// UCLA DMA 28 ///


Robot r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12;

Eye e1;                            
float x, y;                        //variables to
float targetX, targetY;            //set up the easing
float easing =.05;                 //for pupil movement

float d;                           //variables to
float targetD;                     //set up the easing
float easing2 = .01;               //for left to right movement

float square;                      //jump variables
int e = 1;
float j = 100;
boolean jump = true;
boolean fall = false;
boolean run = false;
PImage bot1, bot2, bot3, bot4, bot5, bot6, eyeball, sky, wave, standing;
PShape bot7, bot8, bot9, bot10, bot11, bot12;

boolean spacebar = false;
boolean up = false;
boolean hi = false;

float angle;
float r = .5;
float speed = .02;
int directionR = 1;
int count = 0;

void setup()
{
  size(480, 320);
  smooth();
  e1 = new Eye( 240, 100, 145);
  r1 = new Robot(1);
  r2 = new Robot(2);
  r3 = new Robot(3);
  r4 = new Robot(4);
  r5 = new Robot(5);
  r6 = new Robot(6);
  r7 = new Robot(7);
  r8 = new Robot(8);
  r9 = new Robot(9);
  r10 = new Robot(10);
  r11 = new Robot(11);
  r12 = new Robot(12);
  bot1 = loadImage("bot_real_1.png");
  bot2 = loadImage("bot_real_2.png");
  bot3 = loadImage("bot_real_3.png");
  bot4 = loadImage("bot_real_4.png");
  bot5 = loadImage("mountains.png");
  bot6 = loadImage("sky.png");
  sky = loadImage("clearsky.png");
  eyeball = loadImage("eyeball.png");
  bot7 = loadShape("bot_1.svg");
  bot8 = loadShape("bot_2.svg");
  bot9 = loadShape("bot_3.svg");
  bot10 = loadShape("bot_4.svg");
  bot11 = loadShape("mountains.svg");
  bot12 = loadShape("sky.svg");
  wave = loadImage("arm.png");
  standing = loadImage("body.png");
}

void draw()
{

  background(sky);
  targetD = mouseX;
  d = d + ((targetD - d)* easing);     //easing for left and right movement
  float square = sq (d-240);

  if (mouseX > 240) {                   //if statement keeps body on inside of the mouse
    d = d - 6;
  }
  else if (mouseX < 240) {
    d = d + 6;
  }


  if (! run)
  {

    r5.display_bot();
    pushMatrix();  
    translate (d-240,0);  
    if ((d > 0 && d < 48) || (d > 96 && d < 144) || (d > 192 && d < 240) || (d > 288 && d < 336) || (d > 384 && d < 432))
    {
      r1.display_bot();
    }


    else {
      r2.display_bot();
    }
    popMatrix();

    targetX = mouseX;
    x = x + ((targetX - x) * easing);
    targetY = mouseY;
    y = y + ((targetY - y) * easing);

    e1.update(x, y);                  
    e1.display();                       
  }

  if (up) {
    run = true;
  }

  if (run) {        //jump

    pushMatrix();
    translate (0, ((-1.75)*(j-170)));
    r5.display_bot();
    popMatrix();

    translate (0,j-170);
    pushMatrix();
    translate (0, ((-1.85)*(j-170)));
    r6.display_bot();
    popMatrix();


    if (jump) {

      pushMatrix();
      translate(d-240,0);
      r3.display_bot();
      popMatrix();
      e1.display();

      square = pow(.9, e);
      e++;
      j -= (10 * square);
      if (j < 75) {
        jump = false;
        fall = true;
      }
    }

    if (fall) {

      pushMatrix();
      translate(d-240,0);
      r4.display_bot();
      popMatrix();
      e1.display();

      square = pow(.9, e);
      --e;
      j += (10 * square);
      if (j > 160) {
        fall = false;
        jump = true;
        e = 0;
        run = false;
        up = false;
      }
    }

  }

  if (mousePressed == true) {
    hi = true;
  }

  if (hi) {
    background(sky);
    r5.display_bot();


    r += speed * directionR;
    if ((r > .5) || (r < 0)) {
      directionR = -directionR;
    }

    angle = r;
    
    translate(d-240,0);
    pushMatrix();
    translate(210,130);
    rotate(angle);
    image(wave,-10,-90);
    popMatrix();
    image(standing,50,30);
    
    pushMatrix();
    translate(120,105);
    fill(168,107,72);
    ellipse(145/6, 0, 145/2, 145/2);  
    fill(0);
    ellipse(145/6, 0, 145/4, 145/4);
    popMatrix();


    count ++;

    if (count == 100) {
      hi = false;
      count = 0;
    }
  }

}
void keyReleased () {

  if ((key == 'j') || (key == 'J')) {
    up = true;
  }

  if (key == ' ')  {
    if(spacebar)
      spacebar = false;
    else
      spacebar = true;
  }
}

/////////////////CLASSES/////////////////

class Eye
{
  float ex, ey;                 
  float size;
  float angle = 0.0;

  Eye(float x, float y, int s) {        
    ex = x;
    ey = y;
    size = s;
  }

  void update( float mx, float my) {    //takes inpute from mouse
    angle= atan2(my-ey, mx-ex);         //subtracts position defined in void draw from mouse position
  }

  void display() {

    targetD = mouseX;
    d = d + ((targetD - d)* easing);     //easing for left and right movement

    if (mouseX > 240){                   //if statement keeps eye on inside of the mouse
      d = d - 6;
    }
    else {
      d = d + 6;
    }

    pushMatrix ();
    fill (255);
    translate (0, ey);
    image(eyeball, d-72, -70, size, size);
    popMatrix ();
    pushMatrix();
    translate (d, ey);
    rotate (angle);
    fill(168,107,72);
    ellipse(size/6, 0, size/2, size/2);    //middle size ellipse
    fill(0);
    ellipse(size/6, 0, size/4, size/4);    //small ellipse
    popMatrix();

  }
}

class Robot
{
  float fz;

  Robot(int z) {
    fz = z;
  }


  void display_bot () {

    if (fz == 1) {
      translate(40,50);
      image(bot1,0,0);
    }

    if (fz == 2) {
      translate(110,50);
      image(bot2,0,0);
    }

    if (fz == 3) {
      translate(140,90);
      image(bot3,0,0); 
    }

    if (fz == 4) {
      translate(110,40);
      image(bot4,0,0); 
    }

    if (fz == 5) {
      image(bot5,0,0);
    }

    if (fz == 6) {
      translate(0,-300);
      image(bot6,0,0);
    }

    if (fz == 7) {
      translate(125,70);
      shape(bot7,0,0);
    }
    if (fz == 8) {
      translate(125,70);
      shape(bot8,0,0);
    }
    if (fz == 9) {
      translate(160,100);
      shape(bot9,0,0);
    }
    if (fz == 10) {
      translate(115,70);
      shape(bot10,0,0);
    }
    if (fz == 11) {
      translate(-2,0);
      shape(bot11,0,0);
    }
    if (fz == 12) {
      translate(0,-295);
      shape(bot12,0,0);
    }
  }
}
















