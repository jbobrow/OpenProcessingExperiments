
void setup() {
  size(400, 800);
  stroke(100);
  background(97,252,46);
} 

void draw() {
  background(97,252,46);
 
  float diam = random(200);
  ellipse(width/2,height/2,diam,diam);
 
   fill(random(255),50);
  ellipse(mouseX,mouseY,10,70);
   
   
  stroke(255,255,255,30);
  line(height/2,width/2,mouseX,mouseY);

}




                
                
