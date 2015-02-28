
void setup(){ 
  size(800,800);
 background(255); 
noCursor(); //removes cursor 
smooth(); //can smoothen some things out
 } 
void draw(){ 
float diff = dist(mouseX, mouseY,pmouseX,pmouseY); // calculates mouse speed
 noStroke(); fill(random(255),random(255),random(255)); ellipse(mouseX,mouseY,diff,diff);
 if((mouseX<20)&(mouseY<20)) {
 background(255); //drag mouse to top left corner to clear the screen
} 
}


