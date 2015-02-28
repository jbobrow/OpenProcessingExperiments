
ArrayList<Ball> balls;
String msg = "I Love you mom <3";
int ballWidth;
int time = 255;
int[] lunch = new int[msg.length()];
 
void setup(){
  size(670, 100);
  noStroke();
   
  ballWidth = width/msg.length();
   
  textSize(ballWidth-1);
  textAlign(CENTER);
   
  balls = new ArrayList<Ball>();
   
  balls.add(new Ball((msg.length()-1)*ballWidth + ballWidth/2, 0, ballWidth,msg.charAt(msg.length()-1)));
   
  for(int i = 0; i < msg.length()-1; i++){
    lunch[i] = int(random(0,255));
    //balls.add(new Ball(i*ballWidth, 0, ballWidth));
  }
 
}//setup
 
void draw(){
  background(255);
   
  if(time > 0){
    time--;
    for(int i = 0; i < msg.length()-1; i++){
      if(lunch[i] == time)balls.add(new Ball(i*ballWidth + ballWidth/2, 0, ballWidth,msg.charAt(i)));
    }//
  }
   
   
  for (int i = 0; i < balls.size(); i++) {
    // An ArrayList doesn't know what it is storing so we have to cast the object coming out
    Ball ball = balls.get(i);
    ball.move();
    ball.display();
     
  }//for
 
}//draw
 
// Simple bouncing ball class
 
class Ball {
   
  float x;
  float y;
  float speed;
  float gravity;
  float w;
  float life = 255;
  char s;
  int warna;
   
  Ball(float tempX, float tempY, float tempW, char soi) {
    x = tempX;
    y = tempY;
    w = tempW;
    speed = 0;
    gravity = 0.70;
    s = soi;
    warna = color(int(random(0,255)),int(random(0,255)),int(random(0,255)));
  }
   
    void move() {
    // Add gravity to speed
    speed = speed + gravity;
    // Add speed to y location
    y = y + speed;
    // If square reaches the bottom
    // Reverse speed
    if (y > height - ballWidth/2) {
      // Dampening
      speed = speed * -0.8;
      y = height - ballWidth/2;
    }
  }
   
  void display() {
    // Display the circle
    life = life - 0.5;
    if(life < 0){
      life = 255;
      speed = 0;
      gravity = 0.00001;
      y = 0;
    }//if
    fill(warna,life);
    //stroke(0,life);
    ellipse(x,y,w,w);
    fill(255);
    text(s,x,y+w/4);
  }
}

