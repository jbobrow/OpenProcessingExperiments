
float[] xpos = new float[50];
float[] ypos = new float[50];

void setup(){
  size(800,800);
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
    xpos[i] = xpos[i+1]-random(-10,10);
    ypos[i] = ypos[i+1]-random(10);
  }
 
  xpos[xpos.length-1] = mouseX;
  ypos[ypos.length-1] = mouseY;
 
  for(int i = 0; i < 50; i++){
    strokeWeight(5);
    stroke(0);
    fill(255-i*4,random(25,50),random(100,200));
    ellipse(xpos[i], ypos[i], i*2, i*2);
  }
}

