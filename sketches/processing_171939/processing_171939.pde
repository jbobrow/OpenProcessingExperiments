
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
    
    float steps = random (4, 12);
    float x = 0; // Zählvariable;
   
    while(x < width) {
        
        /* zeichnen des Rechecks */
        rect(x, 0, steps, height-1);
         
        /* änderung der zählvariable */
        x = x + steps;
    }
}

void mousePressed () {
    redraw();
}
 

