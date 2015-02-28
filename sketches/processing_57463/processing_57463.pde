
float angleA = radians(50);
float angleB = 0;
float omega = HALF_PI/(60);
float x1,x2,x3,x4,y1,y2,y3,y4 = 0;
float a,b,c,d = 0;
float delta = 1;
float n = 0;
float[] positionX = new float[1];
float[] positionY = new float[1];
int lineCounter = 0;
String X,Y;

void setup() {
  frameRate(20);
  PFont font;
  font = loadFont("Calibri-Bold-24.vlw");
  textFont(font);
  size(800, 500);
  smooth(); 
}

void draw() {
  curve(x1,y1,x2,y2,x3,y3,x4,y4);
  background(255);
  //bar length
  a = 160;
  b = 400;
  c = 200;
  d = a+b-c;
  //position of joint 1
  x1 = 180;
  y1 = height/2;
  //position of joint 2
  x2 = x1 + a*cos(angleA);
  y2 = y1 + a*sin(angleA);
  //position of joint 4
  x4 = x1 + d;
  y4 = height/2;
  // A factor
  float A1 = pow(a,2) - pow(b,2) + pow(c,2) + pow(d,2) - 2*a*d*cos(angleA);
  float A2 = 2*c*d - 2*a*c*cos(angleA);
  float A3 = -2*a*c*sin(angleA);
  angleB = 2*atan((-1*A3-sqrt(pow(A3,2)-pow(A1,2)+pow(A2,2)))/(A1-A2));



  //position of joint 3
  x3 = x4 + c*cos(angleB);
  y3 = y4 + c*sin(angleB);
  
  positionX = append(positionX,(x3-x2)/2+x2);
  positionY = append(positionY,(y3-y2)/2+y2);

  if (positionX.length >500) {
    for (int i=0; i<positionX.length-1; i++) {
      if (mousePressed != true) {
        positionX[i] = positionX[i+1];
        positionY[i] = positionY[i+1];
      }
    }
    positionX = expand(positionX, 500);
    positionY = expand(positionY, 500);
  }
 

  for (int i=2; i<positionX.length-1; i++) {
    stroke(0,40);
    strokeWeight(0.5);
    line(positionX[i-1],positionY[i-1],positionX[i],positionY[i]);
  }
  
  for (int i=1; i<positionX.length-1; i=i+50) {
    for (int j=1; j<positionX.length-1; j=j+5) {
      stroke(0,20);
      strokeWeight(1);
      line(positionX[j],positionY[j],positionX[i],positionY[i]);
      if (positionX.length !=500) {
        lineCounter++;
      }
    }
  }
  
  
  stroke(0,50);
  strokeWeight(10);
  line(x1, y1, x2, y2);
  stroke(0,50);
  strokeWeight(10);
  line(x4, y4, x3, y3);
  stroke(0,50);
  strokeWeight(10);
  line(x2, y2, x3, y3);
  if ( mousePressed != true ) {
      angleA = angleA + omega*delta;   
  }
  fill(0,50);
  ellipse((x3-x2)/2+x2,(y3-y2)/2+y2,10,10);
 
  fill(15,180);
  if (positionX.length != 500) {
    text("Thread Count: "+lineCounter,(x3-x2)/2+x2+10,(y3-y2)/2+y2+5);
  } else {
    text("Count End At "+lineCounter,(x3-x2)/2+x2+10,(y3-y2)/2+y2+5);
  }
  println(positionX.length);
}

