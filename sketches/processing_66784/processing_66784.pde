
void setup() {
  size(400, 300);
  background(255);
  smooth();
  noStroke();
  colorMode(HSB, 100, 100, 100, 100);
  frameRate(60);
}

void draw() {
  ocean();
  if(mousePressed){
    seagullCruise(mouseX, 0);
  }
}

void seagullCruise(int xpos, int ypos){
  for(int i = xpos; i < width; i+=5){
    for(int j = ypos; j < height; j+=5){
      ocean();
      seagull(xpos, ypos);
      if (key == 'r' || key == 'R') {
        xpos-=5;
        ypos-=5;
      }
      else{
      xpos+=5;
      ypos+=5;
      }
    }
  }
}

void ocean(){
  for(int i = height; i > -70; i-=5){
    for (int j = 0; j < width; j+=5) {
      fill(random(55, 60), 80, 80);
      int size = int(random(35, 75));
      ellipse(j, i, size, size);
    }
  }
}


void seagull(float ptx, float pty){
  println(ptx);
  println(pty);
  float flap = random(5,30);
 
  fill(100);
  beginShape();
  curveVertex(ptx-40, pty-flap);
  curveVertex(ptx-40, pty-flap);
  curveVertex(ptx, pty);
  curveVertex(ptx+40, pty-flap);
  curveVertex(ptx, pty+5);
  curveVertex(ptx-40, pty-flap);
  curveVertex(ptx-40, pty-flap);
  endShape();
}
  


