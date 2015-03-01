
int counter = 0;
boolean fillTriangles = false;
 
void setup() { 
  size(400, 400);
  background(255); 
  colorMode(RGB); 
  rectMode(CENTER);
  frameRate(30);
    
}
 
void draw() { 
   
  strokeWeight(1);
  for(int a = 0; a < 10; a++){
      float rnd1 = random(width);
      float rnd2 = random(height);
      triangle(rnd1, rnd2, rnd1 + 6, rnd2 + 10, rnd1 - 6, rnd2 + 10);
  }
   
  noStroke();
  fill(255,10);
  rect(width/2, height/2,width,height);
     
  stroke(0,0,0,255);
  strokeWeight(2);
  fill(255,255);
   
  counter++;
   
  if(fillTriangles ){
      fill(random(255),255);
  } else {
      fill(255,255);
  }
   
  float rnd3 = random(width);
  float rnd4 = random(height);
  
  triangle(rnd3, rnd4, rnd3 + 60, rnd4 + 100, rnd3 - 60, rnd4 + 100);
    
  if(counter>200){
      counter = 0;
      fillTriangles = !fillTriangles;
  }
    
}
