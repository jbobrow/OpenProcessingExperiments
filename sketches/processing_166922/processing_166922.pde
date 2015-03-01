
float[] xCoords = new float[100];
float[] yCoords = new float[100];
 
void setup(){
size(800,600);
for(int i = 0; i < 100; i++){
xCoords[i] = random(width);
yCoords[i] = random(height);
}
}

void draw(){
  background(80);
  stroke(255);
  strokeWeight(20);
  fill(0,0,255);
  ellipse(mouseX,mouseY,400,400);
  
  strokeWeight(2);
  for (int i = 0; i < 100; i++){
    xCoords[i] += random(-1,1);
    yCoords[i] -= 1;
    
    if (yCoords[i] < 0) yCoords[i] += height;
    
    if(dist(mouseX,mouseY, xCoords[i], yCoords[i]) < 200){
//      noFill(0);
      ellipse(xCoords[i], yCoords[i], 4, 4);
    }
}
}
