
PFont myFont;

void setup() {
  size(1000, 300, P3D);  
  background(235, 235, 225);
}

void draw() {
    lights();
  
  
  // Change height of the camera with mouseY
  camera(800.0, mouseY, 290.0, // eyeX, eyeY, eyeZ
         0.0, 0.0, 0.0, // centerX, centerY, centerZ
         0.0, 50.0, 0.0); // upX, upY, upZ
         
  myFont = createFont("Helvetica", 48); 
  fill (125,160,176);
  textFont(myFont);
  text("AT&T", mouseX, mouseY, random(250), random(-100), random(400));
}



