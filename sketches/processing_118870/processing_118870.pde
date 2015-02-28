
DroppingBall[] ball = new DroppingBall [30];


void setup() {
  size(300, 740);
  for (int i = 0; i < ball.length; i ++) {
  ball[i] = new DroppingBall(random(width));
  }
 
}


void draw() {
  background(200);
  
 
   for (int i = 0; i < ball.length; i ++) {
  //ball[i] = new DroppingBall(random(width));
  ball[i].update();
  ball[i].display();
   }
  //if (millis() - lastDrop > dropRate) {
    //ball[i].reset();
    //lastDrop = millis();
  //}
  //println(millis()); millis = one thousand second
}
class DroppingBall {
  float y;
  float x;
  float ySpeed;
  float gravity;
  int lastDrop;
  int dropRate;
  DroppingBall(float tempx) {
    y=0;
    ySpeed =0;
    gravity=1.5;
    x = tempx;
    lastDrop = millis()+int (random(0,100));
    dropRate = int(random(1000)) + 1000;
  }

  void display () {
    ellipse(x, y, 40, 40);
  }

  void update () {
    ySpeed += gravity;//acceleration
    y += ySpeed;//actual movement of the object
    if ( millis() - lastDrop > dropRate ) {
      reset();
      lastDrop = millis();
    }
  }

  //if (y>height) {
  //reset();// ball back to start and repeating
  //}

void reset () {
  y=0;
  ySpeed=0;
}
}
