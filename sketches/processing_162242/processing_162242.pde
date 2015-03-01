
//201112743_leesongah

int xPos = 70;
int yPos = 70;
int S = 55;
int A = 15; 

void setup() {

  size(800, 600);
  background(255);
  smooth();
  stroke(#FF0303);
  strokeWeight(4);
  strokeJoin(ROUND);
  rect(200, 10, 590, 580);//big white rect
  //button
  fill(#00BC9B);
  ellipse(70, 70, 55, 55);//blue green rect
  fill(#5600D1);
  ellipse(xPos, yPos+S+A, S, S);
  fill(#FF004D);
  ellipse(xPos, yPos+S+S+A+A, S, S);
  fill(#00FF86);
  ellipse(xPos, yPos+S+S+S+A+A+A, S, S );
  fill(#DD31DE);
  ellipse(xPos, yPos+S+S+S+S+A+A+A+A, S, S );
  fill(#FFCE6C);
  ellipse(xPos, yPos+S+S+S+S+S+A+A+A+A+A, S, S );
  fill(#6AF0E8);
  ellipse(xPos+70,yPos+A+A, S, S );
  fill(#FF9C93);
  ellipse(xPos+70,yPos+A+A+A+S, S, S );
  fill(#E9FF93);
  ellipse(xPos+70,yPos+A+A+A+A+S+S, S, S );
  fill(#DB8EB4);
  ellipse(xPos+70,yPos+A+A+A+A+A+S+S+S, S, S );
  fill(255);
  ellipse(xPos+70,yPos+A+A+A+A+A+A+S+S+S+S, S, S );
}

void draw() {


  if (mousePressed) {

    if (mouseX > 220 && mouseX < 780 && mouseY >20 && mouseY<580) {
      line( pmouseX, pmouseY, mouseX, mouseY);
    }
    if (mouseX > 43&& mouseX < 98  && mouseY >43 && mouseY<98 ) {
      stroke(#00BC9B);
      strokeWeight(5);
    }
    if (mouseX > 43 && mouseX < 98 && mouseY > 103 && mouseY< 158 ) {
      stroke(#5600D1);
      strokeWeight(5);
    }
     if (mouseX > 43 && mouseX < 98 && mouseY > 173 && mouseY< 228 ) {
      stroke(#FF004D);
      strokeWeight(5);
    }
     if (mouseX > 43 && mouseX < 98 && mouseY > 243 && mouseY< 298 ) {
      stroke(#00FF86);
      strokeWeight(5);
    }
       if (mouseX > 43 && mouseX < 98 && mouseY > 313  && mouseY< 368 ) {
      stroke(#DD31DE);
      strokeWeight(5);
    }
       if (mouseX > 43 && mouseX < 98 && mouseY > 383  && mouseY< 438 ) {
      stroke(#FFCE6C);
      strokeWeight(5);
    }
     if (mouseX > 113 && mouseX < 168 && mouseY > 73 && mouseY< 127 ) {
      stroke(#6AF0E8);
      strokeWeight(5);
    }
    if (mouseX > 113 && mouseX < 168 && mouseY > 132  && mouseY< 187 ) {
      stroke(#FF9C93);
      strokeWeight(5);
    }
    if (mouseX > 113 && mouseX < 168 && mouseY > 202  && mouseY< 257 ) {
      stroke(#E9FF93);
      strokeWeight(5);
    }
      if (mouseX > 113 && mouseX < 168 && mouseY > 272  && mouseY< 327 ) {
      stroke(#DB8EB4);
      strokeWeight(5);
    }
     if (mouseX > 113 && mouseX < 168 && mouseY > 342 && mouseY< 397 ) {
      stroke(255);
      strokeWeight(20);
    }
  }
}

