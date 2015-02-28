
void setup() {
    size(500, 500);
    smooth();
}
 
 
void draw() { 
    background(255);
    noStroke();
    strokeWeight(0.5);
    
    fill(200);
    translate(width/2, height/2); // Move coordinate system to center (damit bezugspunkt zur rotation in der mitte ist)
    ellipseMode(CENTER);
    ellipse(0,0,50,50);
    
    
    //Ellipse_1+1a
    pushMatrix();

    rotate(millis() * 0.0008 * TWO_PI / 20.0);   // Move 360 degrees in ten second
    translate(200, 0);   // Move coordinate system to center of sketch
    fill(155);
    noStroke();
    ellipse(0, 0, 20, 20);
    pushMatrix();
    rotate(millis() * 0.0008 * TWO_PI / 10.0);   // Move 360 degrees in ten second
    translate(30, 0);   // Move coordinate system to center of sketch
    fill(200);
    noStroke();
    ellipse(0, 0, 10, 10);
        
    popMatrix();
    popMatrix();
    
    //Ellipse_2 
    pushMatrix();
    rotate(millis() * 0.001 * TWO_PI / 15.0);   // Move 360 degrees in ten second
    translate(220, 0);   // Move coordinate system to center of sketch
    fill(190);
    noStroke();
    ellipse(0, 0, 15, 15);
    popMatrix();
     
    //Ellipse_3 
    pushMatrix();
    rotate(millis() * 0.0005 * TWO_PI / 10.0);   // Move 360 degrees in ten second
    translate(100, 0);   // Move coordinate system to center of sketch
    fill(155);
    noStroke();
    ellipse(0, 0, 25, 25);
    popMatrix();
    
}


