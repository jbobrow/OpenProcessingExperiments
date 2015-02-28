
void setup() {
    size(400, 400);
    smooth();
}
 
 
void draw() { 
    background(0);
    
    translate(width/2, height/2);   // Koordinatensystem in die Mitte 
    rotate(millis() * 0.001 * TWO_PI / 5.0);   // Koordinatensystem dreht sich 
    
    
    pushMatrix();

    translate(90, 0); // Abstand zur Mitte
    rotate(millis() * 0.001 * TWO_PI/ 10.0);    //Kreis dreht sich um die eigene Achse

    /* Ellipse */
    fill(100);
    noStroke();
    ellipseMode(CENTER);
    ellipse(0, 0, 40, 40);
    
    
     translate(30, 30); // Kreis dreht sich um Kreis
     rotate(millis() * 0.0003 * TWO_PI/ 1.0);    // Kreis dreht sich um die eigene Achse
     ellipse(5,5,15,15);
     
     translate(15, 15); // Kreis dreht sich um Kreis
     rotate(millis() * 0.0003 * TWO_PI/ 20.0);    // Kreis dreht sich um die eigene Achse
     ellipse(5,5,7,7);
    
        
    popMatrix();
    
    
    

    rotate(millis() * 0.001 * TWO_PI / 10.0);   // Koordinatensystem dreht sich 
    
   
    pushMatrix();

    translate(20, 0); // Abstand zur Mitte

    rotate(millis() * 0.001 * TWO_PI/ 5.0);    //Kreis dreht sich um die eigene Achse
    
    scale(0.5);
    

    /* Ellipse */
    fill(200);
    noStroke();
    ellipseMode(CENTER);
    ellipse(10, 10, 40, 40);
    
     translate(60, 60); // Kreis dreht sich um Kreis
     rotate(millis() * 0.0003 * TWO_PI/ 40.0);    // Kreis dreht sich um die eigene Achse
     ellipse(5,5,20,20);
     
     translate(25, 25); // Kreis dreht sich um Kreis
     rotate(millis() * 0.0003 * TWO_PI/ 20.0);    // Kreis dreht sich um die eigene Achse
     ellipse(5,5,5,5);
    
        
    popMatrix();
    
    
    
    rotate(millis() * 0.001 * TWO_PI / 10.0);   // Koordinatensystem dreht sich 
    
   
    pushMatrix();

    translate(60, 0); // Abstand zur Mitte

    rotate(millis() * 0.001 * TWO_PI/ 30.0);    //Kreis dreht sich um die eigene Achse
    
    //scale(0.2);
    

    /* Ellipse */
    fill(250);
    noStroke();
    ellipseMode(CENTER);
    ellipse(0, 0, 40, 40);
    
     translate(20, 20); // Kreis dreht sich um Kreis
     rotate(millis() * 0.0003 * TWO_PI/ 5);    // Kreis dreht sich um die eigene Achse
     ellipse(5,5,20,20);
     
     translate(25, 25); // Kreis dreht sich um Kreis
     rotate(millis() * 0.0003 * TWO_PI/ 20.0);    // Kreis dreht sich um die eigene Achse
     ellipse(3,3,15,15);
    
        
    popMatrix();
}

