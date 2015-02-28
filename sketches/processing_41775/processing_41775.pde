
//Homework 9
//copyright Christina Lee October 2011 Pittsburgh, PA

void setup() {
  size(400, 400, P3D);
  smooth();
  noStroke();
}

void draw()
{ setting();
 drawSpheres();
 drawBoxes();
 drawTriangles();
 drawText(); 
 }

void drawSpheres()
{ pushMatrix();
translate(width/2, height/2+60, mouseY);
fill(mouseX%255, 100, mouseY%255);
rotateX(radians(frameCount));
rotateY(PI*mouseX/width);
sphere(50);
popMatrix();
pushMatrix();
translate(width/2, height/2-60, mouseX);
fill(mouseY%255, 100, mouseX%255);
rotateX( radians(frameCount) );
rotateY(PI*mouseY/height);
sphere(50);
popMatrix();
}

void drawBoxes()
{
  pushMatrix();
translate(mouseX, mouseY, width-mouseX);
rotateZ(radians (frameCount) );
fill(10, mouseY%255);
box(20);
popMatrix();
pushMatrix();
translate(mouseY, mouseX, width-mouseY);
rotateZ(radians (frameCount) );
fill(10, mouseX%255);
box(40);
popMatrix();

pushMatrix();
fill(10, mouseX%255);
translate(width/2, pmouseY);
rotateX(radians(frameCount) );
box(80);
popMatrix();
pushMatrix();

translate(width/2, pmouseX);
rotateY(radians(frameCount) );
fill(10, mouseX%255);
box(50);
popMatrix();

}

void drawTriangles()
{ fill(map(mouseY, 0, height, 100, 255), 0, 255);
  triangle(mouseX, mouseY, 250, 250, 150, 150);
}

void drawText()
{ fill(0, 255, 0);
text("3D IS AWESOME!!", width-mouseX, height-mouseY);
}


void setting()
{ background(255);
  lights();
}
