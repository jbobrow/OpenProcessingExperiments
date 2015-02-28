
//Sarah Anderson, seanders
//hw5
//copyright Sarah Anderson @ Carnegie Mellon University 2012, all rights reserved
//move initials around with the mouse
//press spacebar to change the size and colors



float x,y,di;
color col, col1, col2, col3;


void setup()
{
size(400, 400);
background(0);
x=random(400);
y=random(400);
di=random(20,300);
col=color(0,0,0);
col1=color(random(255),random(255), random(255));
col2=color(random(255),random(255), random(255));
col3=color(random(255),random(255), random(255));
}

void draw()
{
initials(mouseX, mouseY, di, col1, col2, col3);  
backHaze(col);
}

void backHaze(color col)
{
noStroke();  
fill(col,60);
rect(0,0,width, height);
}

void keyPressed()
{
  if (key==' ')
   {
   col1=color(random(255),random(255),random(255));
   col2=color(random(255),random(255),random(255));
   col3=color(random(255),random(255),random(255));
   di=random(20,300);
   }  
}

void initials(float x, float y, float di, 
  color col1,color col2,color col3)
{
noFill();
strokeWeight(4);
 // letter S
stroke(col1);
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
stroke(col2);
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
stroke(col3);
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

