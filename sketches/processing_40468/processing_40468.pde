
//homework 8
//copyright John Swanson September 2011 Pittsburgh PA 15221
//video gamez

 float x, y, wd, ht, dia, deltX, deltY, topSpeed;
 
void setup()
{
  size(400,400);
  smooth();
  x=width/2;
  y=height/2;
  topSpeed = 10;
  dia = 50;
  deltX = 0;
  deltY = 0;
}
 
void draw()
{
  prepScreen();
  movejts();
  changeSpeed();
  showSpeed();
  stopjts();
}
void stopjts()
{
  if (keyPressed == true)
  {
    x = width/2.75;
    y = width/2.75;
    deltX = 0;
    deltY = 0;
    drawjts(x, y, dia, dia);
  }
}
 
void showSpeed()
{
  text("Horizontal Speed:", 12, height-30);
  text("Vertical Speed:", 12, height-10);
  text(deltX, 125, height-30);
  text(deltY, 100, height-10);
}
 
//movement around screen and creation of torroidal space
void movejts()
{
 x = x + deltX; 
 if(x > width + dia/2)
 {
  x = -dia/2;
 }
//return right
 if(x < -dia/2)
 {
  x = width + dia/2;
 }
  y = y + deltY; 
 if(y > height + dia/2)
 {
  y = -dia/2;
 }
//return top
  if(y < -dia/2)
  {
   y = height + dia/2;
  }
   drawjts(x-50,y-50,dia,dia);
}
void changeSpeed()
{
  deltX = map(mouseX, 0, width, -1*topSpeed, topSpeed);
  deltY = map(mouseY, 0, height, -1*topSpeed, topSpeed);
}
void drawjts( float x, float y, float wd, float ht)
{
ellipseMode( CORNER);
noFill();
stroke(250-x, 250-y, x+y);
strokeWeight(.125*wd);
//ellipse( x, y, wd, ht);
//J
arc( x, y+.5*ht,
    wd, ht,
    0, PI);
beginShape();
  vertex( x+wd, y+ht);
  vertex( x+wd, y);
  vertex( x+0.5*wd, y+0.25*ht);
endShape();
//T
stroke(250-x+y, 250-x, x+y);
beginShape();
  vertex( x+1.25*wd, y-0.125*ht);
  vertex( x+2.25*wd, y-0.625*ht);
endShape();
beginShape();
  vertex( x+1.75*wd, y-0.375*ht);
  vertex( x+1.75*wd, y+0.875*ht);
endShape();
//S
stroke(250-y, x+y, y);
arc( x+2.5*wd, y-0.75*ht,
     0.5*wd, 0.625*ht,
     PI/2, TWO_PI);
arc( x+2.5*wd, y-0.125*ht,
     0.5*wd, 0.625*ht,
     TWO_PI-PI/2, TWO_PI);
arc( x+2.5*wd, y-0.125*ht,
     0.5*wd, 0.625*ht,
     0, PI);
}
void prepScreen()
{
  noStroke();
fill(255, 0, 255, 10);
rect (0,0,width,height);
}

