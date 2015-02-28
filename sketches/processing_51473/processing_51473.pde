
//homework #6 - 48257 S'12
//melissa (macy) goh copyright 2012
 
float x, y, dia;
float sx, sy, sdia;
float r, g, b;
float s;
float xSpeed, ySpeed;
float sxSpeed, sySpeed;
 
void setup()
{
 size(400, 400);
 background(255);
 smooth();
 frameRate(100);
 
 x = random(0, width);
 y = random(0, height);
 dia = 100;
 
 sx = -100;
 sy = random(height);
 sdia = 50;
 
 s = 2;
 
 drawMG(x, y, dia);
 drawS(sx, sy, sdia);
 
 xSpeed = 1;
 ySpeed = 1;
 
 sxSpeed = 2;
 sySpeed = 2;
  
 r = 190;
 g = 200;
 b = 211;
}
 
void draw()
{
 prepWindow();
 
 drawMG(x, y, dia);
 drawS(sx, sy, sdia);
 
 moveMG();
 moveS();
}
 
void drawMG(float x, float y, float dia)
{
 stroke(240, 99, 60);
 strokeWeight(s);
 fill(250, 244, 242);
 ellipse(x + dia*.5, y + dia*.5, dia, dia);
 
 stroke(220, 231, 245);
 strokeWeight(s);
 beginShape();
   vertex(x + dia*.15, y + dia*.30);
   vertex(x + dia*.15, y + dia*.75);
 endShape();
 
 beginShape();
   vertex(x + dia*.30, y + dia*.30);
   vertex(x + dia*.30, y + dia*.75);
 endShape();
 
 beginShape();
   vertex(x + dia*.45, y + dia*.30);
   vertex(x + dia*.45, y + dia*.75);
 endShape();
 
 noFill();
 beginShape();
   curveVertex(x + dia*.15, y + dia*.50);
   curveVertex(x + dia*.15, y + dia*.30);
   curveVertex(x + dia*.22, y + dia*.25);
   curveVertex(x + dia*.30, y + dia*.30);
   curveVertex(x + dia*.30, y + dia*.50);
 endShape();
 
 beginShape();
   curveVertex(x + dia*.30, y + dia*.50);
   curveVertex(x + dia*.30, y + dia*.30);
   curveVertex(x + dia*.37, y + dia*.25);
   curveVertex(x + dia*.45, y + dia*.30);
   curveVertex(x + dia*.45, y + dia*.50);
 endShape();
 
 stroke(57, 76, 98);
 beginShape();
   vertex(x + dia*.55, y + dia*.35);
   vertex(x + dia*.55, y + dia*.65);
 endShape();
 
 beginShape();
   vertex(x + dia*.85, y + dia*.55);
   vertex(x + dia*.85, y + dia*.65);
 endShape();
 
 beginShape();
   curveVertex(x + dia*.55, y + dia*.75);
   curveVertex(x + dia*.55, y + dia*.35);
   curveVertex(x + dia*.70, y + dia*.25);
   curveVertex(x + dia*.85, y + dia*.35);
   curveVertex(x + dia*.85, y + dia*.75);
 endShape();
 
 beginShape();
   curveVertex(x + dia*.55, y + dia*.25);
   curveVertex(x + dia*.55, y + dia*.65);
   curveVertex(x + dia*.70, y + dia*.75);
   curveVertex(x + dia*.85, y + dia*.65);
   curveVertex(x + dia*.85, y + dia*.25);
 endShape();
 
 beginShape();
   vertex(x + dia*.75, y + dia*.55);
   vertex(x + dia*.85, y + dia*.55);
 endShape();
}

void drawS(float sx, float sy, float sdia)
{
 stroke(0);
 strokeWeight(s);
 fill(250, 244, 242);
 ellipse(sx + sdia*.5, sy + sdia*.5, sdia, sdia);
 
 noStroke();
 fill(r, g, b);
 ellipse(sx + sdia*.5, sy + sdia*.25, sdia*.66, sdia*.33);
 ellipse(sx + sdia*.5, sy + sdia*.75, sdia*.66, sdia*.33);
 
 fill(250, 244, 242);
 ellipse(sx + sdia*.5, sy + sdia*.30, sdia*.33, sdia*.33);
 ellipse(sx + sdia*.5, sy + sdia*.70, sdia*.33, sdia*.33);
 
 fill(r, g, b);
 quad(sx + sdia*.5, sy + sdia*.49, sx + sdia*.5, sy + sdia*.51, sx + sdia*.20, sy +
sdia*.32, sx + sdia*.32, sy + sdia*.35);
 quad(sx + sdia*.5, sy + sdia*.51, sx + sdia*.5, sy + sdia*.49, sx + sdia*.80, sy +
sdia*.68, sx + sdia*.68, sy + sdia*.65);
}

void prepWindow()
{
  fill(240, 223, 218, 30);
  rect(0, 0, width, height);
}

void moveMG()
{
  x = x + xSpeed;
    
  if (x > width - dia)
  {
    xSpeed = -xSpeed;
  }
  
  else if (x < 0)
  {
    xSpeed = -xSpeed;
  }
  
  y = y + ySpeed;
  
  if (y > height - dia)
  {
    ySpeed = -ySpeed;
  }
  
  else if (y < 0)
  {
    ySpeed = -ySpeed;
  }
}

void moveS()
{
  sx = sx + sxSpeed;
  
  if (sx > width)
  {
    sx = -150;
    sy = sy + random(height);
  }
  
  else if (sy > height - sdia)
  {
    sy = random(height);
  }
}



