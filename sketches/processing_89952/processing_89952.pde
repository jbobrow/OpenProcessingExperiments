
PGraphics buffer;    // Framebuffer datatype
boolean reflectionSurface;

void setup(){
  size(800,800);    // P3D renderer runs this twice as fast.
  buffer = createGraphics(width/2, height/2);  //Framebuffer constructor
  noStroke();
  reflectionSurface = false;
}

void draw(){
 //frame.setTitle(str(frameRate));        // Doesn't work on openProcessing
 preDraw();                          // Call this before drawing
 
 //    -Your drawing calls go here-    
 //Just make sure you prefix it with buffer so that it draws to the framebuffer
 
 
 // Code below by Amanda Marie Gatton
 int s = second();
 int h = hour();
 
 buffer.fill(s, s + s,  s, s );
 buffer.rect(-1, -1, width/2+2, height/2+2);
   
 STARS(mouseY + s + 30, mouseY + s);
 STARS(mouseY + s, mouseX + s);
 STARS(mouseX + s + 50, mouseX + s);
 STARS(mouseY + s + 94, mouseX + 33);
 STARS(mouseX + s - 55, mouseX - 80);
 STARS(mouseY + s + 100, mouseY - 100);
 STARS(mouseX + s + 100, mouseX - 100);
 STARS(mouseX - s - 100, mouseX - 100);
 STARS(mouseX - s- 200, mouseX - 300 + s);
 STARS(mouseY - s- 300, mouseX - 200 + s);
 STARS(mouseY + s - 180, mouseX -100 - s);
 STARS(mouseX - s - 90, mouseX - 100 + s);
 
 //    -End draw calls-
 
 postDraw();    // Call this after drawing
 
 if (reflectionSurface == true) {        // Reflection surface effect
   fill(255, 40);
   rect(0,height/2,width,height);            // Not drawn to the framebuffer- it's on top
 }
}

void preDraw(){        // Called before drawing to setup the framebuffer
  buffer.beginDraw();
}

void postDraw(){      // Does all the fancy reflections after draw calls
  buffer.endDraw();
  image(buffer, 0, 0);  
  pushMatrix();                 //Saves the matrix
  scale(-1,1);
  image(buffer, -width, 0);    // When the scale is negative, the coord is negative
  popMatrix();                 // Resets the matrix
  pushMatrix();
  scale(1,-1);
  image(buffer, 0, -height);
  popMatrix();
  pushMatrix();
  scale(-1,-1);
  image(buffer, -width, -height);
  popMatrix();
}

void STARS(int x, int y){            // Function by Amanda Marie Gatton
  buffer.fill(234, 210, 245);
  buffer.ellipse( x+ 5, y + 40, 7,7);
 buffer.fill(8, 255, 179);
 buffer.ellipse(x + 99, y + 10, 5, 5);
 buffer.fill(252, 145, 246);
 buffer.ellipse (x + 15, y + 25, 6,6);
 buffer.fill(15, 57, 255);
 buffer.ellipse ( x + 66, y + 10, 7, 7);
 buffer.fill(140, 54, 255);
 buffer.ellipse( x + 50, y + 90, 5, 5);
}
