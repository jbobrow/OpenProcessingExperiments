
//homework 6
//Sharon Rubin
//srrubin@andrew.cmu.edu
//copyright © Sharon Rubin September 2012 Pittsburgh PA 15213 All Rights Reserved

//global variables
float lionx, liony, lionwd, lionht, lionearwd, lionearht, eyewd, eyeht, lionspeedx, lionspeedy, preyx, preyy, preywd, preyht, preyearwd, preyearht, preyspeedx, preyspeedy;
;
color lionface, eye, mouth, lionmane, preyface, horns;


void setup()
{
  size(400, 600);
  smooth();
  lionx = 200;
  liony = 50;
  lionwd = 100;
  lionht = 100;
  lionface = color(232, 186, 59);
  lionmane = color(142, 109, 1);
  lionearwd = 20;
  lionearht = 20;
  eyewd = 10;
  eyeht = 10;
  eye = color(0);
  mouth = color(0);
  lionspeedx = 1;
  lionspeedy = 1;
  preyx = 200;
  preyy = 300;
  preywd = 60;
  preyht = 80;
  preyface = color(180, 135, 46);
  horns = color(77, 56, 16);
  preyearwd = 15;
  preyearht = 15;
  preyspeedx = 3;
  preyspeedy = 3;
}

void draw()
{
  bground();
  drawPrey();
  movePrey();
  bouncePrey();
  drawLion();
  moveLion();
  bounceLion();
}

void bground()
{
  background(99, 113, 10);
}

void drawPrey()
{
  
  //prey horns
  noStroke();
  fill(horns);
  //left horn
  triangle(preyx-preywd/3, preyy-preyht/3, preyx-preywd/5, preyy-1.25*preyht, preyx-preywd/10,  preyy-preyht/3);
  //right horn
  triangle(preyx+preywd/3, preyy-preyht/3, preyx+preywd/5, preyy-1.25*preyht, preyx+preywd/10,  preyy-preyht/3);
  
  //prey ears
  fill(preyface);
  //left ear
  ellipse(preyx-preywd/2.5, preyy-preyht/3, preyearwd, preyearht);
  //right ear
  ellipse(preyx+preywd/2.5, preyy-preyht/3, preyearwd, preyearht);
  
  //prey face
  ellipseMode(CENTER);
  noStroke();
  fill(preyface);
  ellipse(preyx, preyy, preywd, preyht);
  
  //prey eyes
  fill(eye);
  ellipse(preyx - preywd/3, preyy, eyewd, eyeht);
  ellipse(preyx + preywd/3, preyy, eyewd, eyeht);
    
  //prey nose
  triangle(preyx, preyy + preyht/4, preyx - preywd/14, preyy + preyht/6, preyx + preywd/14, preyy + preyht/6);
  
  //prey mouth
  stroke(mouth);
  strokeWeight(1);
  noFill();
  arc(preyx - preywd/9.5, preyy + preyht/4, preywd/5, preyht/5, 0, PI);
  arc(preyx + preywd/9.5, preyy + preyht/4, preywd/5, preyht/5, 0, PI);
}

void movePrey()
{
  preyx = preyx + preyspeedx;
  preyy = preyy + preyspeedy;
}

void bouncePrey()
{
  if ((preyx>width) || (preyx<0))
  {
    preyspeedx = preyspeedx*-1;
  }

  if ((preyy>height) || (preyy<0))
  {
    preyspeedy = preyspeedy*-1;
  }
}

