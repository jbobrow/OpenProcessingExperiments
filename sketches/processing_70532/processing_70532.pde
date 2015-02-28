
//Sarah Anderson, seanders
//hw5, "Dot-toDot"
//Copyright Sarah Anderson at Carnegie Mellon University 2012
//Press Spacebar to start and to refresh the Drawing
//Hold down LEFT mouse button to draw circles
//move mouse to draw circles in a line, slowly for consistancy
// Draw from initials to initials like connect-the-dots


float wd,ht, x1, y1, diC; //for circle
float x, y, di; //for initials
color colC, colI, colE;

void setup()
{
size(400,400);
background(255);
x1=0;
y1=0;
wd=40;
ht=40;
di=50;
x=random(400);
y=random(400);
diC=10;
colC=color(random(255), random(255), random(255));
colI=color(random(255), random(255), random(255));
colE=color(255);
frameRate(5);
}

void draw()
{
circle(mouseX, mouseY , diC, colC);//uses x1 and y1
eraser (mouseX, mouseY, diC, colE);//uses x1 and y1
}

void mouseDragged() //adapted from Tony Zhang's HW5 code
{
if (mouseButton == LEFT)
  {
   circle(mouseX, mouseY , diC, colC);
  }
  else
  {
   eraser (mouseX, mouseY, diC, colE); 
  }
}  

void keyPressed() //adapted from Tony Zhang's HW5 code
{
if (key== ' ')
  {
   fill(255);
   noStroke();
   rect(0, 0, width, height);
   colC=color(random(255), random(255), random(255));
   colI=color(random(255), random(255), random(255));
   newInitials(random(400), random(400), di, colI);
  }
}

void newBackground(color colE)
{
background(colE);
}

void newInitials(float x, float y, float di, color colI)
{
initials(random(400), random(400), di, colI);
initials(random(400), random(400), di, colI);
initials(random(400), random(400), di, colI);
initials(random(400), random(400), di, colI);
initials(random(400), random(400), di, colI);
initials(random(400), random(400), di, colI);  
}

void eraser(float x1, float y1, float diC, color colE)
{
fill(colE);
noStroke();
ellipse(x1, y1, diC, diC);
}

void circle(float x1,float y1, float diC, color colC)
{
fill(colC);
noStroke();
ellipse(x1, y1, diC, diC);
}


void initials(float x, float y, float di, color colI)
{ 
noFill();
strokeWeight(4);
// letter S
stroke(colI);
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
stroke(colI);
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
stroke(colI);
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


