
float offset = 30;
  float scalar = 30;
  float speed = 0.05;
  float angle = 0.0;

void setup(){
  size(480,240);
}

void draw(){
    background(0);

  float y1 = offset + cos(angle) * scalar;
  float y2 = offset + sin(angle + 0.8) * scalar;
  float y3 = offset + cos(angle + 0.8) * scalar;
           angle += speed;

  pushMatrix();
  translate(mouseX, mouseY);
  translate(sin(angle)*15,cos(angle)*15);
  stroke(150);
  fill(150);
  triangle(60,y1,80,y2,30,30);
  fill(255);
  triangle(100,y3,80,y2,30,30);
  popMatrix();
  
  }
