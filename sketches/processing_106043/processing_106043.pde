
PShape clock;

float hourX;
float minuteX;
float secondX;

float hourPosition;
float minutePosition;
float secondPosition;

int i;


void setup() {
  size(590,230,P2D);
  smooth();
  noStroke();
  
  i=second();

  }
  


void draw() {
  background(1,157,218);
  
  
hourX=hour();
minuteX=minute();
secondX=second();

i=second();

hourPosition=hourX*10;
minutePosition=minuteX*10;
secondPosition=secondX*10;

/////draw a clock  
  clock=createShape();
  clock.beginShape();
  
/////fill and stroke
  clock.fill(228,i*8,121);
  clock.noStroke();
  
//////make it!
  clock.vertex(minutePosition,0);
  clock.vertex(0,hourPosition);
  clock.vertex(secondPosition,height);
  
clock.endShape(CLOSE);
shape(clock);


}
  
  


