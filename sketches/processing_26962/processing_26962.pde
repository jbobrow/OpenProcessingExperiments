
void setup() {
  size(600,600);
}

void draw() {
  background(255);
  for(int i=0; i<600; i=i+15){
    for(int j=0; j<600; j=j+15){
      fill(j,i,225);
      rect(i,j,45,15);

      fill(i,j,225);
      ellipse(i,j,10,20);
      
      fill(j,i,j,i);
      rect(i+10,j-5,10,20);
     
      textSize(15);
      fill(0);
      text("B",i,j);
      
    }
  }
}

