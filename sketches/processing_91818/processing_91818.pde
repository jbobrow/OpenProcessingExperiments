
//Samyukta Madhu
//Creative Computing
//March 3rd, 2013
//For loops



void setup() {
  size(500, 500);
  background(0);
}

void draw() {
  fill (255,255,255,25);
  
  for (int a=50; a<width; a+=100) {
    for (int b=50; b<height; b+=100) {
   ellipse(a,b,mouseX,mouseY);
  
   
  
    }
  }
}
