
void setup(){
    //size (width, height);
    size (200, 200);
   
    frameRate(20);
     
}

void draw(){

    noStroke ();
    
    //background (red, green, blue)
    background (155, 212, 255);
    
   /* textSize(10);
    text("x: " + mouseX , 5, 185);
    text("y: " + mouseY , 5, 195);*/
    
    
    // Haarfarbe braun
    fill (100, 27, 3);
    // Haare
    ellipse (90, 80, 110, 150);
    ellipse (36, 110, 35, 35);
    ellipse (144, 110, 35, 35);
    
     // Gesicht Hautfarbe
    fill (255, 225, 196);
    // Gesicht
    ellipse (90, 90, 100, 140);
    
    // Augenweiss
    stroke (100, 27, 3, 100);
    fill (255);
    ellipse (70,80,20,8);
    ellipse (110,80,20,8);
    noStroke();
    
    // Augen blau
    fill (68, 88, 198);
    //Auge links
    float augenpos = map(mouseX, 0, width, 65, 75);
    ellipse (augenpos, 80, 7, 7);
    //Auge rechts
    augenpos = map(mouseX, 0, width, 105, 115);
    ellipse (augenpos, 80, 7, 7);
    
    int y = 67;
    if(mousePressed ==true) {
        y = 72;
    }
    stroke(100, 27, 3);
    strokeWeight(5);  // Augenbraue
    line(63, 67, 77, y);
    line(103,y,117, 67);
    strokeWeight (1);
    noStroke ();
     
    // Mund rot
    fill (250, 70, 10);
    // Mund
    ellipse (90, 130, 32, 10);
     
    //Mundlinie als farbige Linie dunkelrot
    stroke (155, 39, 0);
    // Mundlinie
    line (75, 130, 104, 130);
    
    // Lippenkerbe hautfarbe
    fill (255, 225, 196);
     
    noStroke ();
     
    // Lippenkerbe
    ellipse (90, 123, 9, 9);  
    
}


