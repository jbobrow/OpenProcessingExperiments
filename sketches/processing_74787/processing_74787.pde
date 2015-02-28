
void setup(){
  size(400, 400);
  background(255);
  smooth();
}

void draw(){
  
    background(255);
for(int x = 0; x < width; x = x + 20){
  
  float mx = mouseX/2;
  float offsetA = random(-mx, mx);
  float offsetB = random(-mx, mx);
  
  
  ellipse(x , 200 + offsetB, 50, 50);
  fill(201, 53, 75);
  noStroke();

}
    
  for(int y = 0; y <= height; y = y + 20){
    for(int x = 0; x <= width; x = x + 20){
    noFill();
    stroke(201, 53, 75);
      ellipse(x, y, 30, 30);
  }
    }
    
  for(int y = 0; y <= height; y = y + 40){
    for(int x = 0; x <= width; x = x + 40){
      stroke(255, 0, 0);
      noFill();
      stroke(116, 15, 30);
      ellipse(x, y, 80, 80); 
  }
   }
}

   

   







