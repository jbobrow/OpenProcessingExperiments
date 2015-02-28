
void setup(){
  size(800,800);
  smooth();
}
void draw(){
  background(225);
  strokeWeight(13);
  stroke(225);
  for(int i=0;i<800;i=i+20){
    for(int j=0;j<800;j=j+20){
      fill(mouseX,mouseY,(i+j)*2/8);
      ellipse(j,i,20,20);
    }
  }
}
