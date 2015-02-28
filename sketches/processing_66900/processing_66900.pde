

float d = 30;
int speed=10;
float col = 0;


void setup() {
  size(600, 600);
  background(255);
  smooth();
}


void draw () {
  ++col;
    drawEllipse(300, 300, 30, (cos(radians(col))+1)/2); 
  if (++col>360) {
    col = 0;
    
  }
}


void drawEllipse(float posX, float posY, float d, float c) {
 noStroke();
 fill(c*255);
 ellipse(300, 300, d,d);
} 


void keyPressed() {
  if (key=='a') {
  stroke(0);
line(mouseX, mouseY, width, height);

//    if (key==CODED) {
//      if (keyCode == UP) {
//        posY=posX-speed;
//      }
//    }
  }
}