void drawLion()
{
  //lion mane
  noStroke();
  fill(lionmane);
  //N Mane
  triangle(lionx-sqrt(3*lionwd/2), liony-lionht/2, lionx, liony-lionht, lionx+sqrt(3*lionwd/2), liony-lionht/2);
  //NW Mane
  triangle(lionx-lionwd/2, liony-sqrt(3*lionht/2), lionx-.75*lionwd, liony-.75*lionht, lionx-sqrt(3*lionwd/2), liony-lionht/2);
  //W Mane
  triangle(lionx-lionwd/2, liony+sqrt(3*lionht/2), lionx-lionwd, liony, lionx-lionwd/2, liony-sqrt(3*lionht/2));
  //SW Mane
  triangle(lionx-sqrt(3*lionwd/2), liony+lionht/2, lionx-.75*lionwd, liony+.75*lionht, lionx-lionwd/2, liony+sqrt(3*lionht/2));
  //S Mane
  triangle(lionx-sqrt(3*lionwd/2), liony+lionht/2, lionx, liony+lionht, lionx+sqrt(3*lionwd/2), liony+lionht/2);
  //SE Mane
  triangle(lionx+sqrt(3*lionwd/2), liony+lionht/2, lionx+.75*lionwd, liony+.75*lionht, lionx+lionwd/2, liony+sqrt(3*lionht/2));
  //E Mane
  triangle(lionx+lionwd/2, liony-sqrt(3*lionht/2), lionx+lionwd, liony, lionx+lionwd/2, liony+sqrt(3*lionht/2));
  //NE Mane
  triangle(lionx+lionwd/2, liony-sqrt(3*lionht/2), lionx+.75*lionwd, liony-.75*lionht, lionx+sqrt(3*lionwd/2), liony-lionht/2);

  //lion ears
  fill(lionface);
  //left ear
  ellipse(lionx-lionwd/2.5, liony-lionht/3, lionearwd, lionearht);
  //right ear
  ellipse(lionx+lionwd/2.5, liony-lionht/3, lionearwd, lionearht);

  //lion face
  ellipseMode(CENTER);
  noStroke();
  fill(lionface);
  ellipse(lionx, liony, lionwd, lionht);

  //lion eyes
  fill(eye);
  ellipse(lionx - lionwd/3, liony, eyewd, eyeht);
  ellipse(lionx + lionwd/3, liony, eyewd, eyeht);

  //lion nose
  triangle(lionx, liony + lionht/4, lionx - lionwd/14, liony + lionht/6, lionx + lionwd/14, liony + lionht/6);

  //lion mouth
  stroke(mouth);
  strokeWeight(1);
  noFill();
  arc(lionx - lionwd/9.5, liony + lionht/4, lionwd/5, lionht/5, 0, PI);
  arc(lionx + lionwd/9.5, liony + lionht/4, lionwd/5, lionht/5, 0, PI);
  
  //lion whiskers
  //left whiskers
  line(lionx-lionwd/3, liony+lionht/7, lionx-lionwd/1.5, liony+lionht/10);
  line(lionx-lionwd/3, liony+lionht/6, lionx-lionwd/1.5, liony+lionht/6);
  line(lionx-lionwd/3, liony+lionht/5.5, lionx-lionwd/1.5, liony+lionht/4);
  //right whiskers
  line(lionx+lionwd/3, liony+lionht/7, lionx+lionwd/1.5, liony+lionht/10);
  line(lionx+lionwd/3, liony+lionht/6, lionx+lionwd/1.5, liony+lionht/6);
  line(lionx+lionwd/3, liony+lionht/5.5, lionx+lionwd/1.5, liony+lionht/4);  
  
}

void moveLion()
{
  lionx = lionx + lionspeedx;
  liony = liony + lionspeedy;
}

void bounceLion()
{
  if ((lionx>width) || (lionx<0))
  {
    lionspeedx = lionspeedx*-1;
  }

  if ((liony>height) || (liony<0))
  {
    lionspeedy = lionspeedy*-1;
  }
}

void keyPressed()
{
  if (key == 'f') //press lowercase f
  {
    lionspeedx = lionspeedx + 1;
    lionspeedy = lionspeedy + 1;
  }
  
  if (key == 's') //press lowercase s
  {
    lionspeedx = lionspeedx-1;
    lionspeedy = lionspeedy-1;
  }
  
  if (key == 'r') //press lowercase r
  {
    lionx = random(0, 400);
    liony = random(0, 600);
    preyx = random(0, 400);
    preyy = random(0, 600);
    lionspeedx = random(0, 10);
    lionspeedy = random(0, 10);
    preyspeedx = random(0, 10);
    preyspeedy = random(0, 10);
  }
}



