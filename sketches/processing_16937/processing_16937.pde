
float theta = 2.0;

void setup() {
  size(800,600);
   background(0);
  smooth();
}

void draw() {
 
  background(0);
 theta += 0.02;
  noStroke();
  fill(22,124,178,80);
 float x = theta;
  

  for (int i = 0; i <= 800; i++) {

    float y = sin(x)*height/2;

    ellipse(i*2,y + height/2,15,15);

    x += 80.4;
    
  }

}
void mousePressed(){
 saveFrame ("1.JPG");
   noLoop();
}
void keyPressed(){
  background (0);
  loop();
}

