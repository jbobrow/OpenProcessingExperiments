
PFont arial;
PFont times;
PImage self;
PImage inner2;
Float timer;
Float angle = 0;

void setup()
{
 size (500, 300);
arial = createFont ("Arial", 40);
times = createFont ("Times New Roman", 40);
colorMode (HSB, 360, 100, 100);
frameRate(10);

self = loadImage ("self.jpg");
inner2 = loadImage ("inner2.jpg");
}

void draw ()
{
 timer += 1;
 angle += 0.01;

if (timer < 30)
{
 image (self, 0, 0);
textSize (50);
textFont (times);
fill(0, 96, 93);
  pushMatrix();
  translate(timer*4,0);
  rotate(angle);
  text("Sporty", 30, 50);
  popMatrix();
  pushMatrix();
  translate(timer*2,10);
  rotate(angle);
  text("Social", 20,100);
  popMatrix();
  pushMatrix();
  translate(100-timer,0);
  rotate(angle);
  text("Party Animal",150,275);
  popMatrix();
  pushMatrix();
  translate(timer*3,0);
  rotate(angle);
  text("Jock",100,250);
  popMatrix();
  pushMatrix();
  translate(timer*4,0);
  rotate(angle);
  text ("Stupid", 200, 100);
  popMatrix();
  pushMatrix();
  translate(timer*4,0);
  rotate(angle);
  text ("Uncreative", 250, 150);
  popMatrix();
}
if ( timer > 30)
{
 image (inner2, 0, 0);
 textSize (10);
 textFont (arial);
 fill (186, 96, 93);
 pushMatrix();
  translate(timer*2,0);
  text("Smart", 30, 50);
  popMatrix();
  pushMatrix();
  translate(timer*2,10);
  text("Creative", 20,100);
  popMatrix();
  pushMatrix();
  translate(100-timer,0);
  text("Open Minded",150,275);
  popMatrix();
  pushMatrix();
  translate(timer*1,0);
  text("Caring",100,250);
  popMatrix();
  pushMatrix();
  translate(timer*2,0);
  text ("Reasonable", 200, 100);
  popMatrix();
  pushMatrix();
  translate(timer*1,0);
  text ("Friendly", 250, 150);
  popMatrix();
}

}


