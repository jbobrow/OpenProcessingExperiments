
float[] xpos = new float[21];
float[] ypos = new float[21];

void setup(){
  size(600,800);
  noStroke();
  for(int i=0; i< xpos.length; i++){
    xpos[i]=i*width/20;
  }
  for(int i=0; i< ypos.length; i++){
    ypos[i]=i*height/20;
  } 
}
void draw(){
  background(0); 
  for(int i=0; i<21; i++) {
    for(int j=0; j<21; j++){
      ellipse(xpos[i], ypos[j], width/20, height/20);
    }
  }
  for(int i=0; i<xpos.length; i++){
    println("xpos[" + i + "]: " + xpos[i]);
  }
  for(int i=0; i< xpos.length; i++){
    xpos[i]++;
    if(xpos[i] >= width+width/40) {
      xpos[i] = -width/40;
    }
  }
  for(int i=0; i< ypos.length; i++){
    ypos[i]++;
    if(ypos[i] >= height+height/40) {
      ypos[i] = -height/40;
    }
  }
}

