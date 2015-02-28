
int barWidth = 20;
int lastBar = -1;
int[] zpx=new int[214748];
int[] zpy=new int[214748];
float[] zpt=new float[214748];
int jgs=0;

void setup() {
  size(640, 360);
  noStroke();
  background(0);
  smooth();
}

void draw() {
  if(mousePressed){
  fill(255,0,0);
  ellipse(mouseX,mouseY,5,5);
  zpx[jgs]=mouseX;
  zpy[jgs]=mouseY;
  
  jgs++;
  
  }
  for(int k=0; k<jgs; k++){
    zpt[k]+=0.3;
    fill(255,0,0);
    ellipse(zpx[k],zpy[k]+zpt[k],5/(zpt[k]/3+1),5/(zpt[k]/3+1));
  }
  for(int start=millis(); start+10>millis(); );
  
}
