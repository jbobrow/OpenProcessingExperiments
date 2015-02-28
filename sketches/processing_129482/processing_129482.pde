
PImage tag1;
PImage tag2;
PImage tag3;
PImage tag4;

void setup ()
{
  
  tag1= loadImage("Tag1.jpg");
  tag2= loadImage("Tag2.jpg");
  tag3= loadImage("Tag3.jpg");
  tag4= loadImage("Tag4.jpg");
  
 size (858,570); 
}

float ballx = 200;
float bally = 100;
float speedx = 10;
float speedy = 0;
int hit = 0;
int miss = 0;

void draw ()
{
 int b = hour();
  float a = b;
  if (a >= 7 && a <= 12) {
    image (tag1,0,0);
  }
       else if (a >= 13 && a <= 16) {
     image (tag2,0,0);
   }
  else if (a >= 17 && a <= 20) {
     image (tag3,0,0);
   }
 else  {
     image (tag4,0,0);
   }
  if (mousePressed){hit = 0; miss = 0;}
  
  float paddle = 1000/(hit+10);
  if(ballx < 0 || ballx > width) speedx = -speedx;
  if (bally > height) {
 
  speedy = - speedy;
  float distance = abs (mouseX - ballx);
  if (distance < paddle) hit += 1;
  else miss += 1;}
  else speedy +=1;
  
  
  ballx += speedx;
  bally += speedy;
  

  fill (300,200,50);
  ellipse (ballx, bally, 50,50);
  fill (50,100,200);
  rect (mouseX-paddle, height-10,2*paddle,10);
  
  fill (200,17,17);
  text ("hit: " + hit,30,520);
  text ("miss: " + miss, 30,500);
  
  
}

