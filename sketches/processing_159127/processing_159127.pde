
void setup() {
  size(600, 400);
  
}
void draw() {
  background(255);
  for (int i = 10; i<600; i=i+10) {
    for(int u=10;u<400; u=u+10){
      fill(i*0.5,u*0.5,mouseX/3);
      ellipse(i,u,10,10);
    }
  }
}

