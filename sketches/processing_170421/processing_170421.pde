
int units=5, frames=320, step;
float theta=PI/2;

int[][] colors = {
          {122,0,0},
          {244,122,0},
          {205,60,60},
          {122,122,122}
        };
        
        
 
void setup() {
  size(500, 500, P2D);
  step = width/units;
  //frameRate(60);
  rectMode(CORNER);
}
 
void draw() {
  background(255);
  fill(0);
  
  noStroke();
  for (int i=-1; i<units+1; i++) {
    for (int j=-1; j<units+1; j++) {
      float x = (i+.5)*step;
      float y = (j+.5)*step;
      float sz = .25*sqrt(2)*step;
      float px = 0;
      float py = 0;
      
//      stroke(255,0,0);
//      line(x,0,x,height);
//      line(0,y,width,y);
//      noStroke();

      for (int k=0; k<4; k++) {
        float len = -PI/4+k*PI/2;
        float len2 = len+PI/2;
        switch(k%4) {
          case(0):
          px = x + map(sin(theta), -1, 1, 0, step);
          py = y;
          break;
          case(1):
          px = x;
          py = y + map(sin(theta), -1, 1, 0, step);
          break;
          case(2):
          px = x + map(sin(theta), -1, 1, step, 0);
          py = y;
          break;
          case(3):
          px=x;
          py = y - map(sin(theta), -1, 1, 0, step);
          break;
        }
        float _len = map(sin(theta), -1, 1, len, len+PI);
        float _len2 = map(sin(theta), -1, 1, len2, len2+PI);
        //arc(px, py, sz, sz, _len, _len2);
        
        pushMatrix();
        translate(px,py);
        rotate(len+PI/2+theta%(2*PI));
        fill(colors[k][0],colors[k][1],colors[k][2]);
        rect(0,0,sz,sz);
        popMatrix();
        
      }
    }
  }
  theta += TWO_PI/frames;
}



