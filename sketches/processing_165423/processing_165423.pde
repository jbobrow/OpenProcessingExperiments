
int[] xpos = new int[50];
int[] ypos = new int[50];
 
void setup(){
  size(800,600);
  smooth();
 
  for(int i = 0; i < 50; i++){
    xpos[i] = 0;
    ypos[i] = 0;
  }
  //noCursor();
}
 
void draw(){
  background(255);
  for(int i = 0; i < 49; i++){
    xpos[i] = xpos[i+1];
    ypos[i] = ypos[i+1]-5;
  }
 
  xpos[xpos.length-1] = mouseX;
  ypos[ypos.length-1] = mouseY*2;
 
  for(int i = 0; i < 50; i++){
    noStroke();
    fill(255-i*5);
    ellipse(xpos[i]-int(random(5)), ypos[i]-int(random(5)), i, i);
  }
}

