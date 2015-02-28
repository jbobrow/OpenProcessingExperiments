
//a bad copy of
//random walk (brownian noise)
//http://en.wikipedia.org/wiki/Random_walk 

void setup() {
background(0);  
    size(800, 400);
    smooth();
    frameRate(400);
    strokeWeight(1);
  stroke(255, 255, 255);
} 
 
//int lastX = random(width);
//int lastY = random(height);

int lastX = 500;
int lastY = 400;
 
void draw() {
    //random walk (brownian noise)
    //http://en.wikipedia.org/wiki/Random_walk
    val noiseVal = 3;   
    lastX += random(-noiseVal, noiseVal);
    lastY += random(-noiseVal, noiseVal);    
    
    //lastX = constrain(lastX , 0, width);
    //lastY = constrain(lastY , 0, height);
    
    lastX = (lastX < 0) ? width : lastX;
    lastX = (lastX > width) ? 0 : lastX;    
    lastY = (lastY < 0) ? height: lastY;
    lastY = (lastY > height) ? 0 : lastY;
 
    point(lastX, lastY);
}
 
void mousePressed(){
  stroke(random(255), random(255), random(255));
  lastX = mouseX;
  lastY = mouseY;
}
