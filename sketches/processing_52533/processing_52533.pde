
//Mitsuko Verdery 
//wrap bounce program
//Copyright 2012

 float x;
 float y;
 float o;
 float wdth;
 float hght;
 float tx, ty, txSpeed, tySpeed, tr, td;
 float bx, by, bd, bxSpeed, bySpeed;
 
 
void setup()
{
size ( 400, 400);
background(255, 175, 195);
noStroke();
smooth();
 
frameRate(100); 

tx = 0;
ty = random( height);
td = 120;
txSpeed = 1;
tr = random (-5, 5); 
tySpeed = 5;

bx = 100;
by = random (height - bd);
bd = 100;
bySpeed = 2;
bxSpeed = 2;
}

void prepWindow() {
  fill(#FF90AC, 10);
rect(0, 0, width, height);
}

void draw()
{
prepWindow();
drawheart(tx, ty, td, td); 
moveImage();
bounceImage();
drawheart(bx, by, bd, bd);
}

void moveImage()
{
  tx = tx + txSpeed;
  ty = ty + tr;
  if (tx >= width+(td/2))
  {
    tx = 0 - (td/2);
  }
  if (ty >= height+(td/2))
  {
    ty = 0-(td/2);
    tr = random(-5, 5);
  }
  if (ty <= 0-(td/2))
  {
    ty = height+(td/2);
    tr = random(-5, 5);
  }
}


void bounceImage()

{
  by = by + bySpeed;
  bx = bx + bxSpeed;
  if (bx > width + 10 ) {
    bxSpeed = -bxSpeed;
  } else if (bx < 0) {
    bxSpeed = -bxSpeed; 
  }
  if (by > height + 50 ) {
    bySpeed = -bySpeed;
  } else if (by < 0) {
    bySpeed = -bySpeed;
  }
}
 

//void drawTarget( int x, int y, int d)
void drawheart(float tx, float ty, float wd, float ht)
{
  
  fill(255, 62, 110);
  
  triangle(tx, ty, tx - .147*wd, ty - .175*ht, tx + .147*wd, ty - .175*ht);
  ellipse(tx - .07*wd, ty - .2*ht, .154*wd, .18*ht);
  ellipse(tx + .07*wd, ty - .2*ht, .154*wd, .18*ht);

}


void mouseClicked()

{
  float s;
  drawheart(100,100,40,40);
  s = random(200);
  drawheart(random(width),random(height),s,s);
  s = random(200);
  drawheart(random(width),random(height),s,s);
  s = random(200);
  drawheart(random(width),random(height),s,s);
  s = random(200);
  drawheart(random(width),random(height),s,s);

}
                
                                
