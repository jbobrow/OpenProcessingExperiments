
/* Test to build rectangle pattern
   03/06/2014
   
   See if I can arrange rectangles across the canvass
 */
 
 // Change the margin
 int MARGIN = 5;
 // Height of each row
 int ROWHEIGHT = 60;
 
 // Calculated by the sketch
 int drawHeight = 0;
 int drawWidth = 0;
 int x = 0;
 int y = 0;
 int w = 0;
 int h = 0;
 
 void setup() {
   // Canvas drawing area
   size(510, 600);
   drawHeight = height - MARGIN;
   drawWidth = width - MARGIN;
   x = MARGIN;
   y = MARGIN;
   
   // Colours
   background(255);
   fill(0,0,180);
   noStroke();
   
   // Draw mode
   rectMode(CORNER);
 }
 
 void draw() {
   h = (int) random(60);
   if (y + h > drawHeight) {
     h = drawHeight - y;
   }
   
   w = (int) random(40);
   if (x + w > drawWidth) {
     w = drawWidth - x;    

     drawRects();
     
     // colour change
     fill(y / 2, 0, 200);
     
     x = MARGIN;
     y += ROWHEIGHT + MARGIN;
     
     if (y >= drawHeight) {
       // if off bottom, save and stop
       saveFrame("rectangles.jpg");
       noLoop();
     }
   }
   else
   {
     drawRects();
     
     x += (w + MARGIN);
     if (x > drawWidth) {
       x = drawWidth;
     }
   }
 }
 
 void drawRects()
 {
   // top rectangle
   rect(x, y, w, h);
   
   drawBottomRect();
 }
 
 void drawBottomRect()
 {
   int h2 = 55 - h;
   int y2 = y + h + 5;
   if (y2 > drawHeight) {
     y2 = drawHeight;
   }
   if (y2 + h2 > drawHeight) {
     h2 = drawHeight - y2;
   }
   rect(x, y2, w, h2);
 }
 


