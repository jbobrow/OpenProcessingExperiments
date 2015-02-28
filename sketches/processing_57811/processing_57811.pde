
// Created by David Monnar
// ARCH 2503 Digital Media, Department of Architecture, Cornell AAP

void setup (){
  size (800, 450);
  smooth();
  background (255);
  noCursor();  
  frameRate(50);
}
 
void draw (){  
  
  
rect(mouseX, 208, mouseY/2+10, 66.3);
int inverseX = width-mouseX;
int inverseY = height-mouseY;
rect(inverseX, 208, (inverseY/2)+10, 66.3);

float my = constrain(mouseY, 208, 300);
line(16.6, 300,575,300);
rect(137.5,268.5,437.5,6.25); // horizontal 2
rect(137.5,208.3,437.5,6.25); //horizontal 3
rect(170,212.5,5,88.2);       // vertical 2 large
rect(295,212.5,5,88.2);       // vertical 3 large
rect(537.5,212.5,5,88.2);     // vertical 5 

  if(mousePressed){
    noStroke();
   fill (255, 255, 255, 75);
   
   rect (mouseX+random(50), my+random(50), random (width/2), random (height/2));
  
  }
  else {
    noStroke();
   fill (0, 0, 0, 25);
    rect (mouseX+random(50), my+random(50), random (width/2), random (height/2));
    
  }
  rect(0,300,800,600);
  
  }

