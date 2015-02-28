
PImage picture;

void setup(){
  size(500,500);
  picture = loadImage("vector-pattern-no002-19-by-dragonart.jpg");
}

void draw(){
 tint(mouseX,mouseY,255,10);
 image(picture,mouseX,mouseY,250,250); 


  
}

