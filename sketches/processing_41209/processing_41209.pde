
int bri=0;

void setup() {
  size(400,400);
}  
  
void draw() {
  background(map(mouseX,0,400,0,255),map(mouseY,0,400,0,255),0);
}
                
