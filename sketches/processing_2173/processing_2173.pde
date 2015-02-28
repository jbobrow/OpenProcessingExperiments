

PImage fondo;

void setup(){
  
  size(400,400);
  fondo= loadImage ("paper01.jpg");
  image(fondo,0,0);
 // background(#EDECBF);
  
}

void draw(){
  
 
  if (mousePressed){
    stroke(59,165,255,50);
    strokeWeight(2*random(10));
    line (pmouseX,pmouseY,mouseX,mouseY);
  }
 
}

/*void mousePressed (){
  noFill();
  stroke(59,165,255,50);
  //rect (pmouseX,pmouseY,random(50), random(55));
}*/


void mouseReleased(){
  //rect (0*random(1),0*random(2),400,400);
  strokeWeight (3*random(2));
  //ellipse(mouseX,mouseY, random(100), random (100));
}

void mouseDragged(){
  
 strokeWeight (random (55));
stroke(34,12,23,50);
line (pmouseX, pmouseY, mouseX, mouseY); 
  
}

void keyPressed (){
  
  if (keyCode == UP) {
  fondo= loadImage ("paper01.jpg");
  image(fondo,0,0);
  } else if (keyCode == DOWN) {
      saveFrame ("watercolor.jpg");
    } 
  
}
  

