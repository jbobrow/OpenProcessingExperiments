
PImage img;
PImage img2;


void setup(){
  size(600,450);
  
  img= loadImage("texture.png");
  background(img);
  
  img2= loadImage("painttube.png");
 
  cursor(img2);
 
  smooth();
  
}

void draw(){
  

  
  int speed = abs(mouseX - pmouseX);
  //change the colour of the stroke to a random colour
  stroke(#EA2D07);
  line(pmouseX,pmouseY,mouseX,mouseY);
  strokeWeight(speed);

}

