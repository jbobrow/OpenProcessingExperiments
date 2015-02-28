
PFont font;
PFont font1;
PImage img1;
PImage img2;
float ball1x;
float speed1x;
float ball2x;
float speed2x;
float ball1y;
float speed1y;
int hit,miss,a,b,c,q,w;
float ball2y;
float speed2y;
void setup()
{
  size(600,400);                         //size(width,height) 
  font = createFont("Arial-Black-48",50);
  font1 = createFont("Arial-Black-48",18);
  img1 = loadImage("Happy.jpg");
  img2 = loadImage("sad.jpg");
  Start();
 }
void Start()
{
  ball1x = 300;
 ball1y = 0;
  ball2x = 0;
 ball2y = 0;
  speed1x = 10;
  speed1y = 2;
   speed2x = 10;
   speed2y = 4;
  hit = 0;
  miss = 0;
  a=35;
  b=20;
  c=40;
  q=0;
  w=200;
  textFont(font1);
  noLoop();
}
void draw()
{
 
  float paddle = 100;
  if(ball1x<0 || ball1x>width)
  speed1x =-speed1x;
  if(ball2x<0 || ball2x>width)
  speed2x =-speed2x;
  if(ball1y+10>height)
  {
  speed1y =-speed1y;
  float distance = abs(mouseX - ball1x);
  if(distance < paddle)
  hit +=1;
  else
  miss +=1;
  }
  else
  speed1y+=1.2;
  
  ball1x+= speed1x;
  ball1y+= speed1y;
  
  if(ball2y+10>height)
  {
  speed2y =-speed2y;
  float distance = abs(mouseX - ball2x);
  if(distance < paddle)
  { hit +=1; 
    q+=10;
    w-=10; }
  else
  miss +=1;
  }
  else
  speed2y+=1;
  
  ball2x+= speed2x;
  ball2y+= speed2y;
  
  background(0,200,200);
  fill(100,w,0);
  ellipse(ball1x, ball1y, 40, 40);
  fill(q,0,200);
  ellipse(ball2x, ball2y, 40, 40);
  fill(200,0,0);
  rect(mouseX-paddle, height-10, 2*paddle, 10);  // height refers to the display window
  fill(0);  // for black.
  text("Hit : " + hit, a, b);
  text("Miss : " + miss, a, c);
  if((hit== 20)&&(miss<10))
  { 
  textFont(font);
  textAlign(CENTER);
  fill(100,50,50);
  text("YOU WIN.", width/2, height/2); 
  image(img1, width/1.3, height/2.6,50,50);
   text("CLICK TO RESTART", width/2, height/1.4);
  Start();
  delay(500);
 }
else if(miss==10)
 {
   textFont(font);
  textAlign(CENTER);
  fill(100,50,50);
  text("YOU LOSE.", width/2, height/2); 
  image(img2, width/1.25, height/2.6,50,50);
  text("CLICK TO RESTART", width/2, height/1.4);
  Start();
  delay(500);
  }
  }
void mousePressed() {
  loop();
  }



