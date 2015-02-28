
int w=500, h=500;
//int w=screen.width;
//int h=screen.height;
void setup() {
  size(w, h);
  //noStroke();
  stroke(255);
  smooth();
}

void draw() {
  background(0);
  for (int y = 0; y<height+1;y=y+20) {
    for ( int x = 0; x<width;x=x+20) {
  
    ellipse(x+noise(y+frameCount/20.0)*15, noise((frameCount/3.0+x)/20.0)*40+y-20, 10, 10);
    //line(x+noise((frameCount+y)/100.0)*10.0,y,x+10,noise((frameCount+y)/10.0)*20.0+y);
    }
  }
}


