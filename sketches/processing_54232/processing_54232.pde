
int[] xpos = new int[200];
int[] ypos = new int[200];
int x=width/2;
int y=height/2;
int xmove=6;
int ymove=5;
 
void setup(){
  size(800,600);
  smooth();
 
  for(int i = 0; i < 200; i++){
    xpos[i] = 0; 
    ypos[i] = 0; 
  }
  noCursor();
}
 
void draw(){
  background(255);
  for(int i = 0; i < 199; i++){
    xpos[i] = xpos[i+1]; 
    ypos[i] = ypos[i+1];
    ypos[i]-=(int)random(-5,5);
    xpos[i]-=(int)random(-5,5);
  }
 
  xpos[xpos.length-1] = x;
  ypos[ypos.length-1] = y;
  x=x+xmove;
  y=y+ymove;
  
  if (y>height||y<0){
    ymove*=-1;
  }
    if (x>width||x<0){
      xmove*=-1;
    }
 
  for(int i = 0; i < 200; i++){
    noStroke();
    fill(255-i,100-i,0);
    ellipse(xpos[i], ypos[i], i/4, i/4);
  }
}

