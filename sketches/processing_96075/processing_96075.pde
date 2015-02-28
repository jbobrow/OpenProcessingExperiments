
PImage clouds;
PImage bird;
PImage bubbleplayer;
float angle2 = 0.0;
float angle = 0.0;
float offset = 80;
float scalar = 20;
float speed = 0.05;
float x = 110;
float xspeed = 0.5;
int direction = 1;
float xpos = 500;
float ypos = 40;
float xspeed = 6;
 
void setup() {
  size(1000, 700);
  smooth();
  clouds = loadImage("clouds.png");
  bird = loadImage("Birds.png");
  bubbleplayer = loadImage("bubbleplayer.png");
}
void draw() {
  background(13, 178, 210);
      if (mousePressed) {
    String n = "WATCH OUT FOR THE BIRDS!";
    //put string text within a bounding box
    text(n, 25, 300, 135, 200);
  }
  bounce();
  bouceGroup2();
  move();
  imageMode(CENTER);
  translate(mouseX, mouseY);
  scale(sin(angle2));
  rotate(PI/10);
  image(bubbleplayer, 50, 50);
  angle2 += .001;
  
}
void move() {
  xpos = xpos - xspeed;
  if (xpos < 0) {
    xpos = width;
  }
}
void bounce() {
  float y1 = offset + sin(angle+.3)*scalar;

  float y2 = offset + sin(angle +.6 )*scalar;
  float y3 = offset + sin(angle + 1.2)*scalar;
  float y4 = offset + sin(angle + 1.6)*scalar;
  image(bird, 230+xpos, y3);
  image(bird, 280+xpos, y4);
  image(clouds, 700, 100+y1);
  image(clouds, 190, y2);

  angle += speed;
}
void bouceGroup2() {
  float y5 = offset + sin(angle)*scalar;
  float y6 = offset + sin(angle +1.4)*scalar;
  float y7 = offset + sin(angle+.4)*scalar;
  float y8 = offset + sin(angle)*scalar;
 image(bird, 160+xpos, y6+130);
  image(clouds, 300, 450+y5);
  image(bird, 160+xpos, y6+130);
  image(clouds, 700, 450+y7);
  image(clouds, 350, 150+y8);
    
  angle += speed;
}



