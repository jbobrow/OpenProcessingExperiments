

void setup(){
  size(1440, 794);
  smooth ();
  
 
  
}

void draw(){
 background(255);
  noFill();
  ellipse(720, 392, 700, 700);
  ellipse(720, 392, 600, 600);
  ellipse(720, 392, 500, 500);
  ellipse(720, 392, 400, 400);
  ellipse(720, 392, 300, 300);
  ellipse(720, 392, 200, 200);
  ellipse(720, 392, 100, 100);
  noFill();
  ellipse(mouseX, mouseY, 80, 80);
  line(mouseX-40, mouseY, mouseX+40, mouseY);
  line(mouseX, mouseY-40, mouseX, mouseY+40);
    if (mousePressed){
  fill(0);
  ellipse (mouseX, mouseY, 10, 10);
  }
}



