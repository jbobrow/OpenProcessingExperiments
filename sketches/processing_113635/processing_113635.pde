
PImage a;

void setup(){
  size(500,600);
  a= loadImage("001.JPG"); 
  noSmooth();
}

void draw(){
  if (mousePressed) 
    stroke(255,3,3);
   else 
    stroke(0);
    
  image(a,0,0,500,600);
  rect(148,70,218,158);
  a= loadImage("001.JPG");
  line(mouseX-10, mouseY, mouseX+10, mouseY);
  line(mouseX, mouseY-10, mouseX, mouseY+10); 

 
  
}


