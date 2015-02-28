
void setuo(){
  size(800,800);
  smooth();
}

void draw(){
  noStroke();
  fill(random(0,255),random(0,255),random(0,255));
  ellipseMode(CORNER);
  for(int i =0; i<800; i+=5){
    ellipse(i,0,50,50);
  }
  for(int i =0; i<800; i+=5){
    fill(random(0,255), random(0
    ellipse(0,i,50,50);
  }  
  delay(200);
}
