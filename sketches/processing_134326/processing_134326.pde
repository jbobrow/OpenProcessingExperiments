
 void setup(){
  size(800,800);
  smooth();
}
void draw(){
  background(225);
  noStroke();
  for(int i=0;i<800;i=i+20){
    for(int j=0;j<800;j=j+20){
      fill(random(mouseX*1.5),random(mouseY/2),random(150,200),40);
      ellipse(j,i,10,10);
      
      frameRate(20);
    }
  }
}

