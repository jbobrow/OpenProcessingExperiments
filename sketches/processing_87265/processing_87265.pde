
/*alexandra merski amerski@andrew.cmu.edu 
copyright alexandra merski 2013*/ 
 
  float pupila = map(mouseX, 0, width, 145, 140);
  float pupilb = map(mouseY, 0, height, 200, 240);
  float pupilc = map(mouseX, 0, width, 375, 200); 
 
void setup() {
  size(400, 400);
  noStroke();
  smooth();
}
 
void draw() 
{
   if (mousePressed){ 
     background(68,63,90);
     fill (255);
       ellipse(160, 200, 95, 25); //left eye
       ellipse(290, 200, 95, 25); //right eye
     fill(0);
      ellipse(160, 200, 20, 20); //left pupil
      ellipse(290, 200, 20, 20); //right pupil
   }
  


  else {
  noStroke ( );
  background(68,63,90);
  fill(255);
  ellipse(160, 200, 95, 75); //left eye
  ellipse(290, 200, 95, 75); //right eye
  fill(0);
  float pupila = map(mouseX, 0, width , 130, 185);
  float pupilb = map(mouseY, 0, height, 185, 215);
  float pupilc = map(mouseX, 0, width , 260, 310);
  ellipse(pupila, pupilb, 20, 20); //left pupil
  ellipse(pupilc, pupilb, 20, 20); //right pupil
  
  }
  
  if (keyPressed)
{
    if ( key == 'c')
  
  noStroke ( );
  background(random (255), random (255), random (255));
  fill (random (255), random (255), random (255));
  ellipse(160, 200, 95, 75); //left eye
  ellipse(290, 200, 95, 75); //right eye
  fill(0);
  float pupila = map(mouseX, 0, width , 130, 185);
  float pupilb = map(mouseY, 0, height, 185, 215);
  float pupilc = map(mouseX, 0, width , 260, 310);
  ellipse(pupila, pupilb, 20, 20); //left pupil
  ellipse(pupilc, pupilb, 20, 20); //right pupil
  
  frameRate (6);

    } 
}



