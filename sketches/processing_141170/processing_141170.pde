
// SOS iDesign
// KU DYNAMIC MEDIA
// David Mrugala

float mx;
float my;
float pmx;
float pmy;

void setup() {
  size(600, 600);
  background(#325A7D);
}

// activate the fullscreen every time: sketch, present 
/*
boolean sketchFullScreen(){
  return true;
}
*/

void draw() {
  noStroke();
  fill(#325A7D,100);
  rect(0, 0, width, height);
  
  // offset from the sketch window frame
  mx = constrain(mouseX, width*0.1, width-(width*0.1));
  my = constrain(mouseY, height*0.1, height-(height*0.1));
  pmx = constrain(pmouseX, width*0.1, width-(width*0.1));
  pmy = constrain(pmouseY, height*0.1, height-(height*0.1));  
  
  stroke(255,50);  
  strokeWeight(mouseX/5);
  strokeCap(ROUND); 
  
  // Horizontal and Vertical lines
  line(width*0.1, my, width-(width*0.1), pmy);
  strokeWeight(mouseY/4); 
  line(mx, height*0.1, pmx, height-(height*0.1));
   
  // Diagonal lines 
  line(width*0.1, my, mx, height*0.1);
  line(width-(width*0.1), pmy, pmx, height-(height*0.1));

  // White Ellipse Caps
  noStroke();
  fill(255);
  float diaX = mouseX/5 - 20;
  float diaY = mouseY/4 - 20;
  ellipse(width*0.1,my, diaX, diaX);
  ellipse(mx,height*0.1, diaY, diaY);
  ellipse(width-(width*0.1),pmy, diaX, diaX);
  ellipse(pmx,height-(height*0.1), diaY, diaY);

}

