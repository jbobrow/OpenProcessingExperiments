
int [] Xpos = new int [100];
int[] Ypos = new int [100];

void setup(){
  size(500,500);
  background(0);
  noStroke();
  smooth();
  
    
 for (int i=0; i<Xpos.length; i++){
   Xpos[i]=0;
   Ypos[i]=0;
 }
}
 
 void draw(){
   //background(255);
 
      Xpos[Xpos.length-1]=mouseX;
   Ypos[Xpos.length-1]=mouseY;
   
   for (int i=0; i<Xpos.length-1; i++){
     Xpos[i]=Xpos[i+1];
     Ypos[i]=Ypos[i+1];
   }
 

 
  for (int i=0; i<Xpos.length-1; i++){
 fill(255-i*2.25);
 ellipse(Xpos[i],Ypos[i],i*.7,i*.7);
  }
 }
   
   
   
   
   

