
void setup(){
  
 size(500, 500);
 colorMode(HSB, 100); 
 background(0, 100, 100);
  
}

void draw(){
 
 crazySquare(random(width), random(height), random(width)/2, random(height)/2);
  
}

void crazySquare(float thisX, float thisY, float thisWidth, float thisHeight){
 noStroke();
 fill(0, 0, 100, (int)random(100));
 pushMatrix();
 
 if (mousePressed != true) {
    translate(thisX-20, thisY-20);
    rotate(random(1)*TWO_PI);
    fill((int)random(100), 100, 100, (int)random(100));
    
 } else {
   translate(mouseX - thisX/10, mouseY - thisY/10);
 }
 rect(0, 0, thisWidth, thisHeight);
 popMatrix();
  
}
                
