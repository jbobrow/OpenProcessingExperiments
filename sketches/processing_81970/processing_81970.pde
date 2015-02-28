
void setup(){
  size(600,400); 
  background(0,0,0); 
}

void draw(){
  
  background(0,0,0); 
  
  fill(255,214,3);
  ellipse (300,200,260,260);
  fill(255,255,255);
  ellipse(250,180,30,30);
  ellipse(350,180,30,30);
  fill(255,183,0);
  triangle(250,250,300,200,350,250);

 
  fill(0);
  float xpos = constrain (mouseX, 245,255);
  float ypos = constrain (mouseY, 174,186);
  ellipse(xpos,ypos,15,15);
 
  float xposition = constrain (mouseX, 344,355);
  float yposition = constrain (mouseY, 174,186);
  ellipse(xposition,yposition,15,15); 
  
}


