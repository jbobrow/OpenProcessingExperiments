
void setup() {
 // set window size
 size(600,600);
 
 // styling
 smooth();
 background(255);
 
 // start in center
 

}
void draw() {
     if (mousePressed){

 // random radius 
 float r = random(100);
 noStroke();
 // random color
 fill(random(255),random(255),random(255),50);
 
 // draw ellipse
 ellipse(mouseX, mouseY, r, r);
}
else{
 float r = random(100);
 noStroke();
 // random color
 fill(0);
  ellipse(random(width), random(height), r, r);
}
}
