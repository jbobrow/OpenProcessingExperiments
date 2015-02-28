
//Homework Assignment 6
//51257:A
//Copyright 2012 Patrick Clancy pjclancy@andrew.cmu.edu

float x, y, wd, ht, d;
float bex, bey, bexSpeed, beySpeed;
float tex, tey, texSpeed, teySpeed;


void setup( )
{
size(500, 500);
smooth( );
d = 100;
background(20, 40, 90);

x=100;
y=100;
wd=200;
ht=200;

bex= random(width);
bey= random(height);
bexSpeed= random(1, 8);
beySpeed= random(1, 8);

tex = random(width);
tey = random(height);
texSpeed = random(1, 8);
teySpeed = random(1, 8);

}

void draw()
{
  startWindow( );
  initials1( bex, bey, d );
  initials2( tex, tey, d );
  moveInitials1( );
  moveInitials2( );
}

void moveInitials1( )
{
  bex = bex + bexSpeed;
  if (bex > 0)
  {
    bexSpeed = bexSpeed * -.5;
  }
  else if (bex < 0)
  { bexSpeed = bexSpeed * -.5;
  }
  bey = bey + beySpeed;
  if (bey > height)
  {beySpeed = -beySpeed;
  }
  else if (bey < 0)
  {
    beySpeed = -beySpeed;
  }
  
}
void moveInitials2()
{
  tex = tex + texSpeed;
  if (tex > width + 100)
  {
    tex = 0;
  }
 
  tey = tey + teySpeed;
  if (tey > height + 100)
  {
    tey = 0;
  }
}

void mouseMoved( )
{
  x = mouseX;
  y = mouseY;
}
 

void initials1(float x, float y, float d) 
{
//circle 1
stroke(26, 51, 0);
strokeWeight(.50);
fill(165, 235, 85);
ellipseMode( CENTER ); // Circle 1
ellipse( x, y, wd*.5, ht*.5 );
 
stroke(26, 51, 0);
fill(10, 225, 170);
strokeWeight(.50);
ellipseMode( CENTER ); // Circle 2
ellipse( x, y, wd*.75, ht*.75 );
 
fill(135, 120 ,65);
stroke(90,73,0);
strokeWeight(2.25);
ellipseMode( CENTER ); // Circle 3
ellipse( x, y, wd*.8, ht*.8 );

noFill();
stroke(20, 220, 10);
strokeWeight(10);
beginShape(); // P vertical line
curveVertex(x-(.1*wd), y-(.3*ht));
curveVertex(x-(.1*wd), y-(.3*ht));
curveVertex(x-(.25*wd), y);
curveVertex(x-(.1*wd), y+(.3*ht));
curveVertex(x-(.1*wd), y+(.3*ht));
endShape();
 
stroke(20,220,10);
strokeWeight(10);
beginShape(); // P curve
curveVertex(x-(.25*wd), y-(.15*ht));
curveVertex(x-(.1*wd), y-(.3*ht));
curveVertex(x, y-(.25*wd));
curveVertex(x-(.25*wd), y);
curveVertex(x-(.25*wd), y);
endShape();
  
stroke(50,135,0);
strokeWeight(10);
beginShape(); // J top Horizontal line
vertex(x-(.2*wd), y-(.175*ht));
vertex(x+(.225*wd), y-(.175*ht));
endShape();
 
beginShape(); // J bottom line
vertex(x-(.25*wd), y+(.175*ht));
vertex(x-(.15*wd), y+(.175*ht));
endShape();
 
beginShape(); // J vertical line
vertex(x+(.075*wd), y-(.175*ht));
vertex(x-(.15*wd), y+(.175*ht));
endShape();

stroke(20,220,10);
strokeWeight(10);
beginShape(); // C Curve
curveVertex(x+(.1*wd), y-(.3*ht));
curveVertex(x+(.1*wd), y-(.3*ht));
curveVertex(x+(.25*wd), y);
curveVertex(x+(.1*wd), y+(.3*ht));
curveVertex(x+(.1*wd), y+(.3*ht));
endShape();
}

void startWindow()
{
  fill(60, 255);
  rect(0, 0, width, height);
}

void initials2(float x, float y, float d) 
{
//circle 1
stroke(26, 51, 0);
strokeWeight(.50);
fill(15, 35, 85);
ellipseMode( CENTER ); // Circle 1
ellipse( x, y, wd*.5, ht*.5 );
 
stroke(26, 51, 0);
fill(10, 25, 70);
strokeWeight(.50);
ellipseMode( CENTER ); // Circle 2
ellipse( x, y, wd*.75, ht*.75 );
 
fill(5, 20 ,65);
stroke(90,173,0);
strokeWeight(2.25);
ellipseMode( CENTER ); // Circle 3
ellipse( x, y, wd*.8, ht*.8 );

noFill();
stroke(20, 220, 10);
strokeWeight(10);
beginShape(); // P vertical line
curveVertex(x-(.1*wd), y-(.3*ht));
curveVertex(x-(.1*wd), y-(.3*ht));
curveVertex(x-(.25*wd), y);
curveVertex(x-(.1*wd), y+(.3*ht));
curveVertex(x-(.1*wd), y+(.3*ht));
endShape();
 
stroke(20,220,10);
strokeWeight(10);
beginShape(); // P curve
curveVertex(x-(.25*wd), y-(.15*ht));
curveVertex(x-(.1*wd), y-(.3*ht));
curveVertex(x, y-(.25*wd));
curveVertex(x-(.25*wd), y);
curveVertex(x-(.25*wd), y);
endShape();
  
stroke(50,135,0);
strokeWeight(10);
beginShape(); // J top Horizontal line
vertex(x-(.2*wd), y-(.175*ht));
vertex(x+(.225*wd), y-(.175*ht));
endShape();
 
beginShape(); // J bottom line
vertex(x-(.25*wd), y+(.175*ht));
vertex(x-(.15*wd), y+(.175*ht));
endShape();
 
beginShape(); // J vertical line
vertex(x+(.075*wd), y-(.175*ht));
vertex(x-(.15*wd), y+(.175*ht));
endShape();

stroke(20,220,10);
strokeWeight(10);
beginShape(); // C Curve
curveVertex(x+(.1*wd), y-(.3*ht));
curveVertex(x+(.1*wd), y-(.3*ht));
curveVertex(x+(.25*wd), y);
curveVertex(x+(.1*wd), y+(.3*ht));
curveVertex(x+(.1*wd), y+(.3*ht));
endShape();
}

void keyPressed()
{
if (keyCode == ENTER)
  {
     bex = random(width);
  bey = random(height);
  bexSpeed = random(1,8);
  beySpeed = random(1,8);
   
  tex = random(width);
  tey = random(height);
  teySpeed = random(1,8);
  teySpeed = random(1,8);
  }
}


//saveframe("hw6.jpeg");


