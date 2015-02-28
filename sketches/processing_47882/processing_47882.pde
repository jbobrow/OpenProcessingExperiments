
void setup(){
noCursor();
  size (600, 600);
background (0, 255);

  
}
void draw(){
for(int i=0; i<1000; i++) {
  float r = random(i*mouseY/width);
  stroke(r*4);
  line(mouseY-mouseX, i, width/2, height/2);
}
}
  
                
                
