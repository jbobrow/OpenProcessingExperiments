
/**
 * Hue. 
 * 
 * Hue is the color reflected from or transmitted through an object 
 * and is typically referred to as the name of the color (red, blue, yellow, etc.) 
 * Move the cursor vertically over each bar to alter its hue.

remixed by mar_b 
 */
 
int barWidth = 10;
int[] hue;

void setup() 
{
  size(500, 500);
  colorMode(HSB, 360, 230, height);  
  hue = new int[width/barWidth];
  noFill();
}

void draw() 
{
  int j = 0;
  for (int i=0; i<=(width-barWidth); i+=barWidth) {     
    if(mousePressed){
    if ((mouseX > i) && (mouseX < i+barWidth)) {
      hue[j] = mouseY;
    }
    stroke(hue[j], height/1.2, mouseY);
    bezier(i, 0, mouseX, mouseY, mouseY, mouseX, width-i, height );  
    }else{
      if ((random(0,100) > i) && (random(0,100) < i+barWidth)) {
      hue[j] = i;
    }
    stroke(0, 0, hue[j],random(255));
    bezier(0,i, random(height), random(width), random(height), random(width), width, height-i);  
    }
    j++;
  }
}

