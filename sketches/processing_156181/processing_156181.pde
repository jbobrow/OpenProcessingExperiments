
  float mx=mouseX;
  float my=mouseY;
  
void setup() {
  size(325, 400);
    background(random(255), random(72), random(255));
    

strokeWeight(8);
ellipse(130, 64, 72, 60);
ellipse(190, 55, 70, 91);

}

void draw() {
  if (mousePressed) {
    //fill(0);
  } 
  else {
    ellipse(118, 65, 10, 25);
    
ellipse(201, 56, 15, 10);

    fill(random(255), random(255), random(255));
    //fill(color(204, 102, 0));
   
  }
  strokeWeight(2);
}

