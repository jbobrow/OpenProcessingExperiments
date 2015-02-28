
int h;
int m;
int s;
int current_sec;

int cell = 1;
int margin = 1;
int cols = 294;
int rows = 294;

void setup() {
  size((cell+margin)*cols,(cell+margin)*rows);
  frameRate(1);
  textSize(10);
  colorMode(HSB);
  noStroke();
  background(0);
}

void draw() {
  h = hour();
  m = minute();
  s = second();

  current_sec = h*60*60 + m*60 + s;

  for(int i=0; i<current_sec; i++){
   int x = (i % cols)*(cell+margin);
   int y = (i / rows)*(cell+margin);
   float sikisou = float(y)/height*255;
   fill(sikisou,255,255);
   rect(x,y,cell,cell);
  }
  
  text(h, 10, height-20);
  text(m, 30, height-20);
  text(s, 50, height-20);
  
}

