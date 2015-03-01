
int[] xpos = new int[50];
int[] ypos = new int[50];
float[] x = new float[11];
float[] y = new float[11];
 
void setup(){
  size(800,600);
  smooth();
  
  for(int i = 0; i < x.length; i++){
    x[i]= width/2 ;
    y[i] = i*40;
  }
 
  for(int i = 0; i < 50; i++){
    xpos[i] = 0;
    ypos[i] = 0;
  }
  //noCursor();
}
 
void draw(){
  background(255);
  stroke(0);
  for(int i = 0; i < 49; i++){
    xpos[i] = xpos[i+1];
    ypos[i] = ypos[i+1];
    ypos[i]-=8;
    xpos[i]+=random(-10,10);
  }
  
  
  for(int i = 0; i < 10; i++){
    x[i]= width/2 + random(-40,40);
  }
  
   for(int i = 0; i < y.length-1; i++){
    line(x[i], y[i], x[i+1], y[i+1]);
  }
  
 
  xpos[xpos.length-1] = mouseX;
  ypos[ypos.length-1] = mouseY;
 
  for(int i = 0; i < 50; i++){
    noStroke();
    fill(150, 160,190);
    ellipse(xpos[i], ypos[i], i, i);
    
  }
}

