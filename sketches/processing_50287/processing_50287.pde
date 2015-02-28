
int[] xpos = new int[100];
int[] ypos = new int[100];
 
void setup(){
  size(800,600);
  smooth();
 
  for(int i = 0; i < 50; i++){
    xpos[i] = 0; 
    ypos[i] = 0; 
  }
  noCursor();
}
 
void draw(){
  background(255);
  for(int i = 0; i < ypos.length-1; i++){
    xpos[i] = xpos[i+1]; 
    ypos[i] = ypos[i+1];
    ypos[i]-=(int)random(7);
    xpos[i]-=(int)random(-4,4);
  }
 
  xpos[xpos.length-1] = mouseX;
  ypos[ypos.length-1] = mouseY;
 
  for(int i = 0; i < ypos.length-1; i++){
    noStroke();
    fill(255-i*45);
    ellipse(xpos[i], ypos[i], i, i);
  }
}
 
 

