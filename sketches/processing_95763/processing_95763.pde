
int frame;
int drawpoint;
int numpoints=1000;
float x[]=new float[numpoints];
float y[]=new float[numpoints];

void setup(){
  size(600,600);
}

void mousePressed(){
  drawpoint=0;
}

void mouseDragged(){
  x[drawpoint]=mouseX;
  y[drawpoint]=mouseY;
  drawpoint+=2;
}

void draw(){
  frame++;
  background(240,255,255);
  noStroke();
  for(int i=1; i<drawpoint; i++){
    if(!mousePressed){
      float phase= frame/i;
      x[i]=x[i]+sin(phase)+random(-15,15);
      y[i]=y[i]+tan(phase)+random(-20,20);
  
  //music  
      fill(2,random(65,100));
      textSize(random(25,150));
      text("♪",x[i],y[i]);
      
      }}
}
