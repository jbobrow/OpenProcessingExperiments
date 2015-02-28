
/**
 * Zooming by Ben Chun.
 *
 * Click to zoom in, alt-click (option-click) to zoom out. 
 */
 
 float offsetX, offsetY, scaleFactor;
 
 void setup()
 {
   size(300,300);
   offsetX = offsetY = 0;
   scaleFactor = 1.0;
   smooth();
 }
 
 void draw()
 {
   background(64);
   pushMatrix();
   scale(scaleFactor);
   translate(-offsetX, -offsetY);
   drawZoomed();
   popMatrix();
 }
 
 // write your drawing code here as if this were the regular draw()
 // and as if there were no translation or scaling going on
 void drawZoomed()
 {
   noStroke();
   fill(255,0,0);
   rect(0,0, 80,80);
   fill(0,255,0);
   rect(width-80,0, 80,80);
   fill(0,0,255);
   rect(0,height-80, 80,80);
   fill(0,0,0);
   rect(width-80,height-80, 80,80);
   fill(255,255,255);
   ellipse(width/2,height/2, 100,100);
   stroke(128);
   line(0,0, width,height);
   line(0,width, height,0);
 }
 
 void mousePressed()
 {
   // translation takes place inside the scaled world,
   // so account for that in adjusting the offsets
   offsetX += (mouseX - (width/2)) / scaleFactor;
   offsetY += (mouseY - (height/2)) / scaleFactor;
   if (offsetX < 0) offsetX = 0;
   if (offsetY < 0) offsetY = 0;
   if (offsetX > width-(width/scaleFactor)) offsetX = width-(width/scaleFactor);
   if (offsetY > height-(height/scaleFactor)) offsetY = height-(height/scaleFactor);
   
   if (keyPressed && keyCode==ALT) scaleFactor -= 0.1;
   else scaleFactor += 0.1;
   if (scaleFactor < 1.0) scaleFactor = 1.0;
 }

