
void setup() {
size(800,800);
background(#E5FFFB);
frameRate(2);
smooth();
  stroke(255,255,255);
  colorMode(HSB); }
void draw() {
translate(width/2,height/2); 
 {
  pushMatrix();
  for(int i = 0; i<100; i=i+2) {
    float myAngle = random(0,30);
    rotate(radians(myAngle));
    float rectSize = map(i,0,80,250,200);
    rect(0,0,rectSize,rectSize);
    if(myAngle<30)
  fill(random(70),100,250,50); 
}
  popMatrix();
}
}


