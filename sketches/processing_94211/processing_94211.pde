
// Gradientography

int w=600, h=400;                                                       // Define size of canvas
boolean swap=false, rot=false, trans=false, glob=false;                 // Define bools
color k1 = color(0, 0, 0, 1);                                           // Define gradient color 1 [keep alpha at 1]
color k2 = color(255, 0, 0, 255);                                       // Define gradient color 2
color c1, c2;                                                           // Init swappable colors
float interp = 1.0/600;                                                 // Calculate interporation

void setup() { 
  size(600, 400);                                                       // Canvas create using numeric variables to run via processing.js
}

void draw() {
  if (glob) { pushMatrix(); }                                                // Perform translate + rotation on glob matrix 
  if (trans && glob) { translate(random(-w/2, w/2), random(-h/2, h/2)); }
  if (rot && glob) { rotate(random(-360,360)); } 
  drawGradient();                                                            // Draw the actual gradient
  if (glob) { popMatrix(); }                                                 // Pop matrix if working on glob
  text("z - Rotate ["+rot+"]", 20, 20);                                      // Add text to sketch
  text("x - Translate ["+trans+"]", 20, 40);
  text("c - Global Matrix ["+glob+"]", 20, 60);
}

void drawGradient() {
  if (frameCount%25==0) { swap = !swap; }                                        // Flip swap bool
  if (swap) { c1 = k2; c2 = k1; } else { c1 = k1; c2 = k2; }                     // Flip colors for gradient
  for (int i=0; i<w; i++) {                                                      // For every line of sketch width, perform the following
    if (!glob && (trans || rot)) { pushMatrix(); }                               // Push matrix for EACH line if not glob
    if (trans && !glob) { translate(random(-w/2, w/2), random(-h/2, h/2)); }     // If translate (on) randomly shift origin point
    if (rot && !glob) { rotate(random(360)); }                                   // If rot (on) randomly rot origin point
    stroke( lerpColor(c1, c2, i*interp) );                                       // Set stroke color to be an interpolated color between the gradient colors depending on the horizontal (w) position (i in the for loop)
    line(i, 0, i, w);                                                            // Draw teh line!
    if (!glob && (trans || rot)) { popMatrix(); }                                // Only pop if not glob
  }
}

void keyPressed() {                          // Catch key presses and flip config bools
  if (key == 'z') { rot=!rot; }
  if (key == 'x') { trans=!trans; } 
  if (key == 'c') { glob=!glob; }
}



