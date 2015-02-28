
/*
*Green, Green, Grass of Home
*a summer time grass
*moon rise and set
*fireflies flying during the night
*raining when the minute of time around 0-20 

**by KokFu Lok
**kokfu89@gmail.com

 References:
 -cloud & windy background by Funatti
 http://www.openprocessing.org/sketch/10859
 -moving moon on a bezier curve
 http://forum.processing.org/one/topic/moving-an-object-along-a-bezier-curve.html
 -grass
 http://www.openprocessing.org/sketch/44747
 -rain
 http://www.openprocessing.org/sketch/16707
 https://www.google.com/url?q=http://www.openprocessing.org/sketch/44747&sa=U&ei=gC1wUu2MGciKrQe5yIGwCA&ved=0CAcQFjAA&client=internal-uds-cse&usg=AFQjCNGf3bBIHCPEqHZzFGe9QGnLs0rmAg
 */

int N = 1300;
color palette[] = new color[255];
Particle particles[] = new Particle[N];
Rain[] rain = new Rain[200];//density of rain

PFont font,font2,font3;

void setup() {
  size(600, 338);
  colorMode(HSB, 255);
  font = loadFont("Bauhaus93-30.vlw");
   font2 = loadFont("Complex-30.vlw");
   font3 = loadFont("Broadway-30.vlw");
   
  fill(255);
  createPalette();
  createParticles();
  for (int i = 0; i < rain.length; i++) {
    rain[i] = new Rain(random(width), random(height), random(50));
  }
}


void draw() {


  
  
  for (int i=0; i<height; i++) {
    stroke(palette[int(map(i, 0, height, 0, 255))]);
    line(0, i, width, i);
  }  
  for (int j=0; j<N; j++) {
    particles[j].draw();
    particles[j].move();
  }

  daylight();
  moon();

  grass(2, 3, 5, 5, -20, 20, 50, 200);
  grass(2, 1, 10, 5, -50, 20, 100, 350);
  grass(3, 2, 15, 30, -10, 60, 60, 280);
  earth();
  firefly();

  strokeWeight(1);
  int tm=minute();
  if (tm>0 && tm<25) {
    for (int i = 0; i < rain.length; i++) {
      rain[i].move();
      rain[i].display();
    }
  }

time();
}

void time(){
 
 int s = second();
 int m = minute();
 int h = hour(); 
  if (s == 0)
    s = 1;
  if (m == 0)
    m = 1;
  if (h == 0)
    h = 1;
    if (s<30){
      fill(255);}
      else{
        fill(0);}
textFont(font2, 30);
text(nf(hour(),2) + ":" + nf(minute(),2) + ":" + nf(second(),2),435,338-10);
}

class Rain {
  float x, y, s;
  Rain(float _x, float _y, float _s) {
    x = _x;
    y = _y;
    s = _s;
  }
  void move() {
    y += s;
    if (y > height) y = 0;
  }
  void display() {
    stroke(132, 204, random(100,201), random(80, 180));
    line(x, y, x, y + random(60));//random control the max length
  }
}


void firefly() {
  float t=second();
  for (float i=t;i<31;i++) {
    noStroke();
    fill(41, 87*2.55, 100*2.55, random(30, 200));
    ellipse(random(width), random(30, height), random(0.1, 10), random(0.1, 10));
  }
}

void grass(float frame, float sWeight, float xstep, float border, 
float minSwing, float maxSwing, float minHeight, float maxHeight) {
  noFill();
  int t = second();
  frameRate(frame);
  float x = 10;
  float y = 338-8;

  //grassPositions
  stroke(252);
  for (x=border; x<=width-border; x+=xstep) {
    point(x, y);
  }
  //drawGrasses
  stroke(random(92*0.7, 130*0.7), random( 198, 255), random(150, 255), random(60, 100));
  strokeWeight(sWeight);
  for (x=border; x<=width-border; x+=xstep) {
    float x1 = x+random(minSwing, maxSwing);
    float y1 = y-random(minHeight, maxHeight);
    line(x, y, x1, y1);
  }
}



void earth() {
  noStroke();
  fill(43*0.7, 67*2.55, random(80, 64*2.55));
  rect(0, 338-10, width, 10);
}
void moon() {
  int x1=-22;
  int x2=20;
  int x3=580;
  int x4=622;
  int y1=200;
  int y2=-20;

  noFill();
  noStroke();
  bezier(x1, y1, x2, y2, x3, y2, x4, y1);

  //moon
  float t =  second()*0.033;
  float x = bezierPoint(x1, x2, x3, x4, t);
  float y = bezierPoint( y1, y2, y2, y1, t);

  fill(41, 87*2.55, 100*2.55);//moon color
  for (float i=t*100; i<51;i++) { 

    ellipse(x, y, 45*2*t, 45*2*t);
  }
  for (float i=t*100; i>50 && i<101;i++) { 
    ellipse(x, y, 45/(2*t), 45/(2*t));
  }

  //fill(53*0.7,50*2.55,100*2.55); //sun color
  //fill(41,87*2.55,100*2.55); //moon color
}

void daylight() {
  //daylight
  noStroke();
  float angle1=radians(second()*6);
  float sinval=(sin(angle1)*255)+10;
  fill(0, 100, 0, sinval);
  rect(0, 0, width, height);
}


void createParticles() {
  for (int i=0; i<N; i++) {
    particles[i] = new Particle(random(width), random(height), int(random(100)));
  }
}

void createPalette() {
  for (int i=0; i<255; i++) {
    palette[i] = color((255-i)/20+140, 255, 255);
  }
}

class Particle {
  float x;
  float y;
  int s;

  Particle(float _x, float _y, int _s) {
    x = _x;
    y = _y;
    s = _s;
  }

  void move() {
    x += random(6);
    y += random(5) - 2;

    if (x<0) x = width;
    if (x>width) x = 0;
    if (y<0) y = height;
    if (y>height) y = 0;
  }

  void draw() {
    fill(255, 15);
    noStroke();
    ellipse(x, y, s, s);
  }
}



