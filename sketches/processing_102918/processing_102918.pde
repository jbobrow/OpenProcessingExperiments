
float dist, max_dist;
int x, y;

void setup() {  //setup function called initially, only once
  size(512, 512);
  max_dist=sqrt(width*width+height*height);
  smooth();
  background(255);  //set background white
  noStroke();
  fill(random(255), random(255), random(255), 128);
}

void draw() {  //draw function loops 
  background(255);
  for(y=0; y<=height; y+=16) {
      for(x=0; x<=width; x+=16) {
          dist=sqrt((x-mouseX)*(x-mouseX)+(y-mouseY)*(y-mouseY));
          ellipse(x, y, dist/max_dist*32, dist/max_dist*32);
      }
  }
}
