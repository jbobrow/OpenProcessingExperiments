
int[] xpos = new int[80];
int[] ypos = new int[80];
 
void setup(){
  size(800,600);
  smooth();
  for(int i = 0; i < 80; i++){
    xpos[i] = 0; 
    ypos[i] = 0; 
  }
  noCursor();
}
 
void draw(){
  background(0,70);
  for(int i = 0; i < 79; i++){
    xpos[i] = xpos[i+1]; 
    ypos[i] = ypos[i+1];
    xpos[i]-=(int)random(-8,8);
    ypos[i]-=(int)random(-4,20);
  }
 
  xpos[xpos.length-1] = mouseX;
  ypos[ypos.length-1] = mouseY;
 
  for(int i = 0; i < 80; i++){
   
    noStroke();
    fill(255-i*5,random(0,175),200-i/2);
    smooth();
    rect(xpos[i], ypos[i], 20+i/3,20+i/3);
  }
}
 

