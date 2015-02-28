

void setup() {
   size(1000,1000);
   background(204);   
}

void draw() {
  
  stroke(random(100,255));

    fill(50,200,170,50);
    rectMode(CENTER);
    rect(mouseX,mouseY,random(15,75), random(15,75));
  
  //if mouse pressed, colour of random boxes will change colour  
  if(mousePressed) {
  stroke(random(100,255)); 
    fill(200,210,40,50);
    rectMode(CENTER);
    rect(mouseX,mouseY,random(15,75), random(15,75));
  }
}


