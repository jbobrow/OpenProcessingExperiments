
void setup() {
size(500,500);
smooth();
background(255);

}

void draw() {
  for (int i=0; i< 100; i++) {
    
  noFill();
  strokeWeight(.25);
  
  stroke(125);
  line(i, 500, 500, i*6);
  
  stroke(100);
  line(500,200,i*6,500);
 
  stroke(80);
  line(10, 0, 500,i*6);
  

  }
 }



