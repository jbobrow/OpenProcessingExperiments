
//Homework 9, October 2011
//Copyright Manuela Kind, CMU Pittsburgh PA

//----------variables---------


//-----------setup------------

void setup()
{
size (600,600,P3D);
sphereDetail(10);
}

//------------draw------------

void draw()
{
background (50,50,100);
drawSpheres();  
drawBoxes();  
circles();
rects();
spacing();
}

//----------------------------
void drawSpheres()
{
strokeWeight (1);
stroke(250,200,150,255);
noFill();
translate(width/2, height/2);
 
 pushMatrix();
 translate(0,0, pmouseX);
 sphere(100);
 popMatrix();
 
 pushMatrix();
  translate(50-mouseX/2,75+mouseY/2,100);
  sphere(25);
 popMatrix();
  
 pushMatrix();
  translate(-50+mouseX/2,-25+mouseY/2,-150);
  sphere(25);  
 popMatrix();

}
//----------------------------

void drawBoxes()
{
  noFill();
  stroke(200,200,50);

 pushMatrix();
translate(50,-pmouseY,-50);
rotateY(radians(frameCount) );
  box (100);
 popMatrix();

 pushMatrix();
  translate(-mouseY,100,50);
rotateX(radians(frameCount) );
  box (50);
 popMatrix();

}


//---------ellipses----------
void circles()
{
noStroke();
fill(100,150,100,150*mouseX/255);
ellipseMode(CENTER);

ellipse(100-mouseX,25, 30,30);
ellipse(25-mouseX,-25, 30,30);
ellipse(50-mouseX,75, 30,30);
ellipse(-mouseX,-75, 30,30);
}

//----------rects------------
void rects
()
{
fill(250,200,250,100*mouseX/255);
noStroke();
rectMode(CENTER);

rect(25+mouseX,25, 15,30);
rect(-50+mouseX,-25, 15,15);
rect(-50+mouseX,75, 30,15);
rect(mouseX,-75, 20,20);
}

void spacing()
{
fill(255);
translate(-mouseX,-mouseY, mouseX);
textAlign(CENTER);
text("galavanting in space", width/2, height/2);
}

