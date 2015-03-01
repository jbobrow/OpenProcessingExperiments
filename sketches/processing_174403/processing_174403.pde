
int frames = 120, num=20, loLimit=400, hiLimit=100, rs;
float theta, sz=10, scal, edge, step;
color[] palette = {
  #A0ECD0, #ECD893, #E7AF7E, #B78376, #FFFFFF
};
color c;
 
void setup() {
  size(600, 500);
  noStroke();
  edge=100;
  step=(width-2*edge)/num;
}
 
void draw() {
  randomSeed(rs);
  background(#98989F);
  
  int i=0;
  
  for (int j=0; j<5; j++) {
    for (int x=100; x<501; x+=step) {
      float y = map(sin(j*PI/8+theta+(TWO_PI/num*i)), -2, 2, loLimit, hiLimit);
      for (int h=0; h<7; h++) {
        c = palette[j%5];
        fill(c, h*30);
        if (y>=hiLimit-100 && y<=loLimit) scal = map(y, loLimit-100, hiLimit, 1, 2.8-h*.3);
        ellipse(x, y, sz*scal, sz*scal);
      }
      fill(c);
      ellipse(x, y, sz, sz);
      i++;
    }
  }
  
  
 
  theta += TWO_PI/frames;
  //if (frameCount<frames+1) saveFrame("image-###.gif");
}



