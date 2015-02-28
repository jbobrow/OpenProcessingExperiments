

void setup(){
frameRate(20);
noCursor();
  size (600, 600);
background (0, 255);

  
}
void draw(){
for(int i=0; i<600; i++) {
  float r = random(i*mouseY/width);
  float r2 = random(mouseX);
  stroke(r*2);
  line(0, i/r2, width, i*r2);
}}
                
                
