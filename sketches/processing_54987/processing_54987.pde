
Robot pinkRobot;
Robot blueRobot;
Robot purpRobot;
 
void setup() {
  background(255);
  size(800, 600); 
  smooth();
  noStroke();
  rectMode(CENTER);
  pinkRobot = new Robot(150, 400, 1, 40, 0.09,#f3b0ee);
  blueRobot = new Robot(400, 400, -1, 70, 0.12,#83b4fd);
  purpRobot = new Robot(650, 400, -1, 15, 0.3,#b694d1);
}
 
void draw() {
  background(255);
  pinkRobot.display();
  pinkRobot.jump();
  blueRobot.display();
  blueRobot.jump();
  purpRobot.display();
  purpRobot.jump();
}
 
class Robot {
  float x;
  float y;
  int direction;
  float howhigh;
  float howlow;
  float easing;
  color c;
 
  Robot(float tempX, float tempY, int tempDirection, int range, float tempEasing, 
  color tempC) {
    x = tempX;
    y = tempY;
    direction = tempDirection;
    howhigh = y - (range*2); 
    howlow = y;
    easing = tempEasing;
    c = tempC;
  }
 
  void jump() {
    float d;
    if (y > howlow - 1 || y < howhigh + 1)
      direction *= -1;
    if (direction == -1)      
      d = howlow - y;
    else                      
      d = y - howhigh;
    y += d * easing * -direction;
  }
 
  void display() {
    stroke(0);
    noStroke();
    fill(c);


  ellipse(x, y-144, 130, 130);//head
  fill(255);
  rect(x-20, y-140, 30, 30);//eft eye
  rect(x+20, y-140, 30, 30);//right eye
  fill(0);
  ellipse(x-15, y-135, 8, 8);//left pupil
  ellipse(x+15, y-135, 8, 8);//right pupil
  stroke(0);
  strokeWeight(5);
  line(x-65, y-144, x-75, y-144);//left antenna
  line(x+65, y-144, x+75, y-144);//right antenna
  line(x, y-50, x, y-80);//neck
  rect(x,y, 130,100);//body
  strokeWeight(4);
  fill(100);
  ellipse(x-50,y+50, 15, 15);//left wheel
  ellipse(x+50, y+50, 15, 15);




 }
}

