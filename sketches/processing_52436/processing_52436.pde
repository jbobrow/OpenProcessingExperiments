
void setup () {
  //size of window
  size (500,500);
}
void draw () {

  //Center mode
  ellipseMode (CENTER);
  rectMode (CENTER);
  
  //body
  stroke (0);
  fill(mouseX, 0, mouseY);
  rect (mouseX, mouseY, 30, 100);
  
  //head
  stroke(0);
  fill(mouseX, 0, mouseY);
  ellipse (mouseX, mouseY-30 ,70,70);
  
  //eyes
  fill (0);
  ellipse (mouseX -19,mouseY-30,16,32);
  ellipse (mouseX+20 , mouseY-30,20,32);
  //legs
  stroke (0);
  line (mouseX-10, mouseY+50,mouseX-30,mouseY+70);
  line(mouseX+10, mouseY+50, mouseX+20 , mouseY+70);
  //arms
  stroke (0);
  line (mouseX-16, mouseY+10, mouseX-30, mouseY);
  line (mouseX+15, mouseY+10, mouseX+25, mouseY);
  //smile
  stroke (0);
  fill (mouseX, 0, mouseY);
  arc (mouseX, mouseY-15,22,18, 0, PI);




}


