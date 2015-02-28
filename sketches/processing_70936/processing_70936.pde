
void setup(){
size(600,600);
background(255,255,255);
}

void draw(){
 fill(mouseX/1.5, mouseX/2, mouseY);
 noStroke();
 ellipse(300,300,400,400);

 fill(mouseX/2, mouseX, mouseY, mouseX);
 noStroke();
 ellipse(300,300,200,200);
 
  
}
