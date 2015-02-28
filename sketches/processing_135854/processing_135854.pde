
void setup(){ 
  size(400,400); 
  background(255);
   for(int i=10; i<=400;i+=15){
     strokeWeight(5);
    line(i,0,i,400);
  }
}

//shapes
void draw(){
  if (mousePressed==true){
  frameRate(5);
  strokeWeight(10);
  float r=random(255);
  float s=random(255);
  float t=random(255);
  float u=random(400);
  fill(r,s,t);
  noStroke();
  ellipse(mouseX,mouseY,80,80); 
  triangle(mouseX/2,mouseY/2,20,40,60,80); 
  rect(mouseX,u,80,80);
  }
}
