
float[] ran;  //{ellipse(5,10,8,9), ellipse(4, 3, 8,9)};
 
void setup() {  // this is run once.   
    
    // set the background color
    background(255);
    
    // canvas size (Variable aren't evaluated. Integers only, please.)
    size(300, 300); 
      
    // smooth edges
    smooth();
    
    // limit the number of frames per second
    frameRate(30);
    
    // set the width of the line. 
    strokeWeight(12);
    
} 
void draw() {  // this is run repeatedly.  
    // set the color
    stroke(random(50), random(255), random(255), 100);
    
    background(255);
    
    // draw the line
    line(mouseX, mouseY, 100, 300);
    
    //ellipse(5,10,8,9);
    
      float x = ( ( mouseX + exp( (mouseY-height) / (mouseX-width) ) * width ) / ( 1 + exp( (mouseY-height) / (mouseX-width) ) ) );
   
    float y = ( ( (mouseY-height) / (mouseX-width) ) * (x-width) + height );
    if (mousePressed && (exp(mouseX-x)) - (exp(mouseY-y)) < a ) {
        noStroke();
        noFill();
        ellipse(5,10,8,9);
        }
        if (!mousePressed) {
         ellipse(5,10,8,9);
        }
}
