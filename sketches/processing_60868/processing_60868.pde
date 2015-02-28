
void setup() {
    size(700, 700);
}
 
void draw() { 
    background(23, 28, 32);
    
    /* main STAR*/
    fill(0, 200, 200);
    noStroke();
    ellipseMode(CENTER);
    ellipse(width/2, height/2, 100, 100);
    translate(width/2, height/2);   // Move coordinate system to center of sketch

      pushMatrix();
    
      rotate(millis() * 0.001 * TWO_PI / 5);   // Move 360 degrees in ten seconds
      
    
      translate(100, 0); // Move away from the center
      rotate(millis() * 0.001 * TWO_PI/ 5);    

      /* first planet */
      fill(0, 140, 90);
      noStroke();
      ellipseMode(CENTER);
      ellipse(0, 0, 20, 20);
     
    
      translate(15, 0);
      rotate(millis() * 0.001 * TWO_PI);    
      /* first planet moon */
      fill(random(255), random(255), random(255));
      noStroke();
      ellipseMode(CENTER);
      ellipse(0, 0, 5, 5);
    
      popMatrix();
      
      pushMatrix();
    rotate(millis() * 0.001 * TWO_PI / 10.0);   // Move 360 degrees in ten seconds

    translate(170, 0); 
    rotate(millis() * 0.001 * TWO_PI/ 15);    

    /* second planet */
    fill(250, 150, 50);
    noStroke();
    ellipseMode(CENTER);
    ellipse(0, 0, 40, 40);
     
      pushMatrix();
    
      translate(30, 0);
      rotate(millis() * 0.001 * TWO_PI/ 9);    // One revolution every second
      /* secondplanet moon */
      fill(random(255), random(255), random(255));
      noStroke();
      ellipseMode(CENTER);
      ellipse(0, 0, 10, 10);
    
      popMatrix();
      popMatrix();
      
      pushMatrix();
    
    rotate(millis() * 0.001 * TWO_PI / 20);   // Move 360 degrees in ten seconds

    translate(250, 0); 
    rotate(millis() * 0.001 * TWO_PI/ 15); 
      
    /* third planet */
    fill(250, 0, 250);
    noStroke();
    ellipseMode(CENTER);
    ellipse(0, 0, 60, 60);
     
      pushMatrix();
    
      translate(40, 0);
      rotate(millis() * 0.001 * TWO_PI/ 12);    // One revolution every second
      /* third planet moon */
      fill(0, 250, 50);
      noStroke();
      ellipseMode(CENTER);
      ellipse(0, 0, 10, 10);
    
      popMatrix();
      popMatrix();
    
}


