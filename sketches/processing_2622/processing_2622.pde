
Ball[] myBall = new Ball[2500] ;

void setup() {
  size(400, 400);
  noStroke();
  smooth();
  for (int i = 0; i < 2500; i = i+1) {
  myBall[i] = new Ball(8*(i%(width/8)), 8*round(i/(height/8)), i, 25, 10,5);
}

}
float thetabig = 0;
void draw(){
 
  thetabig += .00625;
  background(255);
  for (int i = 0; i < 2500; i += 1){
  myBall[i].move();
  myBall[i].display();
  }
}
 class Ball {
   float x;
   float y;
   float theta;
   float balrad;
   float rotrad;
   float speed;
Ball(float tempx, float tempy, float temptheta, float tempbalrad, float temprotrad, float tempspeed) {
  x = tempx;
  y = tempy;
  theta = temptheta;
  balrad = tempbalrad;
  rotrad = temprotrad;
  speed = tempspeed;
}
void move() {
  theta += .05*speed*dist(x, y, 200+200*cos(thetabig), 200+200*sin(thetabig))/200;
  fill(mouseX/2, mouseY/2, 255-(255/2*(1-sin(theta))), 75);
}
void display() {
  ellipse((x+rotrad*cos(theta)), (y + rotrad*sin(theta)), dist(x, y, mouseX, mouseY)/10, dist(x, y, mouseX, mouseY)/10);
}
}

