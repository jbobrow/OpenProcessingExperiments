
float[] xpos = new float[50];
float[] ypos = new float[50];
 
void setup(){
  size(800,600);
  smooth();
 
  for(int i = 0; i < xpos.length; i++){
    xpos[i] = 0;
    ypos[i] = 0;
  }
  //noCursor();
}
 
void draw(){
  background(255);
  for(int i = 0; i < xpos.length-1; i++){
    xpos[i] = xpos[i+1] + random(-10,10);
    ypos[i] = ypos[i+1] - 5;
  }
 
  xpos[xpos.length-1] = mouseX;
  ypos[ypos.length-1] = mouseY;
 
  for(int i = 0; i < xpos.length; i++){
    noStroke();
    fill(255-i*5);
    ellipse(xpos[i], ypos[i], i*2, i*2);
  }
}


