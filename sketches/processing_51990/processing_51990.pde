
void setup(){ size(428,615);
background(255);

PImage img = loadImage("kalman2.jpg");


smooth();



}

void draw(){
  
 
PImage img = loadImage("kalman2.jpg");
color c = img.get(mouseX, mouseY); 
fill(c);
stroke(c);
strokeWeight(5);
point(mouseX,mouseY);


if(mousePressed){
  background(img);
 
}


 




}
void mouseReleased(){ 
  background(255);

point(mouseX,mouseY);}


