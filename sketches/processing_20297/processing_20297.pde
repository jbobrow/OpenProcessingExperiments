
/*


*/
void setup () {
  size (500, 500);
  background (255);

}

void draw () {
  rectMode(CENTER);
  
//white background
  noStroke();
  fill(255);
  rect (width/2, height/2, width, height);
  
  
//head
   fill (0);
   ellipse (mouseX, mouseY-150, 100, 100);

//body
   rect (mouseX, mouseY, 80, 200);

//eyes
  fill (0,255,0);
  ellipse (mouseX-25, mouseY-150, 10, 10);
  ellipse (mouseX+25, mouseY-150, 10, 10);

//mouth
  ellipse (mouseX, mouseY-120, 30, 10);
  
stroke(0);
strokeWeight(2);  
  
//arms
  line (mouseX-40, mouseY-100, width/2-150, height/2-180);
  line (mouseX+40, mouseY-100, width/2+150, height/2-180);
  
//legs
  line (mouseX-40, mouseY+100, width/2-100, height/2+240);
  line (mouseX+40, mouseY+100, width/2+100, height/2+240);

}

