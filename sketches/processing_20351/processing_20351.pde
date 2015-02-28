
void setup() {
  size(540, 334);

  smooth();

 // background(173, 180, 125);

}

void draw()
{
  fill(0,20);
  rect(0,0,width,height);
  
  smooth();
  frameRate(30);
  
  int hPattern = second()%6;
  int vPattern = second()%5;
  
  drawDots(hPattern, vPattern);
}

float getRandom(int patternChoice)
{
  float x, y, threshold;

  do {
    x = random(0,1);
    y = random(0, 1);
    threshold = getThreshold(x, patternChoice);
  }
  while (y > threshold);
  
  return( x );
}

void drawPatterns(int hPattern, int vPattern) {
/*
  fill(240, 218, 180);
  stroke(0);
  rect(125, 25, 600, 100);
  rect(25, 125, 100, 400);

  fill(240, 275, 180);
  rect(125, 125, 600, 400);

  noFill();
  stroke(3, 125, 135);
  float oldpx = 0;
  float oldpy = 0;

  for (int x = 0 ; x < width ; x ++) {
    float ax = x/float(width);
    float y = getThreshold(ax, hPattern);
    float px = x;
    float py =  - ( 100 * y); 
    
    if ( x > 0 ) line(oldpx, oldpy + height/2, px , py + height/2);
    oldpx = px;
    oldpy = py;
  }

  for (int y = 0 ; y < height ; y++) {
    float ay = y / float(height);
    float x = getThreshold(ay, vPattern);
    float px =  - (100 * x);
    float py = y;

    if ( y > 0 ) line(oldpx, oldpy, px, py);
    oldpx = px;
    oldpy = py;
  }
  */
}

int vx = 0;
int vy = 0;

void drawDots(int hPattern, int vPattern) {

    vx += random(-millis()/1000,millis()/1000);
    vy += random(-millis()/1000,millis()/1000);

  noStroke();
//  fill(205, 125, 28);
  int numEllipses = 500;
  for (int i = 0 ; i < numEllipses ; i++)
  {
    float px = width * getRandom(hPattern);
    float py = height * getRandom(vPattern);
    fill(255,20);
    ellipse((vx + px + width)%width, (vy + py + height)%height, 10, 10 );
  }
}

float loAngle = 0;
float hiAngle = PI;


float getThreshold(float x, int patternChoice) {

  float destLoAngle,destHiAngle;  

  switch(patternChoice) {
  case 0:
    destLoAngle = 0;
    destHiAngle = second() * PI;
    break;
  case 1:
    destLoAngle = PI;
    destHiAngle = 3 * PI;
    break;
  case 2:
    destLoAngle = second() * PI;
    destHiAngle = 5*PI;
    break;
  case 3:
    destLoAngle = 0;
    destHiAngle = 2*PI;
    break;
  case 4:
    destLoAngle = 0;
    destHiAngle = 4 * PI;
    break;
  case 5:
    destLoAngle = PI;
    destHiAngle = 2 * second() * PI;
    break;
  case 6:
    destLoAngle = 0;
    destHiAngle = PI;
    break;
  default:
    println("I don't know pattern choice "+patternChoice);
    destLoAngle = destHiAngle  = 0;
    break;  
  
  }
  
  loAngle += (destLoAngle - loAngle)/3000. ; 
  hiAngle += (destHiAngle - hiAngle)/2000. ;
  
  float angle = lerp(loAngle, hiAngle,x);
  float threshold = map( millis() / 300. * cos(angle), -1 , 1 , 0 , 1);

  return(threshold);
}
                
