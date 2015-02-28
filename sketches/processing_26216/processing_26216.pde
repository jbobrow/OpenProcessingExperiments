
void setup() {
  size(350,350);
}
 
void draw() {
  background(#c6b999);
  for(int x=0; x<360; x=x+1) {
    float y = noise(x*0.01+frameCount*0.01)*255;
    stroke(#471030);
    line(x,0,x,y);
  }
}
 


