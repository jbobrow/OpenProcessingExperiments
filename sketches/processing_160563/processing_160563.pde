
void setup() {
 // set window size
 size(1000, 900);
 
 // styling
 smooth();
 background(0);
 
 // start in center
 mouseX=width/2; mouseY=height/2;
}
 
void draw() {
 // random radius 
 float r = random(200);
 float r2 = random(60);
 
 // random color
 fill(random(255),random(200),random(255));

 ellipse(mouseX, mouseY, r, r);
 ellipse(mouseX+10, mouseY+10, r, r);
 stroke(255);
 line(mouseX, mouseY, width/2, 0);
 
 
}
