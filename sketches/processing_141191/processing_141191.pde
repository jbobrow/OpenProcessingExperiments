
SnowFlake[] snowflakes;
float wind;

void setup() {
  frameRate(15);
  size(800, 800);
  //size(displayWidth, displayHeight);
  background(0);
  snowflakes = new SnowFlake[0];
  // snowflakes[0]= new SnowFlake(int(random(0, width)), int(random(0, height)));
}

void draw() {
  background(0);
  // println(snowflakes);
  wind = map(mouseX, 0, width, -1, 1);
  for (int i=0; i<snowflakes.length; i++) {
    //  println(i);
    snowflakes[i].fall();
    snowflakes[i].display(); 
    snowflakes[i].cx=snowflakes[i].cx+wind;
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
  float cx;
  float cy;
  int rotated;
  int howComplex;
  int speed;
  int numSpokes;
  int transparency;
  int[] rotatedList;
  int[] radiusList;
  int[] spokeLengthList;

  SnowFlake(int centerX, int centerY) {

    cx = centerX;
    cy = centerY;
    speed = int(random(2, 4));
    howComplex = int(random(3, 6));
    numSpokes = int(random(5, 8));
    transparency = int(random(20, 180));
    rotatedList = new int[howComplex];
    radiusList = new int[howComplex];
    spokeLengthList = new int[howComplex];
    
    for(int i=0; i<howComplex; i++)
    {
    rotated = int(random(0, 55));
    radius = int(random(2, 10));
    spokeLength = int(random(2, 25));
    rotatedList[i] = rotated;
    radiusList[i] = radius;
    spokeLengthList[i] = spokeLength;
    }
  }

  void display() {

    ellipseMode(CENTER);
    stroke(255, 255, 255, transparency);
    fill(255, 255, 255, transparency);
    for (int i = 0; i < howComplex; i++) {
      rotated = rotatedList[i];
      radius = radiusList[i];
      spokeLength = spokeLengthList[i];
      float theAngle = 360/numSpokes;
      //ellipse(cx, cy, radius, radius);
      for (int j = 0; j < numSpokes; j++) {

        float elbowX = cx + cos(radians(theAngle*j+rotated)) * spokeLength;
        float elbowY = cy+ sin(radians(theAngle* j+rotated))* spokeLength;
        float wristX = elbowX + cos(radians(theAngle*j+rotated)) * spokeLength * 1.5;
        float wristY = elbowY + sin(radians(theAngle*j+rotated)) * spokeLength * 1.5;

        
        line(cx, cy, elbowX, elbowY);
        ellipse(elbowX, elbowY, radius, radius);
        line(elbowX, elbowY, wristX, wristY);
        ellipse(wristX, wristY, radius, radius);
      }
    }
  }

  void fall() {
    if (cy < height+50) {
      cy = cy+ speed;
    }
    else{
     cy = -50; 
    }
    
    if(cx < -50){
     cx = width +50; 
      
    }
    
    else if(cx > width+50){
      cx = -50;
    }
    
    for(int i=0; i<howComplex; i++)
    {
     rotatedList[i]=rotatedList[i]+1; 
    }
  }
}



