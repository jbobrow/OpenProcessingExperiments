
void setup (){
  size (400, 310);
  smooth();
  frameRate (10);
    background (255);
}

void draw (){
  


  if(mousePressed){
    noStroke();
   fill (255, 255, 255, 75);
    rect (mouseX+random(50), mouseY+random(50), random (width/2), random (height/2));
   
  }
  else {
    noStroke();
   fill (0, 0, 0, 25);
    rect (mouseX+random(50), mouseY+random(50), random (width/2), random (height/2));
   
  }
  
} 

