
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
  smooth();
  for(int i = 0; i < xpos.length-1; i++){
    ypos[i] = ypos[i+1]-5;
    xpos[i] = xpos[i+1]+int(random(-3,10));

  }

  xpos[xpos.length-1] = mouseX;
  ypos[ypos.length-1] = mouseY;

  for(int i = 0; i < 50; i++){
    noStroke();
    fill(i*random(200,250),50,0);
    ellipse(xpos[i]+random(20), ypos[i], i, i);
    
  }
}

