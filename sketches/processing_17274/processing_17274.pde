
 int[] xpos = new int[50]; 
 int[] ypos = new int[50];
float theta;
 
void setup(){
  size(400,400);
  smooth();
    noStroke();
  for (int i = 0; i < xpos.length; i ++ ) {
    xpos[i] = 0; 
        ypos[i] = 0;
}}

void draw(){
    background(0);
    for (int i = 0; i < xpos.length-1; i ++ ) {
  
    xpos[i] = xpos[i+1];
      ypos[i] = ypos[i+1];
 // rectMode(CENTER);
 // rect(xpos[i],ypos[i],20,20);

  fill(255,50,0,75);
   theta = random(TWO_PI);
  noCursor();
}
   xpos[xpos.length-1] = mouseX; 
  ypos[ypos.length-1] = mouseY;
 for (int i = 0; i < xpos.length; i ++ ) {
    ellipse(xpos[i],ypos[i],80,80);
 }}
                
                
