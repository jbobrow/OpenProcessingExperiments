
//Sarah Anderson, seanders
//EMS, 4D, cat for internet

//global variables
float x,y,di,xSpeed,ySpeed,x1,y1;


void setup()
{
size(450,450);
background(149,192,242);
x=0;
y=0;
x1=0;
y1=0;
di=150;
xSpeed=2;
ySpeed=3;
}

void draw()
{ 
setupWindow();  
drawCat(x,y,di);
rollCat();

}

void setupWindow()
{
fill(149,192,242,100);
noStroke();
rect(0,0,width,height);
}

void rollCat()
{
x1=x1+xSpeed;
y1=y1+ySpeed;
  if (x1>width)
  {
  xSpeed=-xSpeed; 
  }
  else if (x1<0)
  {
  xSpeed=-xSpeed;  
  }
  
  if (y1>height)
  {
   ySpeed= -ySpeed; 
  }
  else if (y1<0)
  {
   ySpeed=-ySpeed; 
  }
}


void drawCat(float x, float y, float di)
{ 
translate(x1,y1);
rotate(radians(frameCount*4));
stroke(0);
strokeWeight(4);  
fill(152,55,9);
ellipse(x,y,di,di);  
noFill();
//cat arm
beginShape();
curveVertex(x-(di*0.15),y-(di*0.35));
curveVertex(x-(di*0.2),y-(di*0.3));
curveVertex(x-(di*0.4), y-(di*0.1));
curveVertex(x-(di*0.4), y+(di*0.05));
curveVertex(x-(di*0.25), y+(di*0.05));
curveVertex(x-(di*0.1),y-(di*0.1));
curveVertex(x+(di*0.1), y-(di*0.1));
curveVertex(x+(di*0.15),y-(di*0.1));
curveVertex(x+(di*0.15),y-(di*0.15));
curveVertex(x+(di*0.1), y-(di*0.2));
curveVertex(x-(di*0), y-(di*0.2));
curveVertex(x-(di*0.05), y-(di*0.2));
endShape();
//cat leg,face
beginShape();
curveVertex(x-(di*0.1),y-(di*0.3));
curveVertex(x-(di*0.15),y+(di*0.25));
curveVertex(x-(di*0.25),y+(di*0.15));
curveVertex(x-(di*0.25),y+(di*0.05));
curveVertex(x-(di*0.1),y-(di*0.1));
curveVertex(x+(di*0.1),y-(di*0.1));
curveVertex(x+(di*0.15),y-(di*0.1));
curveVertex(x+(di*0.2),y-(di*0.05));
curveVertex(x+(di*0.25),y-(di*0));
curveVertex(x+(di*0.3),y+(di*0.05));
curveVertex(x+(di*0.35),y+(di*0.05));
curveVertex(x+(di*0.4),y-(di*0));
curveVertex(x+(di*0.4),y-(di*0.05));
curveVertex(x+(di*0.45),y-(di*0.2));
curveVertex(x+(di*0.4),y-(di*0.3));
curveVertex(x+(di*0.35),y-(di*0.35));
curveVertex(x+(di*0.3),y-(di*0.4));
curveVertex(x+(di*0.25),y-(di*0.45));
curveVertex(x+(di*0.25),y-(di*0.4));
curveVertex(x+(di*0.25),y-(di*0.3));
curveVertex(x+(di*0.3),y-(di*0.25));
curveVertex(x+(di*0.35),y-(di*0.2));
endShape();
//cat mouth
beginShape();
curveVertex(x+(di*0.25),y+(di*0.05));
curveVertex(x+(di*0.25),y-(di*0));
curveVertex(x+(di*0.25),y-(di*0.05));
curveVertex(x+(di*0.25),y-(di*0.1));
curveVertex(x+(di*0.25),y-(di*0.15));
endShape();
//cat eye
beginShape();
curveVertex(x+(di*0.4),y-(di*0));
curveVertex(x+(di*0.4),y-(di*0.05));
curveVertex(x+(di*0.4),y-(di*0.1));
curveVertex(x+(di*0.4),y-(di*0.15));
curveVertex(x+(di*0.35),y-(di*0.2));
endShape();
//cat nose
beginShape();
curveVertex(x+(di*0.35),y+(di*0.1));
curveVertex(x+(di*0.35),y+(di*0.05));
curveVertex(x+(di*0.35),y-(di*0));
curveVertex(x+(di*0.4),y-(di*0));
curveVertex(x+(di*0.45),y-(di*0));
endShape();
}
