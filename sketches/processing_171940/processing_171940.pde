
void setup () {
  size (600, 200);
  smooth(); 
  noLoop();
}
  
void draw () {
    background (#57385c);
       
    /* Farbe und Kontur festlegen */
    stroke (#57385c);
    strokeWeight (1);
    fill (#ffedbc);
     
    float stepsX = random (10, 20);
    float stepsY = random (10, 20);
    
    float x = 0; // ZÃ¤hlvariable;
    
    while(x < width) {
        
        float y = 0; // zÃ¤hlvariable
        while(y < height) {
             
            /* zeichnen des Rechecks */
            rect(x, y, stepsX, stepsY);
            
            /* Ã¤nderung der zÃ¤hlvariable */
            y = y + stepsY;
        }
          
        /* Ã¤nderung der zÃ¤hlvariable */
        x = x + stepsX;
    }
}
 
void mousePressed () {
    redraw();
}
