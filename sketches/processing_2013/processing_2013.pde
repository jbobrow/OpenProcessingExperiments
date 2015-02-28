
boolean Drawing=false;

void setup() 
  {
  size(1024,800);
  background(200,200,210);
  smooth();
 //noStroke();
  fill(20,150,50,50);
  }

void draw() {
 if (Drawing) {
  variableLine(mouseX,mouseY,pmouseX,pmouseY);
 {
  variableEllipse(mouseX,mouseY,pmouseX,pmouseY);
    }
  }
}

void variableEllipse(int x, int y, int px, int py) {
  float speed=abs(x-px) + abs(y-py);
  stroke(20,150,50,50);
  ellipse(x,y,speed,speed);
  }
  
void variableLine(int x, int y, int px, int py) {
    float speed=abs(y-px) + abs(x-py);
    stroke(255,255,255,80);
    line(pmouseX,mouseY,speed,speed);
}
  
void mousePressed() {
  Drawing=!Drawing;
}



