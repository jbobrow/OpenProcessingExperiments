
float x, y, l, ang;
float curL = 0;
PImage img1;
boolean recordVideo = false;
void setup () {
  size (1977, 1127, P2D);  
  img1 = loadImage("black&white.jpg");
  smooth();
  frameRate(25);
  x = width*0.65;
  y = height*0.25;
  l = 40;
  ang = 0;
  image(img1, 0, 0, width, height);
  
  }
  
  
void draw() {
  
  loadPixels();
  //pushMatrix();
  fill(255, 0, 0);
  stroke(255, 0, 0);
  reDirectedLine(width/2.0, height/2.0, l, 60, 85);
  //popMatrix();
  
  

//stroke(1) color(255, 0, 0)
//line(1,1);
//line(1,1977);
//line(1127,1);
//line(1127,1977);

//(250,250,250) = turn 60degrees 

}

//start at a point.
//check color of the point
//turn some multiple of 60 degrees
//draw line 
//get point at the end of the line

 void reDirectedLine(float x1, float y1, float l, float ang, int n) {
 if (recordVideo == true) {
    saveFrame("video1-######.jpg");
    } 
    if (n > 0) {
    float x2 = x1 + cos(radians(ang)) * l;
    float y2 = y1 + sin(radians(ang)) * l;
    line(x1, y1, x2, y2);
    ang = getAngle(x2, y2, ang);
    ang += 60;
    color c = get(int(x), int(y));
    l = getLineLength(x2, y2, ang, c);
    n--;
    
    reDirectedLine(x2, y2, l, ang, n);
    
    
    }
  }

  
  //filter(THRESHOLD);
  
  //updatePixels();
  
float getAngle(float x, float y, float ang) {
  float returnAngle = ang;
  float angle2;
  color c = get(int(x), int(y));
  float r = red(c);
  println("red " + r);
  if (r >= 250) {
    angle2 = 60;
  }
  else if (r >= 212.5) {
    angle2 = 120;
  }
  else if (r >= 170) {
    angle2 = 180;
  }
  else if (r >= 127.5) {
    angle2 = 240;
  }
  else if (r >= 85) {
    angle2 = 300;
  }
  else if (r >= 42.5) {
    angle2 = 360;
  }
  else {
    angle2 = 0;
  }
  returnAngle += angle2;   
  return returnAngle;
}

float getLineLength(float x, float y, float ang, color c){
  float returnLength = 0;
  float curLength = 1;
  float x2, y2;
  color c2;
  boolean foundIt = false;
  while (foundIt == false) {
    x2 = x + cos(radians(ang)) * curLength;
    y2 = y + sin(radians(ang)) * curLength;
    c2 = get(int(x2), int(y2));
    if (c == c2 || curLength > width/4.0) {
      foundIt = true;
      returnLength = curLength;
    }
    curLength ++;
  }
  return returnLength;
  }
 void keyPressed() {
  if(key == CODED) { 
    if (keyCode == LEFT) { 
      if (recordVideo == true){ 
        recordVideo = false;
        println("record video is off");
      } 
    } 
    else if (keyCode == RIGHT) { 
        if (recordVideo == false){ 
        recordVideo = true;
        println("record video is on");
      }
    }
  }
}



