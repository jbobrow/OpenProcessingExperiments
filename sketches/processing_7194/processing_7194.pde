
int pupilsize = 30;
int whiteY= 171;
int whitewidth= 120;
int whiteheight= 90;
float x = 0;
float y = 0;
float xx = 0;
float yy = 0;
float easing = .2; 

void setup () {
  size (640, 480);
  smooth ();
}

void draw () {
  background (0);
  
  if (mousePressed){
     
  //whites
  noStroke ();
  fill (255);
  ellipse (238, whiteY, whitewidth, whiteheight);
  ellipse (387, whiteY, whitewidth, whiteheight);
  
  //eye color
  float speed = dist (mouseX, mouseY, pmouseX, pmouseY);
  strokeWeight (12);
  stroke (188, 39, 39, speed * 10);

  
  //lefthand pupil
  float mx = constrain (mouseX, 210, 265);
  float my = constrain (mouseY, 155, 187);
  x += (mx-x) * easing;
  y += (my-y) * easing;
  fill (0);
  ellipse (x, y, pupilsize, pupilsize);

  //righthand pupil
  float mxx = constrain (mouseX, 360, 415);
  float myy = constrain (mouseY, 155, 187);
  xx += (mxx-xx) * easing;
  yy += (myy-yy) * easing;
  fill (0);
  ellipse (xx, yy, pupilsize, pupilsize);
  
  //red eyes
  stroke (0);
  fill (0);
  triangle (110, 120, 320, 160, 470, 120);
    
  }
  
  else{
    
  //whites
  noStroke ();
  fill (255);
  ellipse (238, whiteY, whitewidth, whiteheight);
  ellipse (387, whiteY, whitewidth, whiteheight);
  
  //eye color
  strokeWeight (12);
  stroke (20, 180, 39);
  
  //lefthand pupil
  float mx = constrain (mouseX, 210, 265);
  float my = constrain (mouseY, 155, 187);
  x += (mx-x) * easing;
  y += (my-y) * easing;
  fill (0);
  ellipse (x, y, pupilsize, pupilsize);


  //righthand pupil
  float mxx = constrain (mouseX, 360, 415);
  float myy = constrain (mouseY, 155, 187);
  xx += (mxx-xx) * easing;
  yy += (myy-yy) * easing;
  fill (0);
  ellipse (xx, yy, pupilsize, pupilsize);
    
  }
    
}

