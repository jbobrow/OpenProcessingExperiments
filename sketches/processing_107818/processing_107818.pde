
int barWidth = 10;
int lastBar = -1;
void setup() {
       size(600, 600);
       colorMode(HSB, height, height, height);  
       stroke(255);
       background(292, 64, 0);
     } 

     void draw() {
       line(150, 125, mouseX, mouseY);
       int whichBar = mouseX / barWidth;
  if (whichBar != lastBar) {
    int barX = whichBar * barWidth;
    fill(mouseY, height, height);
    rect(barX, 0, barWidth, height);
    lastBar = whichBar;
     
   }
   }


