
void setup() {
  size(800, 500);
  background(0);
  strokeWeight(10);
  noLoop();
}

void draw() {
  for (int i = 0; i < width; i++) {
     
                float r = random(width);// x
                float t = random(height); // y 
       
     
      float b = random(200); // width
      float c = random(300); // height
      float color1 = random(250); 
      float color2 = random(250); 
      float color3 = random(250); 
      float opacity = random(255);
      float weight = random(10);
      strokeWeight(weight);
      stroke(color2,color1,color3);
      fill(color1, color2, color3, opacity);
      ellipseMode(CENTER);
      ellipse(r,t,b,c); 
      if(i%5 ==0){
        rotate(radians(45));
        rectMode(CENTER);
        rect(r,t,b,c);
      }
      
   
  }
}


