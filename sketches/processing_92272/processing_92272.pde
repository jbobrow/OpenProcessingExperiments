
//Lauren Lee
//Creative Computing
//200 Objects
//March 7 2013

int num=200;
float[] xpos = new float[num];
float[] ypos = new float[num];
float[] xspeed = new float[num];
float yspeed = 1;
int click = 0;
  
void setup() {
  size(500, 500);
  background(255);
  stroke(255,255,255,75);
  frameRate(8);
     for (int i=0; i<num; i++) {
    xpos[i] = int(random(width));
    ypos[i] = 0;
    xspeed[i] = int(random(1,5));
}
}
 
void draw() {
  fill (0,0,0, 25);
  for (int i=25; i<=600; i+=52) {
    for (int o=26; o<=600; o+=52) {
   ellipse(i,o,random(50,72) ,random(50,72));
    }
  }
  for(int i =0; i <num; i++){
  thingy(xpos[i], ypos[i]);
  ypos[i] += xspeed[i];
  xspeed[i] += yspeed;
}
}

void thingy(float x, float y) {
  noStroke();
fill(mouseX, mouseY, random(100,200), 50);
ellipse(x,y,100,100);
}

void mouseDragged() {
  xpos[click] = mouseX;
  ypos[click] = mouseY;
  xspeed[click] = -5;
  click+=1;
  if(click >= num) {
    click = 0;
  }
}



