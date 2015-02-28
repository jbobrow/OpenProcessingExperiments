


void setup() {
size(400,400);
smooth();
}


void draw(){
  background(200);
  //line(0,0,width,0);
  //line(0,50,width,50);
  
  
  //ciclio for per creare il primo gruppo di linee
  //interessante effetto moirée
  for (int i=0; i < height; i = i+10) {
  stroke(255);
  line(0,i,width,i);
  }
  
  if (mousePressed) {
    background (200);
  float ranNumberX = random(0,400);
  float ranNumberY = random(0,400);
    //ciclio for per creare il primo gruppo di linee
  //interessante effetto moirée
  for (int i=0; i < height; i = i+10) {
  stroke(255);
  line(ranNumberX,ranNumberY,width,i);
  }
  }
  
  
  
  
  
}

