
int w = 600;   //Width
int h = 600;   //Height

int xx = w/2;  //Half width
int yy = h/2;  //Half height

float nrx = xx;
float nry = yy;

int lastTime = 0;


void setup() {
  size (600, 600);
  background (0);
  colorMode(HSB);
  noCursor();
  smooth();
}


void draw () {

  float e = sin(radians(frameCount));
  float f = cos(radians(frameCount)); 

  float rx = random( 0, 100);
  float ry = random( 0, 200);


  int currentTime = millis();
  if (currentTime > lastTime + 4000) {
    nrx=rx;
    nry=ry;
    lastTime = currentTime;
  }

  float d = dist(xx, yy, nrx, nry);

  if (d > 1.0) {
    xx += (nrx - xx) * .025;
    yy += (nry - yy) * .025;
  }

  translate(width/2, height/2);

//SUN//

  noFill();
  strokeWeight(1.5);
  stroke (160+(e*12), e*60+220, 255+(f*128), 60);
  ellipse(0, 0, e*e*250+50, e*e*250+50);
  
  fill (0+(e*12), 155, 255+(f*28), 10);
  ellipse(0, 0, f*f*50+10, f*f*50+10);

//ORBITAL Gravity

  scale (e);
  
//Flares  

  pushMatrix();

  rotate(e*e*(xx+yy));  

  noStroke();
  fill (12+(e*12), 155, 255+(f*64), 250);

  ellipse (xx, yy, e*e*5+10, e*e*5+10); 

  translate(e*100+yy, f*100+xx);
  //fill (0,10);

  //stroke (170+(f*12), 155, 255+(e*50), 160);
  ellipse (xx/2, yy/2, e*e*20+10, e*e*20+10);

  translate(e*100+xx, f*100+yy);

  ellipse (yy/4, xx/4, e*e*20+10, e*e*20+10);

  popMatrix();
  
 //Blend

  blend(0, 0, width, height, -1, -1, width+1, height+1, BLEND);
}


