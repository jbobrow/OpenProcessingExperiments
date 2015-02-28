

int [] xpos=new int [100];
int [] ypos=new int [100];
  
void setup(){
  size(500,500);
  smooth();
    background(0);
 //initialize 
  for (int i=0; i<xpos.length; i++){
    xpos[i]=xpos[i]=0;
    ypos[i]=ypos[i]=0;
  }
}

void draw(){

  
  //shift array values
  for (int i=0; i<xpos.length-1; i++){
    xpos[i]=xpos[i+1];
    ypos[i]=ypos[i+1];

  }
  
  //new location
  xpos[xpos.length-1]=mouseX;
  ypos[ypos.length-1]=mouseY;
  
  //draw everything
  for(int i=0; i<xpos.length; i++){
    stroke(255);
    fill(0,20);
    ellipse(xpos[i],ypos[i],i,i);
  }
   if(mousePressed);{
  for (int i=0; i<xpos.length; i++){
    stroke(random(255,100));
    fill(random(100,255));
   }
 }
}
void mousePressed(){
  background(0);}


