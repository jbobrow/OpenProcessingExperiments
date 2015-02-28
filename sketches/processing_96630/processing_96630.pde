

 int strokeFuzz=4; 
int strokeLucidity=50; 
int lineDensity=40; 
void setup () {
    size (325,450);
    background (0);
    smooth();
}
 
void draw() {
  if (!mousePressed){
  background(0);
    int s = second ();
    int m = minute ();
    int h = hour ();
 
    fill (240);
    strokeWeight(6);
    stroke(255);
    noFill();
    noStroke();
 strokeWeight(random(strokeFuzz));
        stroke(0, 245, random(0,10), random(40,strokeLucidity));
    //center sketch
    translate (width/2,225);
  
    // hour
    strokeWeight(5);
    pushMatrix();
    rotate(radians (30*h));
    line(0,0,0,-60);
    popMatrix();
 
    //minute
    strokeWeight(5);
    pushMatrix();
    rotate(radians (6*m));
    line(0,0,0,-90);
    popMatrix(); 
    
    //minute
    strokeWeight(5);
    pushMatrix();
    rotate(radians (2*s));
    line(0,0,0,-70);
    popMatrix();
  } 
    if (mousePressed){
        background(0);
    int s = mouseX;
    int m = mouseY;
    int h = hour ();
 
    fill (240);
    strokeWeight(6);
    stroke(255);
    noFill();
    noStroke();
 strokeWeight(random(strokeFuzz));
        stroke(0, 245, random(0,10), random(40,strokeLucidity));
    //center sketch
    translate (width/2,225);
  
    // hour
    strokeWeight(5);
    pushMatrix();
    rotate(radians (30*h));
    line(0,0,0,-60);
    popMatrix();
 
    //minute
    strokeWeight(5);
    pushMatrix();
    rotate(radians (6*m));
    line(0,0,0,-90);
    popMatrix(); 
    
    //minute
    strokeWeight(5);
    pushMatrix();
    rotate(radians (2*s));
    line(0,0,0,-70);
    popMatrix(); 

}
}

