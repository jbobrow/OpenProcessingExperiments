
void setup() {
  background(136,345,123); 
  size(500, 500);
}
void draw() 
{
 
for(int i=0; i<30; i++) 
 {  
   if (mousePressed) {
    fill(255,260,113);
  } else {
    fill(133,63,223);
  }
  ellipse(mouseX, mouseY, 45, 45);
  }
  
}


