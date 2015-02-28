
void setup() { 
  size(400, 400);
  background(200); 
   
}
 
void draw() { 
  noStroke();
  fill(random(250), random(250), random(250), random(250));
   
  if(mousePressed == true) {
    rect(140, 140, 120, 120);;
    
  }
  else {
    rect(0, 140, 120, 120);
    rect(140, 0, 120, 120);
    rect(280, 0, 120, 120);
    rect(0, 280, 120, 120);
    rect(280, 140, 120, 120);
    rect(140, 280, 120, 120);
    rect(280, 280, 120, 120);
    rect(0, 0, 120, 120);
  }
}
