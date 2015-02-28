
PImage coral;
PImage flower;
PImage rock;
PImage wing; 
int counter=0;


void setup (){
  size (400, 400);
  background (200, 50, 50);
 
 coral = loadImage ("coral.JPG");
 flower = loadImage ("flower.JPG");
 rock = loadImage ("rock.jpg");
 wing = loadImage ("wing.jpg");
}
 
 void draw (){
  
   tint (200, 10, 100, 60);
   image(coral, random (0), random (40));
   tint (200, 150, 200, 40);
   image(flower, random (60), random (40));
   tint (250, 50, 60, 40);
   image (rock, random (0), random (60));
   tint (180, 200, 100, 30);
   image (wing, random (0), random (0));
 }


void mousePressed(){  
    save("circles.jpg"+counter+".jpg"); 
    counter=counter+1; 
  } 

