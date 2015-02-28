
void setup() { 
    size(250, 250);
}


void draw() {  
    background(23, 28, 32);
    
    translate(width/2, height/2);   // Move coordinate system to center of sketch
 
    rotate(millis() * 0.001 * TWO_PI / 10.0);   // Move 360 degrees in ten second
    
    translate(80, 0); // Move away from the center
    
    rotate(millis() * 0.001 * TWO_PI);    // One revolution every second
    
    
    /* Ellipse */
    fill(255);
    noStroke();
    ellipseMode(CENTER);
    ellipse(0, 0, 40, 40);
    
    
    /* Line */
    strokeWeight(5);
    stroke(255, 0, 0);
    line(0, 0, 40, 0);
}
