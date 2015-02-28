
void setup(){
  size(800,600);
  background(255, 134,38);
}
    

float xt = 50;
float yt = 100.0;
float inj = .001;
float ox,oy;

float sc = 0;
 
 
void draw(){
  float x = noise(xt)*width;
  float y = noise(yt)*height;
  xt+=inj;
  yt+=inj;
  stroke(0);
  strokeWeight(sc);
  sc+=inj;
  if(sc>2){
    sc=inj;
  }
  line(x,y,ox,oy);
  ox = x;
  oy = y;
}
