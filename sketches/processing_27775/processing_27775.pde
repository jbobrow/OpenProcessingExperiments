
void setup() {
  smooth();
  size(500,500);
}


void draw () {

  
  if (mousePressed) {
  
  fill (255,30);
  rect (0, 0, 500, 500);
  
  noStroke ();
  fill (245);
  ellipse (mouseX, mouseY, 180, 180);
  fill (240);
  //stroke (245);
  //strokeWeight ( dist(mouseX, mouseY, pmouseX, pmouseY) );
  ellipse (pmouseX, pmouseY, 160, 160);
  fill (230);
  ellipse (mouseX, mouseY, 140, 140);
  fill (220);
  ellipse (mouseX, mouseY, 120,120);
  fill (210);
  ellipse (mouseX, mouseY, 100, 100);
  fill (200);
  ellipse (mouseX, mouseY, 80,80);
    fill (290);
  ellipse (mouseX, mouseY, 60,60);
    fill (180);
  ellipse (mouseX, mouseY, 45,45);
  
  fill (0);
  stroke (0);
  rect (0, 0, 0, 0, mouseX, mouseY);
  rect (500, 500, 0, 0, -mouseX, -mouseY);

  }
  
  else {
  
  fill (255);
  rect (0, 0, 500, 500);
  
  noStroke ();  
  fill (200,200,200);
  stroke (200);
  //strokeWeight ( dist(mouseX, mouseY, pmouseX, pmouseY) );
  ellipse (pmouseX, pmouseY, 150, 150);
  fill (0, 100);
  ellipse (mouseX, mouseY, 45,45);
  
  fill (0);
  stroke (0);
  quad ( 0, 0, 60, 0, mouseX-90, mouseY-50, 0, 60);
  //triangle (0, 300, 0, 260, mouseX-100, mouseY);
  //triangle (0, 300+130, 0, 260+150, mouseX-130, mouseY+50);
  //triangle (218, 500, mouseX, mouseY+141, 243, 500);
  quad (500, 0, 500, 100, mouseX+60, mouseY-90, 460, 0);
  quad (0, 500, 0, 460, mouseX-40, mouseY+70, 50, 500);
  quad (500, 500, 500, 495, mouseX+90, mouseY, 580, 500);
  //rect (0, 0, 0, 0, mouseX, mouseY);
  //rect (500, 500, 0, 0, -mouseX, -mouseY);
  }
  

}

