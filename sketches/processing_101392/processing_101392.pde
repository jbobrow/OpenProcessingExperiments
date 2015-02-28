
size(250,250);
PFont f;
  
void setup() {
  size(200,200);
  f = createFont("Arial",16,true);
}

void draw() {
  background(250);
  textFont(f,50);     
  fill(0);            
  text("JANJAN!",10,150);
}
