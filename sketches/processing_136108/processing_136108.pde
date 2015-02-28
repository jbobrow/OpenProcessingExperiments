
 // added some new functions to example ws4C: Paint Staffete by Rebeca
  
  /**
   * Hue. 
   * 
   * Hue is the color reflected from or transmitted through an object 
   * and is typically referred to as the name of the color (red, blue, yellow, etc.) 
   * Move the cursor vertically over each bar to alter its hue. 
   */
   
  int barWidth = 20;
  int lastBar = -1;
  PGraphics pg;
   
  void setup(){
    size(500,500);
    pg = createGraphics(300, 200);
    colorMode(HSB, height, height, height);  
    noStroke();
    background(0);
  }
   
  void draw(){
    
    int whichBar = mouseX / barWidth;
    if (whichBar != lastBar) {
      int barX = whichBar * barWidth;
      fill(mouseY, height, height);
      rect(barX, 0, barWidth, height);
      lastBar = whichBar;
      
   //The shadow
   fill(0, 12);
   rect(0, 0, width, height);
    
   //Pinsel
   fill(255,0,255);
   noStroke();
   ellipse(mouseX, mouseY, 60, 60);
     
   pg.beginDraw();
   pg.background(51);
   pg.noFill();
   pg.stroke(255);
   pg.ellipse(mouseX-120, mouseY-60, 60, 60);
   pg.endDraw();
    
   //Kreis in der Mitte
   fill(0,255,255);
   ellipse(250, 250, 160, 160);
  }
 }
