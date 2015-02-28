
float sizea = 70;
float sizeb = 70;

void setup(){
  size(700,400);
  background(255);
  smooth();
}

void draw(){
background(255);
fill(0,50);
  

  
  ellipse(mouseX, mouseY, sizea, sizea);
  
  
  if (mousePressed && (mouseButton == LEFT)){
    sizea = sizea + 10;
  }
    
if (mousePressed && (mouseButton == RIGHT)){
      sizea = sizea - 10;}
 
  



}

