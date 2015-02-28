
size(800, 800);
 
rectMode(CENTER);
for (int i=800; i>0; i=i-2) {
 
  if (i ==0) {
    pushMatrix();
    translate(width/2, height/2);
    rotate(PI/6);
    rect(0, 0, i, i);
    popMatrix();
    fill(#FFDF29);
  }
  fill(#FFFFFF);
  rect(width/2, height/2, i, i);

for (int mouseDragged=0; mouseDragged>255; mouseDragged=mouseDragged++)
    if (mouseDragged > 255) 
    {
    mouseDragged = 0;  }
    int barWidth = 10;
    int lastBar = -1;
    int whichBar = mouseX / barWidth;
    if (whichBar != lastBar) {
    int barX = whichBar * barWidth;
    fill(mouseY, height, height);
    rect(barX, 0, barWidth, height);
    lastBar = whichBar;
    }
    }




