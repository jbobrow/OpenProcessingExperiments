
float r;
float g;
float b;
float a;

float diam;
float x;
float y;

void setup()
{
  size(400,400);
  background(0);
  smooth();
 
}

void draw()
{
  

  
  r=random(255);
  g=random(255);
  b=random(255);
  a=random(255);
  diam=random(255);
  x=random(width);
  y=random(height);
  
stroke(255);
noFill();
ellipse(x,y,diam,diam);



   r=random(255);
  g=random(255);
  b=random(255);
  a=random(255);
  diam=random(255);
  x=random(width);
  y=random(height);
  
noStroke();
fill(0,0,0,50);
ellipse(x,y,diam,diam);


r=random(255);
  g=random(255);
  b=random(255);
  a=random(255);
  diam=random(255);
  x=random(width);
  y=random(height);
  
noStroke();
fill(255,0,0,50);
ellipse(x,y,diam,diam);

  fill(225,0,0,50);
  ellipse(width/2,height/2,mouseX+10,mouseY+10);
  
 
}


