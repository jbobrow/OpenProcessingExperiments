
PImage img;
float x,y,z;

void setup()
{
  size(1257,696,P3D);
  img = loadImage("lowpoly planet.jpg");
  x = width/2;
  y = height/2;
  z =0;
}

void draw()
{
  noCursor();
  translate(0,0,z);
  image(img,0,0);
  if(mousePressed) star();
}

void star()
{
  
  PVector x = new PVector(random(mouseX-50,mouseX+50),random(mouseY-50,mouseY+50));
  PVector r = new PVector(random(x.x-50,x.x+50), random(x.y-50,x.y+50));
  PVector s = new PVector(random(x.x-50,x.x+50), random(x.y-50,x.y+50));
  float triSz = abs(r.x*s.y-r.y*s.x)/2;
  float bright = map(triSz,0,100000,0,255);
  fill(255,208,bright);
  noStroke();
  triangle(x.x,x.y,r.x,r.y,s.x,s.y);
}

void keyPressed()
{
  if(key ==CODED) {
    if(keyCode == UP) z+=5;
    if(keyCode == DOWN) z-= 5;
    
  }
}PImage img;
float x,y,z;

void setup()
{
  size(1257,696,P3D);
  img = loadImage("lowpoly planet.jpg");
  x = width/2;
  y = height/2;
  z =0;
}

void draw()
{
  noCursor();
  translate(0,0,z);
  image(img,0,0);
  if(mousePressed) star();
}

void star()
{
  
  PVector x = new PVector(random(mouseX-50,mouseX+50),random(mouseY-50,mouseY+50));
  PVector r = new PVector(random(x.x-50,x.x+50), random(x.y-50,x.y+50));
  PVector s = new PVector(random(x.x-50,x.x+50), random(x.y-50,x.y+50));
  float triSz = abs(r.x*s.y-r.y*s.x)/2;
  float bright = map(triSz,0,100000,0,255);
  fill(255,208,bright);
  noStroke();
  triangle(x.x,x.y,r.x,r.y,s.x,s.y);
}

void keyPressed()
{
  if(key ==CODED) {
    if(keyCode == UP) z+=5;
    if(keyCode == DOWN) z-= 5;
    
  }
}


