
void setup() {
  size(200,200);
}
 
void draw() {
  background(#c8bb9b);
  for(int x=0; x<360; x=x+1) {
    float y = noise(x*0.01+frameCount*0.01)*255;
    stroke(#53213a);
    line(x,0,x,y);
  }
}
 



