
int [] xpos= new int [100];
int [] ypos = new int [100];


void setup(){
  size (1000,500);
  smooth();
  for (int i=0; i<xpos.length; i++){
    xpos[i] = 50;
    ypos [i] =300;
  }
}
  void draw(){
    background (random(55,100), random(200,50), random (255,250));
    
   for (int i=0; i<xpos.length-1;i++){
      xpos [i] = xpos [i+1];
      ypos [i] = ypos [i+1];
   }
      xpos[xpos.length-1]=mouseX; 
    ypos[ypos.length-1]=mouseY;
 
for (int i=0; i<xpos.length; i++){
 stroke(random(43), random(43), random(43));
  fill (#ffffff-i*400,10);//
  rect (xpos[i], ypos [i], i,i);
 
    }
    }

