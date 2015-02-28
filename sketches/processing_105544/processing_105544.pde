
int[] xpos;
int[] ypos;
int maxPos;


void setup(){
  size(600,300);
  smooth();
   stroke(255,10);
  maxPos=100;
   xpos= new int[maxPos];
  ypos= new int[maxPos];
}

void draw(){
  
  updateAll();
  showAll();
  rect(0,0,width,height);
  fill(0,20);
}

void updateAll(){
  for(int i=maxPos-2;i>=0;i--){
    xpos[i+1]=xpos[i];
    ypos[i+1]=ypos[i];
  }
  xpos[0]=mouseX;
  ypos[0]=mouseY;
}

void showAll(){

  for(int i=maxPos-1;i>=0;i--){
  
 
 ellipse(xpos[i],ypos[i],60-i,60-i);
  }
}
