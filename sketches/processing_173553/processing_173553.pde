
void setup (){
  size (800,800);
  background (255,70,3);
}
 
void draw (){
  noFill();
 stroke(255,3,197);
   
  for (int diam=0; diam <=width; diam=diam+100){
stroke(22,255,3);
    ellipse (400,400,diam,diam);
    ellipse (400,0,diam,diam);
    ellipse (0,400,diam,diam);
    stroke(3,12,255);
    ellipse (0,0,diam,diam);
    ellipse (800,0,diam,diam);
    ellipse (800,800,diam,diam);
    stroke(255,243,3);
    ellipse (0,800,diam,diam);
    ellipse (400,800,diam,diam);
    ellipse (800,400,diam,diam);
  }
}

