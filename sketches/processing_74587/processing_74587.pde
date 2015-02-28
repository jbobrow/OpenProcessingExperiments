
//Robert Wohlforth rwohlfor
//Homework 7 - "Space Cheese"
//Copyright Pittsburgh 2012

//Guide the rocket with your mouse to blow up the cheese.

float CheeseX, CheeseY, CheeseDX = random (-3,3), CheeseDY = random (-3,3), CheeseHeight, RocketX, RocketY, RocketDX, RocketDY, RocketHeight, impactX, impactY, debrisX1, debrisX2, debrisX3, debrisY1, debrisY2, debrisY3, debrisDX1 = random(-1,1), debrisDX2 = random(-1,1), debrisDX3 = random(-1,1), debrisDY1 = random(-1,1), debrisDY2 = random(-1,1), debrisDY3 = random(-1,1);
int count;
boolean collision = false;

void setup ()
{size (400,400);
CheeseHeight = width/8;
CheeseX = width/2;
CheeseY = height/2;
backgroundSet();
}

void draw ()
{
  backgroundSet();
  moveCheese();
  moveRocket();
  wrapRocket();
  bounceCheese();
  if(collision == true)
  {drawExplosion();
  }
  else
  {collision();
  drawCheese();
  drawRocket();
  }
}

void backgroundSet()
{background (0);
fill (255);
text ("Cheeses Eliminated: " + count, width/2+width/20, height-height/20);
text (int(millis()/1000), width/20, height-height/20);
if (collision == true && frameCount%10 == 1)
{background (255);
}
}

void moveCheese()
{CheeseX = CheeseX + CheeseDX;
CheeseY = CheeseY + CheeseDY;
}

void moveRocket()
{
RocketDX = map(mouseX-(width/2), -(width/2), width/2, -2, 2);
RocketDY = map(mouseY -(height/2), -(height/2), height/2, -2, 2);
RocketX = RocketX + RocketDX;
RocketY = RocketY + RocketDY;
}

void wrapRocket()
{if(RocketX < -RocketHeight/2)
{RocketX = width + RocketHeight/4;
}
if (RocketX > width + RocketHeight/2)
{RocketX = -RocketHeight/4;
}
if (RocketY > height+1)
{RocketY = -RocketHeight;
}
if (RocketY < -RocketHeight - 1)
{RocketY = height;
}
}


void bounceCheese()
{
if (CheeseY+CheeseHeight*.6 > height)
{CheeseY = CheeseY-1;
CheeseDY = -CheeseDY;
}
if (CheeseY-CheeseHeight*.5 < 0)
{CheeseY = CheeseY+1;
CheeseDY = -CheeseDY;
}
if (CheeseX+CheeseHeight*.4 > width)
{CheeseX = CheeseX-1;
CheeseDX = -CheeseDX;
}
if (CheeseX-CheeseHeight*.4 < 0)
{CheeseX = CheeseX+1;
CheeseDX = -CheeseDX;
}
}

void collision()
{
  if (RocketX < CheeseX+CheeseHeight*.4 && RocketX > CheeseX-CheeseHeight*.4 && RocketY < CheeseY+CheeseHeight*.6 && RocketY > CheeseY-CheeseHeight*.5)
  {collision = true;
  count++;
  impactX = RocketX;
impactY = RocketY;
  debrisX1 = impactX;
debrisY1 = impactY;
debrisX2 = impactX;
debrisY2 = impactY;
debrisX3 = impactX;
debrisY3 = impactY;
CheeseX = random (0, width);
CheeseY = random (0, height); 
CheeseDX = random (-3,3);
CheeseDY = random (-3,3);
  }
}

void drawExplosion()
{
  if (debrisX1 < 0 || debrisY1 < 0 || debrisX2 < 0 || debrisY2 < 0 || debrisX3 < 0 || debrisY3 < 0 || debrisX1 > width || debrisY1 > width || debrisX2 > width || debrisY2 > width || debrisX3 > width || debrisY3 > width)
 {collision = false;
 }
else
{
  debrisX1 = debrisX1 + debrisDX1;
  debrisY1 = debrisY1 + debrisDY1;
  debrisX2 = debrisX2 + debrisDX2;
  debrisY2 = debrisY2 + debrisDY2;
  debrisX3 = debrisX3 + debrisDX3; 
  debrisY3 = debrisY3 + debrisDY3;
  
  fill (#EDE202);
beginShape();
vertex(debrisX1, debrisY1);
vertex(debrisX1 + width/16, debrisY1);
vertex(debrisX1, debrisY1 + width/16);
endShape();

beginShape();
vertex(debrisX2, debrisY2);
vertex(debrisX2 - width/16, debrisY2);
vertex(debrisX2, debrisY2 + width/16);
endShape();

beginShape();
vertex(debrisX3, debrisY3);
vertex(debrisX3 + width/16, debrisY3);
vertex(debrisX3, debrisY3 - width/16);
endShape();
}
}

void drawCheese()
{float Unit = CheeseHeight/5;
  fill (#EDE202);
beginShape();
vertex(CheeseX-Unit*2, CheeseY-Unit*2);
vertex(CheeseX, CheeseY+Unit*3);
vertex(CheeseX+Unit*2, CheeseY-Unit*2);
curveVertex(CheeseX + Unit*7, CheeseY);
curveVertex(CheeseX+Unit*2, CheeseY-Unit*2);
curveVertex(CheeseX-Unit*2, CheeseY-Unit*2);
curveVertex(CheeseX - Unit*7, CheeseY);
endShape();
fill (#FAF597);
beginShape();
curveVertex(CheeseX-Unit*5.8, CheeseY+Unit*2.5);
curveVertex(CheeseX-Unit, CheeseY+Unit*.5);
curveVertex(CheeseX-Unit*1.4, CheeseY-Unit*.5);
curveVertex(CheeseX-Unit*6, CheeseY+Unit*1.5);
endShape();
beginShape();
curveVertex(CheeseX+Unit*6, CheeseY+Unit*1.5);
curveVertex(CheeseX+Unit*1.4, CheeseY-Unit*.5);
curveVertex(CheeseX+Unit*1.8, CheeseY-Unit*1.5);
curveVertex(CheeseX+Unit*6, CheeseY+Unit*.5);
endShape();
ellipse(CheeseX+Unit*.5, CheeseY+Unit*.5, Unit*.8, Unit*.8);
ellipse(CheeseX-Unit*.2, CheeseY-Unit*1.2, Unit*.8, Unit*.8);
}

void drawRocket()
{
 RocketHeight = width/8;
 float unit = RocketHeight / 4;
 fill(255);
 translate(RocketX,RocketY);
if (RocketDX > 0)
{if (RocketDY > 0)
{rotate (.75*PI);
}
else if (RocketDY < 0)
{rotate (.25*PI);
}
}
if (RocketDX < 0)
{if (RocketDY > 0)
{rotate (1.25*PI);
}
else if (RocketDY < 0)
{rotate (1.75*PI);
}
}
 beginShape();
 vertex(-1.25*unit,RocketHeight);
 vertex(1.25*unit,RocketHeight);
 vertex(.75*unit, 3*unit);
 vertex(.5*unit, 2*unit);
 vertex(-.5*unit,2*unit);
 vertex(-.75*unit, 3*unit);
 vertex(-1.25*unit,RocketHeight);
 endShape();
 fill(255,0,0);
 beginShape();
 vertex(0,0);
 vertex(-.5*unit,unit);
 vertex(-.5*unit,RocketHeight);
 vertex(.5*unit,RocketHeight);
 vertex(.5*unit,unit);
 vertex(0,0);
 endShape();
}

