
float tam;

float pontoX, pontoY;

void setup() {
  size(800,600);
  background(0,0,0);
  strokeWeight(0.5);

  smooth();
  stroke(5);
  noFill();
}

void draw() {
  tam=10;
  if (mousePressed) {
  // stroke(100+abs(100*sin(millis()/200.0)), abs(20+150*cos(millis()/80.0)), 0);
   strokeWeight (2);
   stroke(100+abs(100*sin(millis()/200.0)), abs(20+120*cos(millis()/80.0)), 150);
   line(mouseX,mouseY, mouseX + 3, mouseY+2) ;
    //ellipse(mouseX,mouseY, 1,1) ;
 //rect(mouseX,mouseY, mouseX + 10, mouseY/2 -20);
   
    //ellipse (mouseX, mouseY, mouseX+tam*sin(millis()/30.0), mouseY+tam*cos(millis()/10.0));
  }
}

void mouseReleased() {
  pontoX = mouseX;
  pontoY = mouseY;
}

