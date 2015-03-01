
void setup() {
  size(500, 500);
  background(10);
   
}
void draw() {
  
  for (int i = 10; i<700; i=i+50) {
    for(int u=2;u<600; u=u+50){
      fill(i*0.2,u*0.1,mouseX/1,mouseY/1);
      rect(i,u,10,10);
    }
  }
}

