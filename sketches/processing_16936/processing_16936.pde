


float theta = 2.0;

void setup() {
  size(800,600);
   background(0);
  smooth();
}

void draw() {
 
  background(0);
 theta += 0.01;
  noStroke();
  fill(250,23,23,90);
 float x = theta;
  

  for (int i = 0; i <= 80; i++) {

    float y = sin(x)*height/2;

    ellipse(i*20,y + height/2,30,30);

    x += 8.2;
    
  }

}
void mousePressed(){
 // saveFrame ("1.JPG");
   noLoop();
}
void keyPressed(){
  background (0);
  loop();
}

