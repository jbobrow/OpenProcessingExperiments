


void setup () {
  size (400, 400);
  background (255);
  smooth ();
 
}




void draw () {
  drawBrush ();
  drip ();
}

void drawBrush () {
 
  stroke (0);
  strokeWeight (mouseY*0.05);
  line ( mouseX, mouseY, pmouseX, pmouseY);
 
}


void drip () {
 
  float goingX = mouseX;
  float goingY = mouseY - random (100);
  float treeThick = ((abs (mouseX-pmouseX))*0.3);
  int depth = abs (mouseY-100);
  stroke (0);
  strokeWeight (treeThick);
  line (mouseX, mouseY, goingX, goingY);
  /*line (goingX, goingY, goingX+20, goingY-10);
  line (goingX, goingY, goingX-10, goingY-40);*/
 
}

void mousePressed () {
  float diam= random (20, 50);
  fill (0);
  ellipse (mouseX, mouseY, diam, diam);
  stroke (0);
  strokeWeight (5);
  line (mouseX, mouseY, mouseX, mouseY+random (100,250));
 

  
/* float centreX = random (0, 400);
 float centreY = random (0, 200);
 
 stroke ( random (255),random (255),random (255));
 strokeWeight (random (10));
 
 line (centreX, centreY, centreX+random (100), centreY+random (100));
  line (centreX, centreY, centreX-random (100), centreY+random (100));
   line (centreX, centreY, centreX+random (100), centreY-random (100));
    line (centreX, centreY, centreX-random (100), centreY-random (100));
    line (centreX, centreY, centreX+random (100), centreY+random (100));
  line (centreX, centreY, centreX-random (100), centreY+random (100));
   line (centreX, centreY, centreX+random (100), centreY-random (100));
    line (centreX, centreY, centreX-random (100), centreY-random (100));*/
    
}
    


  
  
  

