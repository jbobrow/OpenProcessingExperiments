
//Sarah Anderson, seanders
//HW3
//Copyright Sarah Anderson CMU 2012 All Rights Reserved

float x,y, di; //4 float variables
//setup happens first and only once, sets the stage
void setup() //all function calls must be inside braces
{
size(400,400); //must be the first setup call 
smooth();
fill(200, 0, 0);
background(50);
x=random(200); //taken from class notes
y=0;
di=random(50,200); //diameter of ellipse
 
noFill();
strokeWeight(2);
stroke(255);
 
//bouding circle
ellipseMode(CENTER);
//frameRate(10);
}

void draw()
{
 
  //background(50);
  noStroke();
  fill(80,20);
  rect(0,0,width,height);
  y=y+3;
  if(y>height)
  {
    y=0;
    x=random(400);
    di=random(50,200);
    x=x+3;
    //background(50);
    
  }
//x=mouseX;
//y=mouseY;
//ellipse(x,y, di, di); //taken from class notes
 

//connect the dots
strokeWeight(8);
// letter S
stroke(211,54,255);
beginShape();
  curveVertex(x-(di*0.05), y-(di*0.55)); //control point
  curveVertex(x-(di*0.1), y-(di*0.49));
  curveVertex(x-(di*0.2), y-(di*0.45));
  curveVertex(x-(di*0.3), y-(di*0.4));
  curveVertex(x-(di*0.4), y-(di*0.3));
  curveVertex(x-(di*0.35), y-(di*0.15));
  curveVertex(x-(di*0.15), y-(di*0.05));
  curveVertex(x-(di*0.1), y+(di*0.05));
  curveVertex(x-(di*0.05), y+(di*0.25));
  curveVertex(x-(di*0.1), y+(di*0.49));
  curveVertex(x-(di*0.3), y+(di*0.4));
  curveVertex(x-(di*0.45), y+(di*0.2));
  curveVertex(x-(di*0.5),y+(di*0.1)); //control point
endShape();
 
//letter E
stroke(255,243,134);
beginShape();
  curveVertex(x+(di*0.35), y-(di*0.35)); //control point
  curveVertex(x+(di*0.2), y-(di*0.45));
  curveVertex(x, y-(di*0.5));
  curveVertex(x,y);
  curveVertex(x+(di*0.15),y);
  curveVertex(x,y);
  curveVertex(x, y+(di*0.5));
  curveVertex(x+(di*0.2), y+(di*0.45));
  curveVertex(x+(di*0.35), y+(di*0.35));  //control point
endShape();
 
//letter A
stroke(103,222,179);
beginShape();
  curveVertex(x+(di*0.6),y); //control point
  curveVertex(x+(di*0.45),y+(di*0.2));
  curveVertex(x+(di*0.5), y);
  curveVertex(x+(di*0.45), y-(di*0.2));
  curveVertex(x+(di*0.3), y-(di*.40));
  curveVertex(x+(di*0.3), y);
  curveVertex(x+(di*0.3), y+(di*0.4));
  curveVertex(x+(di*0.3), y);
  curveVertex(x+(di*0.5), y);
  curveVertex(x+(di*0.35), y+(di*0.35)); //control point
endShape();
}

void keyPressed()
{
  di=random(50,200);
  x=random(400);
 y=random(400); 
}

