
 int value = 50;
 
void setup (){
  size (400,400);
  noStroke ();
  smooth ();
  }
  
// Click within the image to change
// the value of the rectangle
  
  void draw() {
  background (255);
  fill(value,value*20,50,200);
  ellipse(200, 300, value, value);
  
    if(mousePressed) {
    value = value + 10;
    
  } else {
    value = 50;
   
  }
}     
