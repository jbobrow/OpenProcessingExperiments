
void setup() {
  size(400, 400);
  smooth();
}
 
void draw() {  //sets up spacing for repeating function
  for (float a=0; a<width; a+=60) {
    for (float b=0; b<height; b+=60) {
      circles(a, b);        
    }
  }
}
 
void circles(float x, float y) { //draws function
  pushMatrix();  //sets up matrix
  translate(x, y);  
  
  fill(100);
  strokeWeight(3);
  stroke(245, 35, 10);
  ellipse(0,0,60,60);  //draws first circle
  
  stroke(0);
  ellipse(30,30,60,60);//draws second circle overlapping first
  
  popMatrix(); //resets matrix
}
 




