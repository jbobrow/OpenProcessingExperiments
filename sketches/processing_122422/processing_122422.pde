
int deplacementX, deplacementY;
int x, y;

int w, z;

void setup() 
{
 size(400,400);
 background(0);
 x = 200;
 y = 200; 
 deplacementX = 6;
 deplacementY = -3; 
 w = 15;
 z = 60;
}


void draw() 
{
 nettoyer();
 bouger();
 rebondir();
 dessiner();
}


void nettoyer() 
{  
background(0);
}

void dessiner() 
{
  smooth();
  fill(255);
  rect(w,z,25,85);
  fill(255);
  ellipse(x,y,20,20);
  line(200,0,200,400);
}

void bouger() 
{
 x = x + deplacementX;
 y = y + deplacementY;
 
 z = (mouseY);
}

void rebondir() 
{
 

 if (x > width-10 && deplacementX > 0) 
 {
   deplacementX = -deplacementX; 
 }
 

 

 if (y > width-10 && deplacementY > 0) 
 { 
   deplacementY = -deplacementY;
 }
 

 if (y < 10 && deplacementY < 10) 
 {
   deplacementY = abs(deplacementY);
 }
 
 if (x<w+35 && y>z && y<z+85)
  {
   deplacementX = -deplacementX;
 }

 if (x < 10) 
 {
  noLoop();
  println("GAME OVER");   
 }
}


