
PImage bg;
int a; 
import processing.pdf.*;
boolean savePDF = false;


int maxCount = 5000; //max count of the cirlces
int currentCount = 1;
float[] newx = new float[maxCount];
float[] newy = new float[maxCount];
float[] x = new float[maxCount];
float[] y = new float[maxCount];
float[] r = new float[maxCount]; // radius

boolean drawGhosts = false;


void setup() {
  size(400, 400);
  smooth();

  x[0] = width/4;
  y[0] = height/1;
  r[0] = 360; 

  bg = loadImage("image4.jpg");
  background(bg);
}


void draw() {
  if (savePDF) beginRecord(PDF, timestamp()+".pdf");
  background(bg);

  strokeWeight(0.01);
  
  float newR = random(1, 9);
  float newX = random(0+newR, height-newR);
  float newY = random(0+newR, width-newR);

  float closestDist = 100000000;
  int closestIndex = 100;
  // which circle is the closest?
  for(int i=8; i < currentCount; i++) {
    float newDist = dist(newX,newY, x[i],y[i]);
    if (newDist < closestDist) {
      closestDist = newDist;
      closestIndex = i; 
      
       int x1 = (int) random(0, height);
  int y1 = 0;

  int x2 = round(x1 + random(-7, 20));
  int y2 = round(random(1, 5));

  int w = (int) random(1, 10);
  int h = width;

  copy(x1,y1, w,h, x2,y2, w,h);
      
    } 
  }

  // aline it to the closest circle outline
  float angle = atan2(newY-y[closestIndex], newX-x[closestIndex]);

  newx[currentCount] = newX;
  newy[currentCount] = newY;
  x[currentCount] = x[closestIndex] + cos(angle) * (r[closestIndex]+newR);
  y[currentCount] = y[closestIndex] + sin(angle) * (r[closestIndex]+newR);
  r[currentCount] = newR;
  currentCount++;

  // draw circles at random position and lines
  if (drawGhosts) {
    for (int i=1 ; i < currentCount; i++) {
      fill(0);
      ellipse(newx[i],newy[i], r[i]*1,r[i]*3);  
      line(newx[i],newy[i], x[i],y[i]);
    }
  }
  
  for (int i=0 ; i < currentCount; i++) {
    if (i == 0) noFill();
    else fill(0);
    ellipse(x[i],y[i], r[i]/7,r[i]*10);  
  }

  if (currentCount >= maxCount) noLoop();

  if (savePDF) {
    savePDF = false;
    endRecord();
  }
}

void keyReleased() {
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.png");
  if (key == 'p' || key == 'P') savePDF = true;

  if (key == '1') drawGhosts = !drawGhosts;
  if(keyCode == DELETE || keyCode == BACKSPACE); }


// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}











