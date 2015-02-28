
void setup() {
  smooth();
  size(500,250);
  noStroke();
}
 
void draw(){
  randomSeed(mouseY);
   
  for (int i=0; i<1000; i+=10){
    for(int j=0; j<1000; j+=10){
       
      fill(20,random(50,255),random(50));
      ellipse(i,j,mouseX,mouseX);
    }
  } 
}

