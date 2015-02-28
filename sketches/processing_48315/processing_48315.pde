

void setup () {
  
  size (800,600);
  smooth ();
  
}


void draw () {
  
  background (200,250,255);
  
  fill(255,255,255);
  ellipse (400,300,360,360);
  ellipse (350,300,60,60);
  ellipse (450,300,60,60);
  
  float ax = map (mouseX, 0, width, 345, 360);
  float ay = map (mouseY, 0, height, 290, 310);
  
  fill(0,0,0);
  ellipse (ax,ay,40,40);
  
  float bx = map (mouseX, 0, width, 445, 460);
  float by = map (mouseY, 0, height, 290, 310);
  
  ellipse (bx,by,40,40);
  
  fill (240,250,220);
  rect (430,475,20,30);
  rect (350,475,20,30);
  
  ellipse (520,500,190,25);
  ellipse (280,500,190,25);
  
  ellipse (210,320,40,40);
  ellipse (590,320,40,40);
  ellipse (210,350,30,30);
  ellipse (590,350,30,30);
  ellipse (210,370,20,20);
  ellipse (590,370,20,20);
  

  
  
}

