
int angle;
int[] center;
int dist=40;
int[] radii = new int[] {1,3,5,9,11};
int w = 500;
int h = 500;
int fr = 30;
int rDot = 2;
float[] dotCoords;

void setup(){
  angle=0;
  background(0);
  size(w,h);
  frameRate(fr);
  stroke(#00ff00);
}

void draw(){
  angle %= 360;
  background(0);
  for(int x=-max(radii)*dist;x<500;x+=dist){ // the max(radii) thing ensures even dot distribution.
    for(int y=-max(radii)*dist;y<500;y+=dist){
      point(x,y);
      for(int r : radii){
        center = new int[]{x+(r*dist), y+(r*dist)};
        dotCoords = new float[]{
          center[0]+ cos(radians(angle))*dist*r,
          center[1]+ sin(radians(angle))*dist*r};
        if(dotCoords[0]>0&&dotCoords[0]<w&& // the if statement keeps everything fast
          dotCoords[1]>0&&dotCoords[1]<h)   // by not drawing off-screen dots.
          ellipse(dotCoords[0], dotCoords[1], rDot, rDot);
      }
      
    }
  }
  println(angle);
  angle++;
}

