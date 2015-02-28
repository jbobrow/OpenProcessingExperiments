


void setup() {  //setup function called initially, only once
  size(250, 250);
  
}

void draw() {   
 ellipse(mouseX,mouseY,50,50);
 fill(random(255),random(255),random(255));
 rect(mouseY,mouseX,50,50);
 fill(random(255),random(255),random(255));
 }

