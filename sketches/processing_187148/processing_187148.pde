
PImage img; 
 
 void setup(){
   size(640,480);
  img = loadImage("Pikachu_cute_happy_jump.png");
  
 }
 
 void draw(){
   background(random(255),random(255),random(255));
   for (int i = 0; i < width; i = i + 60  ){
     for (int j = 0; j < height; j = j + 60){
       tint(random(255),random(255),random(255));
     image(img,i,j);
     stroke(255);
   }
 }
 }


