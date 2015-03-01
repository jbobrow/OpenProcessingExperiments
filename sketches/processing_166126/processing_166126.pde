
import ddf.minim.*;

Minim minim;

AudioInput in;


Ball[] ballList = new Ball[200];
//int[] list = new int[5];

void setup() {
  smooth();
  noStroke();
  size(600, 600, P3D);

  minim = new Minim(this);

  // use the getLineIn method of the Minim object to get an AudioInput
  in = minim.getLineIn();


  for (int i=0; i<ballList.length; i++) {
    ballList[i] = new Ball();
  }
}


void draw() {
  background(254, 255, 214);
  frameRate(15);
  float modifier = in.left.get((16)%1024)*100;
  fill(0, modifier*1000, modifier*1000, 10);
  
  for (int i=0; i<ballList.length; i++) {
    ballList[i].update();
  }
 
}
  
class  Ball {
  float xPos;
  float yPos;
  float rad;
  float speed;
  float map;


  Ball() {
    xPos = random(width);
    yPos = random(height);
    rad = random(2, 20);
    speed= random(1, 10);
  }

  void update() {
    noStroke();
    map = map(xPos, 0, width, 50, 255);
    float modifier = in.left.get((8)%1024)*50;
    speed = random(abs(modifier*20), 10);
    fill(map, 0, 0, 250);
    ellipse(xPos, yPos+(modifier*20), rad*3*modifier+(xPos/50), rad*2*modifier+(xPos/50));
  

  //movement
  xPos += speed;
  if (xPos > width) {
    xPos = 0;
  }
}
}



