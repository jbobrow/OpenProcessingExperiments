
void setup() {
    size(500, 500);
   background(250, 250, 240); 
} 

void draw() {
    //background(255);
    
for(int y = 0; y < height; y = y + 5){
  for(int x = 0; x < width; x = x + 5){
    strokeWeight(0.5);
    line(mouseX, mouseY, 250, 250);}
}
}


