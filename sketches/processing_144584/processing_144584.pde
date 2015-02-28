
float radius = 1;
float angle = 0;
float speed = 1;
float color1 = 155;
float color2 = 200;
float color3 = 70;
void setup(){
  background(0);
  size(500,500);
  ellipseMode(CENTER);
  noStroke();
  fill(200);
}
void draw(){
  fill(color1,color2,color3);
  float Anglechange = speed/radius;
  angle += Anglechange;
  radius += 20/TWO_PI*Anglechange;
  ellipse(width/2+radius*cos(angle),height/2+radius*sin(angle),20,20);
}

void keyPressed() {
   if (keyCode == LEFT) {
    speed = speed + 1 
    }
   if (keyCode == RIGHT) {
    speed = speed - 1
    }
   if (keyCode == UP) {
    color1 = random(255);
    color2 = random(255);
    color3 = random(255);
    }
    if (keyCode == DOWN) {
    background (0);
    radius = 1;
    angle = 0;
    
    }
    }
