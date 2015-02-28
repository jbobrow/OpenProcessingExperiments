

//JiYoung Lee
//Poject 1
//Copyrights @ jiyounglee


import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

 
Minim m;
AudioPlayer s1,s2,s3,s4,s5;
 

float bx, by, bd, bxSpeed, bySpeed,cx, cy, cd, cxSpeed, cySpeed,
dx, dy, dd;
float gx,gy,gg;
float ex, ey, ed, exSpeed, eySpeed;
float fx, fy, fd, fxSpeed, fySpeed;
float hx, hy, hd, hxSpeed, hySpeed;

boolean picked = false;

//float diam;
PImage sheep;
PImage lion;
PImage apple;
PImage dog;
PImage chicken;
PImage basket;
PImage cow;

void setup()
{
size(800,400);
noStroke();
fill(33,129,36);
rect (0,0,width,height);

bx = random(0,600);
by = random(0,300);
bd = 130;
bxSpeed = random (2, 3);
bySpeed = random (2, 3);
cx = random(0,600);
cy = random(0,300);
cd = 180;
cxSpeed = random (2, 3);
cySpeed = random (2, 3); 
ex = random(0,600);
ey = random(0,300);
ed = 170;
exSpeed = random (2, 3);
eySpeed = random (2, 3); 

fx = random(0,600);
fy = random(0,300);
fd = 170;
fxSpeed = random (2, 3);
fySpeed = random (2, 3); 

hx = random(0,600);
hy = random(0,300);
hd = 220;
hxSpeed = random (2, 3);
hySpeed = random (2, 3); 


dx = width-(width/4.5);
dy = height-(height/2.5);
dd = 100;

gx = width-width/4.1;
gy = height/2;
gg = 200;



m = new Minim(this);
s1 = m.loadFile("lion.wav", 1024);
s2 = m.loadFile("dog.wav",1024);
s3 = m.loadFile("chicken.mp3",1024);
s4 = m.loadFile("cow.mp3",1024);
s5 = m.loadFile("sheep.mp3",1024);



 
sheep= loadImage("sheep.png");
lion = loadImage("lion.png");
apple = loadImage("apple.png");
dog = loadImage("dog.png");
chicken=loadImage("chicken.png");
basket = loadImage("basket.png");
cow = loadImage("cow.png");
}


void draw()
{
noStroke();
fill(33,129,36);
rect (0,0,width,height);
fill(122,221,247);
rect(0,0,width,height/8);
smooth();
fill(255);
textSize( 40 );
   text("Feed the animals with the apple!", 0,height/8 );
   
moveSheep();
drawSheep(bx,by,bd);
moveLion();
drawLion(cx,cy,cd);
drawDog(ex,ey,ed);
moveDog();
drawChicken(fx,fy,fd);
moveChicken();
drawCow(hx,hy,hd);
moveCow();
pickapple();


//drawApple(dx,dy,dd);
//dragApple();

}
 
void drawSheep(float bx, float by, float bd)
{
  image (sheep, bx,by,bd,bd);
 // image (lion,cx,cy,cd,cd);
  image(basket,gx
  ,gy,gg,gg);
  image (apple,dx, dy,dd,dd);

  
}

void moveSheep()
{
  if(bx>width*.75)
  {bxSpeed=-bxSpeed;}
  else if (bx<0)
  {bxSpeed=-bxSpeed;}
  bx=bx+bxSpeed;
  by=by+bySpeed;
  if(by>height*.75)
  {bySpeed=-bySpeed;}
  else if (by<0)
  {bySpeed=-bySpeed;}
}

void drawLion(float cx, float cy, float cd)
{
  image (lion,cx,cy,cd,cd);
}

void moveLion()
{
  if(cx>width*.75)
  {cxSpeed=-cxSpeed;}
  else if (cx<0)
  {cxSpeed=-cxSpeed;}
  cx=cx+cxSpeed;
  cy=cy+cySpeed;
  if(cy>height*.75)
  {cySpeed=-cySpeed;}
  else if (cy<0)
  {cySpeed=-cySpeed;}
}

void drawDog(float ex, float ey, float ed)
{
  image (dog,ex,ey,ed,ed);
}

void moveDog()
{
  if(ex>width*.75)
  {exSpeed=-exSpeed;}
  else if (ex<0)
  {exSpeed=-exSpeed;}
  ex=ex+exSpeed;
  ey=ey+eySpeed;
  if(ey>height*.75)
  {eySpeed=-eySpeed;}
  else if (ey<0)
  {eySpeed=-eySpeed;}
}

void drawChicken(float fx, float fy, float fd)
{
  image (chicken,fx,fy,fd,fd);
}

void moveChicken()
{
  if(fx>width*.75)
  {fxSpeed=-fxSpeed;}
  else if (fx<0)
  {fxSpeed=-fxSpeed;}
  fx=fx+fxSpeed;
  fy=fy+fySpeed;
  if(fy>height*.75)
  {fySpeed=-fySpeed;}
  else if (fy<0)
  {fySpeed=-fySpeed;}
}



void drawCow(float h, float hy, float hd)
{
  image (cow,hx,hy,hd,hd);
}

void moveCow()
{
  if(hx>width*.75)
  {hxSpeed=-hxSpeed;}
  else if (hx<0)
  {hxSpeed=-hxSpeed;}
  hx=hx+hxSpeed;
  hy=hy+hySpeed;
  if(hy>height*.75)
  {hySpeed=-hySpeed;}
  else if (hy<0)
  {hySpeed=-hySpeed;}
}




void drawApple(float dx, float dy, float dd)
{
  image (apple,dx,dy,dd,dd);
}

void pickapple ( ) 
{
  if (mousePressed == true && mouseX > gx && mouseY > gy){
       picked = true;
  }

}

void mouseDragged(){
 if (picked){
   image (apple, mouseX, mouseY, dd, dd);
//   picked = false;
   
}
}

void mouseReleased ()
{
  float c = dist(cx,cy,mouseX,mouseY);
  float e = dist(ex,ey,mouseX,mouseY);
  float f = dist(fx,fy,mouseX,mouseY);
  float h = dist(hx,hy,mouseX,mouseY);
   float b = dist(bx,by,mouseX,mouseY);

  
  if(picked){
  if ( c < (dd)) {
    s1.play ( );
    s1.rewind ( );
  }
  
  
  if ( e < (dd)) {
    s2.play ( );
    s2.rewind ( );
  }
  
  if ( f < (dd)) {
    s3.play ( );
    s3.rewind ( );
  }
  
   if ( h < (dd)) {
    s4.play ( );
    s4.rewind ( );
  }
  
   if ( b < (dd)) {
    s5.play ( );
    s5.rewind ( );
  }
  }
  picked = false;
}
  




