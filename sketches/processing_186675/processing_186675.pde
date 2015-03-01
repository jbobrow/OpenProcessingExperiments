
void setup (){
  size (800,800);
  background (225);
}
 
void draw (){
  noFill();
   
  for (int diam=0; diam <=width; diam=diam+100){
   rect(200,500,diam,97);
    rect (900,0,diam,147);
    rect (0,400,68,diam);
     strokeWeight(1);
    rect (0,0,diam,diam);
    rect (500,0,diam,diam);
    rect (870,60,diam,diam);
    rect (0,60,65,diam);
    ellipse (400,800,diam,diam);
    ellipse (800,400,diam,diam);
    ellipse (4,8,diam,diam);
     strokeWeight(1);
    ellipse (700,0,diam,diam);
    ellipse (84,60,diam,diam);
    ellipse (71,60,15,diam);
    rect (11,70,64,diam);
    ellipse (41,400,diam,diam);
    ellipse (40,40,diam,diam);
    ellipse (4,7,diam,diam);
     strokeWeight(1);
  }
}
