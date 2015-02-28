
PFont myFont;
int differenceInTime;
PImage img;

float a;
float b;
float c;
float theta;
boolean reTime = false;
int multi = 1;
float cirlce;
PGraphics pg;
StopWatchTimer sw;
float s = 0;


void setup() {
  size(1280, 720, P2D);
  myFont = createFont("Arial", 30);
  textFont(myFont, 30);
  img = loadImage("earth.jpg");

  strokeWeight(3);
  noFill();
  noCursor();
  smooth();

  frameRate(30);
  cirlce=15;
  
  theta=360*cirlce;
  pg =  createGraphics(1280, 720, P2D);

  pg.background(img);
  sw = new StopWatchTimer(); 
  sw.start();
}


void draw() {
  pg.beginDraw();
  pg.strokeWeight(3);

  pg.translate(width/2, height/2); 
  for (int i =0; i< 10; i++) {
    theta=theta+ multi*0.60;
    a = 360-theta/cirlce;
    if (theta < 0 || theta >360*cirlce) {
      multi = multi * -1; 
      break;
    }
    
    if (c==0&&b==0) {
      pg.background(img);
    }
    if (multi > 0) {

     
      pg.stroke(255);
    }

    if (multi < 0) {
      pg.stroke(0, 0, 0);
    }

    
    b =a*sin(radians(theta)); 
    c =a*cos(radians(theta));


    pg.point(c, b);
  }

  pg.endDraw();
  translate(width/2, height/2); 
  pushMatrix();
  image(pg, -width/2, -height/2);
  differenceInTime = 60*sw.minute()+sw.second();
  if(keyPressed)
  {
    reTime = true;
  }
  if(reTime == true){
 text(int(s), -15, 10);
 s=s+1/frameRate;
  }
  else{
    text(differenceInTime, -15, 10);
  }
  
  popMatrix();
  
}


