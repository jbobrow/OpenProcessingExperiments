
//assignment 3
//Mi Jin Hwang copyright 2012

void setup ()
{
  size (500, 500);
  noLoop();
  smooth ();
  noStroke ();
}

float x =0;

void draw ()
{
  background (156, 203, 224);
  x = x + 1;
  if (x > width){
    x= 0;
  }
  ellipse (x, 50, x, height);
}

void mouseDragged() {
  loop ();
}

void mouseReleased (){
  noLoop();
  
  stroke(250,149, 66);
  strokeWeight (5);
  line(width-width,width,mouseX,mouseY);
  line(width, width-width, mouseX, mouseY);
  stroke(255, 255, 255);
  strokeWeight (5);
  line(width-width,width-width,mouseX,mouseY);
  line(width,width,mouseX,mouseY);


if (mousePressed == true) {
  fill(252, 176, 105);
} else {
  fill(255, 244, 31);
}
triangle (mouseX - random(10, 20), mouseY + random(0, 30), mouseX - random(0, 10), mouseY - random(10, 20), mouseX + random(10, 10), mouseY + random(0, 10));
}


