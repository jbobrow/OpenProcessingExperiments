

PImage b;

void setup(){
  b = loadImage("aurora.jpg");

  
size(600,600);
}



 



void draw (){
  
  background(255,45,5);

  

 //rect(mouseX, mouseY,90,90);
    image(b, mouseX,mouseY);

}





