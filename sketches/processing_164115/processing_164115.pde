
void setup() {
  background(#50414C);
    size(600,600);
}
 
 
void draw() { 
 colorMode(HSB, 100);
  
     strokeWeight(20);
     frameRate(50);
    translate(width/2, height/2);  
    rotate(millis() * 0.001 * TWO_PI / 1.0);  
    translate(0, 0); // Move away from the center

     
for (int i = 0; i < width; i++) {
    float r = random(#FFFFFF);
    stroke(r);
    line(i, 0, i, height);
}
fill(random);
    noStroke();
    fill( random(255), random(255), random(255), random(255));
    ellipseMode(CORNER);
    ellipse(0,0,300,300);
    
    rectMode(CENTER);
    rect(0,0,100,100);
   
}


