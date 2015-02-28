
//Problem Set 3
//Question 5 -- order = grey screen, chaos = bars that move with mouse position 
//Natalie DeCoste 

Bar a[] = new Bar[300];
float position;

void setup() {
  size(400, 400);  
  smooth();
  noStroke();
  
  for (int i = 0; i < a.length; i++) {
    a[i] = new Bar();
  }
}

void draw() {
  background(240);
  
  
  
  for (int i = 0; i < a.length; i++) {
    a[i].display(position);
    
    position = map(mouseX,mouseY,width,0,2);
  }
}
class Bar {
  float x;
  float y;
 
 
  
  Bar() {
    x = random(width);
    y = random(height);
  
  }
  
  void display(float position) {
  
    
      translate(x, y);
      fill(mouseX, mouseY);
      rotate(position*10);
      rect(0, 0, 1, 1000);
   
  }
}

