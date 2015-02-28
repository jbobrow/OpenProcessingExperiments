
int x;
Lines myLine;
void setup(){
  size(800,800);
  background (255,255,255);
  fill(0,0,0);
  ellipse(width/2,height/2,400,400);
  frameRate (700);
  myLine = new Lines();

  
}

void draw(){
 
myLine.display();
 myLine.changeColor();
}

void mousePressed(){
  save("theMoon"+x+".jpg");
  x = x+1;
    background (255,255,255);
    fill(0,0,0);
     ellipse(width/2,height/2,400,400);

}

class Lines {
  color col ;
  float angle;
  float angleSpeed;
  float lineLength;

  Lines() {
    col = color(181, 157, 0, 100);
    angle =0;
    angleSpeed =0.2;
    lineLength =0;
  }

  void display() {

    lineLength = random(100, 200);

    int x = mouseX;
    int y = mouseY;

    strokeWeight(0.2); 
    noFill();
    stroke(col);
    
    pushMatrix();
    translate(x, y);
    rotate(radians(angle));

    line(0, 0, lineLength, lineLength);
    angle = angle + angleSpeed;
    popMatrix();
  }

  void changeColor() {
    if (dist(mouseX, mouseY, width/2, height/2)<200 ) {
      col = color(255, 255, 255);
    }
    else {
      col = color(50, 50, 50);
    }
    if (keyPressed) {
      if (key == 'r') {
        col = color (149, 14, 14);
      }
      else if (key == 'g') {
        col = color (52, 113, 62);
      }
      else if (key == 'b') {
        col = color (37, 84, 121);
      }
      else if (key == 'y') {
        col = color (239, 240, 0);
      }
    }
  }
}



