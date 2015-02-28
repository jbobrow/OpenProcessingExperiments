
void setup () {
  smooth ();
  size (500, 500);
}

void draw () {
  
  fill (255);
  rect (0, 0, 500, 500);
  
  if (mousePressed) {
    
  stroke (0);
  //strokeWeight ( dist(mouseX, mouseY, pmouseX, pmouseY) );
  fill (0);
  
  ellipse (mouseY/3, height-mouseY, 50,50);
  stroke (0);
  ellipse (250, 250, 110+( dist(mouseX, mouseY, pmouseX, pmouseY)/4 ), 110+( dist(mouseX, mouseY, pmouseX, pmouseY)/4 ));
  stroke (0);
  ellipse (129+mouseY, width-mouseX, 57, 57);
  ellipse (mouseX/2, mouseY/3, 30, 30);
    
    
  }
  
  else {
  
  stroke (0);
  strokeWeight ( dist(mouseX, mouseY, pmouseX, pmouseY) );
  
  ellipse (mouseY/3, height-mouseY, 50,50);
  stroke (0,90);
  ellipse (250, 250, 100+( dist(mouseX, mouseY, pmouseX, pmouseY)*2 ), 100+( dist(mouseX, mouseY, pmouseX, pmouseY)*2 ));
  stroke (0);
  ellipse (129+mouseY, width-mouseX, 57, 57);
  ellipse (mouseX/2, mouseY/3, 30, 30);  
  
  }
  
}

