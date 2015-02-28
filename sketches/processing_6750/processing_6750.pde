
int num = 200;
int angle = 0;

int[] xpos = new int[num];
int[] ypos = new int[num];

void setup(){
  size(600,600);
  rectMode(CENTER);
  for (int i = 0; i< xpos.length; i++){
    xpos[i] = 0;
    ypos[i] = 0;
  } 
}

void draw(){
  angle+=1;
  //scale(360);
  background(255);
  stroke(0);
  xpos[xpos.length-1] = mouseX;
  ypos[ypos.length-1] = mouseY;
  for (int i = 0; i < xpos.length-1; i++) {
    xpos[i] = xpos[i+1];
    ypos[i] = ypos[i+1];
  } 
  for (int i = 0; i < xpos.length; i++) {
    noFill();
    translate(xpos[i],ypos[i]);
    rotate(angle);
    rect(xpos[i],ypos[i],100,100); 
  }
}

