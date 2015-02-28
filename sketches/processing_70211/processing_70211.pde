
int sun;
int cloudHeight;
int cloudWidth;
int cloudHeight2;
int cloudWidth2;

void setup (){
  
  size (400, 400);
  background (#CCFFFF);
  smooth ();

  sun = 200; 
  cloudHeight = 50;
  cloudWidth = 50;
  cloudHeight2 = 75;
  cloudWidth2 = 80;
}

void draw (){
  
  noStroke();
  
  //sun
  fill (#FFFF00);
  ellipse (300, 50, sun, sun);
  
  //bird
  fill (#000000);
  ellipse (216, 160, 35, 30);
  rect (208, 160, 20, 30);
  ellipse (200, 178, 40, 10);
  ellipse (236, 178, 40, 10);
  rect (212, 190, 3, 10);
  rect (220, 190, 3, 10);
  fill (#FFFFFF);
  ellipse (210, 157, 5, 5);
  ellipse (225, 157, 5, 5);
  fill (#FFFF00);
  rect (215, 165, 5, 2);
  

}

  /* clouds */ //when mouse is clicked, clouds appear
  void mousePressed() {
    fill (#FFFFFF);
    ellipse (mouseX, mouseY, cloudWidth, cloudHeight); 
    ellipse (mouseX+20, mouseY+20, cloudWidth, cloudHeight);
    ellipse (mouseX-30, mouseY-30, cloudWidth, cloudHeight);
    ellipse (mouseX+20, mouseY, cloudWidth, cloudHeight);
    ellipse (mouseX-10, mouseY+15, cloudWidth, cloudHeight);
    ellipse (mouseX-15, mouseY, cloudWidth, cloudHeight);
    ellipse (mouseX+40, mouseY+30, cloudWidth, cloudHeight);
    ellipse (mouseX-35, mouseY-5, cloudWidth, cloudHeight);
    ellipse (mouseX-10, mouseY-20, cloudWidth, cloudHeight);
    ellipse (mouseX+35, mouseY, cloudWidth2, cloudHeight2);
}
