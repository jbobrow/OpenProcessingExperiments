
Time[] snow = new Time [80];
//snowman man;
float s, h;

void setup() {
  size(300, 600);
  //man = new snowman();
  for (int i = 0; i < snow.length; i ++) {
    snow[i] = new Time(random(width));
  }
  frameRate(40);
  smooth();
  //for (int i = 0; i < man.length; i ++) {
  //man[i] = new snowman(50);
  //}


  // The snow stacking up on the floor! 
  s = 20;
  h = 580;
}


void draw() {
  background(10);
  
  fill(93,49,5);
  triangle(90,390,10,440,170,440);
  fill(200,100,0);
  rect(20,440,140,100);
  fill(84,181,232);
  rect(40,460,30,40);
  rect(100,460,30,40);

  fill(255);
  for (int i = 0; i < snow.length; i ++) {
    //ball[i] = new DroppingBall(random(width));
    snow[i].update();
    snow[i].display();
  }
  //if (millis() - lastDrop > dropRate) {
  //ball[i].reset();
  //lastDrop = millis();
  //}
  //println(millis()); millis = one thousand second
  //for (int i = 0; i < man.length; i ++) {
  //ball[i] = new DroppingBall(random(width));
  //man.update();
  //man.display();
  //}
  
  fill(255);
  float minuteMap= map(minute(), 0, 59, 0, width);
  ellipse(minuteMap, 470, 50, 50);
  ellipse(minuteMap, 520, 70, 70);
 
  
  fill(0);
  ellipse(minuteMap, 510, 5, 5);
  ellipse(minuteMap, 520, 5, 5);
  ellipse(minuteMap, 530, 5, 5);

  fill(255, 0, 0);
  noStroke();
  ellipse(minuteMap, 470, 5, 5 );

  fill(255);
  //float hourmap=map(hour(), 0, 23, 0, width);
  //int hr = hour();
  rect(0, h, 300, s);

  s = s + 0.016;
  h = h - 0.016;
  //snow stacking credit to http://www.openprocessing.org/sketch/42309

  fill(100);
  noStroke();
  smooth();
  int hr = hour();
  ellipse(hr, 50, 40, 40);
  fill(255,244,144);
  ellipse(hr, 57, 45, 45);
  
  
}

class Time {
  float y;
  float x;
  float ySpeed;
  float gravity;
  int lastDrop;
  int dropRate;
  Time(float tempx) {
    y=0;
    ySpeed =0;
    gravity=1.5;
    x = tempx;
    lastDrop = millis()+int (random(0, 100));
    dropRate = int(random(1000)) + 1000;
  }

  void display () {
    noStroke();
    ellipse(x, y, 5, 5);
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





