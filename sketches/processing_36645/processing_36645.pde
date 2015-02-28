
int x = 250;
int y = 250;
int speedx = 2;
int speedy = -5;
int r = 255;
int g = 255;
int b = 255;

//setup
void setup(){
  size(500,500);
  smooth();
  frameRate(20);
}

void draw(){
background(r,g,b);
ellipseMode(CENTER);
fill(255,255,0);
noStroke();
ellipse(x,y,100,100);

fill(0);
stroke(0);
ellipse(x-25,y-20,5,5);
ellipse(x+25,y-20,5,5);

line(x-25,y+25,x+25,y+25);

x = constrain(x,50,450);
y = constrain(y,50,450);

x = x + speedx;
y = y + speedy;

  if((y==50)||(y==450)){
  speedy = speedy * -1;
  r = (int) random(5,255);
  g = (int) random(5,255);
  b = (int) random(5,255);
  
  }
  
   if((x==50)||(x==450)){
  speedx = speedx * -1;
  r = (int) random(5,255);
  g = (int) random(5,255);
  b = (int) random(5,255);
  }
  
}

