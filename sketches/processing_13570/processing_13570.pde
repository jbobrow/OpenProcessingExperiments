
void setup() {
  size(400, 400);
  stroke(255);
  background(0, 0, 0);
} 

void draw() {
  //background(0, 0, 0);
  line(200, 0, mouseX, mouseY);
  stroke( 0, random(200), random(200), random(100));
  strokeWeight(random(7));
  
}


                
           
