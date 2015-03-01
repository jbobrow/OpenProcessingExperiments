
//import processing.pdf.*;

void setup (){
  size (800,800);
  //beginRecord(PDF, "espirografo.PDF");
  background (225);
}

void draw (){
  noFill();
  
  for (int diam=0; diam <=width; diam=diam+10){
    ellipse (400,400,diam,diam);
    ellipse (400,0,diam,diam);
    ellipse (0,400,diam,diam);
    ellipse (0,0,diam,diam);
    ellipse (800,0,diam,diam);
    ellipse (800,800,diam,diam);
    ellipse (0,800,diam,diam);
    ellipse (400,800,diam,diam);
    ellipse (800,400,diam,diam);
  }
  //endRecord();
}
