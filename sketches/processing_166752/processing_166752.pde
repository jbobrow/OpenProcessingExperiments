
float[] xCoord = new float[100];
float[] yCoord = new float[100];

void setup(){
size(1000,1000);
for(int i = 0; i < 100; i++){
xCoord[i] = random(width);
yCoord[i] = random(height);

}
}
void draw(){
  background(80);
  stroke(255);
  strokeWeight(10);
  fill(10,100,255);
  ellipse(mouseX,mouseY,400,400);
  
  strokeWeight(2);
  for(int i =0; i < 50; i++){
    xCoord[i] += random(-1,1);
    yCoord[i] -= 2;
    
    if(yCoord[i] <0) yCoord[i] += height;
    
    if (dist(mouseX, mouseY, xCoord[i], yCoord[i]) <200) {
      noFill();
      ellipse(xCoord[i], yCoord[i],4,4);
    }
  }
}

