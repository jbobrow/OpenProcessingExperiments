
int[] xpos = new int[50];
int[] ypos = new int[50];
 
void setup(){
  size(800,600);
  smooth();
 
  for(int i = 0; i < 50; i++){
    xpos[i] = 0;
    ypos[i] = 0;
}
}
 
 
void draw(){
  background(255);
  for(int i = 0; i < 49; i++){
    xpos[i] = xpos[i+1];
    ypos[i] = ypos[i+1];
    ypos[i] -=2;
    xpos[i]+= random(-20,20);
  }

 
  xpos[xpos.length-1] = mouseX;
  ypos[ypos.length-1] = mouseY;
 
  for(int i = 0; i < 50; i++){
    noStroke();
    fill(255-i*5);
    ellipse(xpos[i], ypos[i], i, i);
  }
}

