
float r;
float g;
float b;

void setup(){

background(0); 
size(400,400);
}

void draw(){
 

  background(20, mouseY/30,0);
  
  noStroke();
  fill(255, height-mouseY/1.2, 10, 20);
 ellipse(mouseX, mouseY,150,150);
  
  
  stroke(255, mouseY/1.2, 10);
   fill(255, height-mouseY/1.2, 10);
 ellipse(mouseX, mouseY,20,50);
 fill(255, 255, 255, 200);
 noStroke();
 ellipse(mouseX, mouseY,5,20);
 
 strokeWeight(1);
 stroke(100);
 fill(255);
  rect(mouseX-20, mouseY, 40,100);
 
  
}

