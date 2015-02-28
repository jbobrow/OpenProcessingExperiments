
SnowFlake[] snowflakes;

void setup() {
  frameRate(15);
  size(800, 800);
  background(0);
  snowflakes = new SnowFlake[0];
 // snowflakes[0]= new SnowFlake(int(random(0, width)), int(random(0, height)));
}

void draw() {
  background(0);
  // println(snowflakes);
 for(int i=0; i<snowflakes.length; i++){
//  println(i);
  snowflakes[i].fall();
 snowflakes[i].display(); 
 }
}

void mousePressed() {
 // println(snowflakes.length);
 SnowFlake mySnowFlake = new SnowFlake(mouseX, mouseY);
snowflakes = (SnowFlake[]) append(snowflakes, mySnowFlake);
  
  /* mySnowFlake.display(); 
   mySnowFlake.fall();
   */
}

class SnowFlake {

  int radius;
  int spokeLength;
  int cx;
  int cy;
  int rotated;
  int howComplex;
  int speed;

  SnowFlake(int centerX, int centerY) {

    cx = centerX;
    cy = centerY;
    rotated = int(random(0, 55));
    radius = int(random(2, 10));
    spokeLength = int(random(2, 25));
    howComplex = int(random(3, 6));
    speed = int(random(3, 12));
  }

  void display() {

    ellipseMode(CENTER);
    stroke(255);
    fill(255);
    for (int i = 0; i < howComplex; i++) {
      rotated = int(random(0, 59));
      radius = int(random(1, 8));
      spokeLength = int(random(3, 20));
      for (int j = 0; j < 7; j++) {

        float elbowX = cx + cos(radians(60*j+rotated)) * spokeLength;
        float elbowY = cy+ sin(radians(60* j+rotated))* spokeLength;
        float wristX = elbowX + cos(radians(60*j+rotated)) * spokeLength * 1.5;
        float wristY = elbowY + sin(radians(60*j+rotated)) * spokeLength * 1.5;

        ellipse(cx, cy, radius, radius);
        line(cx, cy, elbowX, elbowY);
        ellipse(elbowX, elbowY, radius, radius);
        line(elbowX, elbowY, wristX, wristY);
        ellipse(wristX, wristY, radius, radius);
      }
    }
  }

  void fall() {
    if (cy < height*1.5) {
      cy = cy+ speed;
    }
    else{
     cy = 0; 
    }
  }
}



