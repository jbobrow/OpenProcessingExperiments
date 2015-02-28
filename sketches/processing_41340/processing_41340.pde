


void setup() {
size(400,400);
smooth();
}


void draw(){
  background(244,250,209);
  //line(0,0,width,0);
  //line(0,50,width,50);
  
  //ciclio for per creare il primo gruppo di linee
  //interessante effetto moirée
  for (int i=0; i < height; i = i+10) {
  stroke(237,5,156);
  line(i,height,mouseX,mouseY);
  }
  
    //ciclio for per creare il primo gruppo di linee
  //interessante effetto moirée
  for (int i=0; i < height; i = i+10) {
  stroke(237,5,156);
  line(mouseX,mouseY,width,i);
  }
  
  
  
  
  
}

