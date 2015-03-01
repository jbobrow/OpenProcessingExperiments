
PImage Steel;
PImage Tower;
PImage Crosshair;

void setup(){
  size(500,500);
  Steel = loadImage("steel.png");
  Tower = loadImage("tower2.png");
  Crosshair = loadImage ("cross.png");
}

void draw(){
 noCursor();
   image(Steel, 250, 250);
  
  if (mousePressed == true) {
  stroke(#C40000);
  strokeWeight(10);
  line(250,250,mouseX,mouseY);
  stroke(#810000);
  strokeWeight(7);
  line(250,250,mouseX,mouseY);
  stroke(#430000);
  strokeWeight(2);
  line(250,250,mouseX,mouseY);
  }
  
 image(Crosshair, mouseX, mouseY); 
  
    translate(width/2,height/2);
  float theta = PI*mouseX / width; 
  
  rotate(theta);
  
  imageMode(CENTER);
   image(Tower, 0,0);
  
  
 
  
  
  
  
}
