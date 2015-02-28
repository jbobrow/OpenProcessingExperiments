
void setup() {
size (800, 600);
}

void draw() {

// Line across middle of screen
line (0, height/2, width, height/2); 
strokeWeight (3); // Line thickness

// Rectangle #1
fill (#1023FF);
rect (0, 0, width, height/2);
  
// Rectangle #2
fill (#501205);
rect (0, height/2, width, height/2);
}
                
                
