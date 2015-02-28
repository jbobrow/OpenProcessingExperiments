
int x=0;
float speed1 = 1;
float speed2 = 0.05;
float speed3 = -0.5;

void setup() {
  size(400, 400);
  smooth();
}

void draw() {
  background(255, 222, 57);
  strokeWeight(2);
  strokeCap(ROUND);
  for (int i=20; i < 400; i+=20) {
    stroke(255+i, 20+i, 500+i);
    line(i, 20, i, 380);
    line(20, i, 380, i);
  }
  //println(mouseX+", "+mouseY);
  translate(width/2, height/2);
  if(mousePressed==true){
    stroke(255);
    
    
    rotate(speed1);
    speed1+=.05;
    drawS(255, 0, 200);
    }
    
    rotate(speed2);
    speed2+=0.5;
    drawS(0, 250, 100);
  
    rotate(speed3);
    speed3+=0.5;
    drawS(255, 250, 0);
  }

void drawS(int r, int g, int b) {
  fill(r, g, b);
  rectMode(CENTER);
  rect(0, 0, 20+b, 20+b);
}
