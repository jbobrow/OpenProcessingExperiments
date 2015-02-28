
float x;
float y;
boolean isTired = false; 

// 1. Create a variable of type PImage 
PShape arrow;


void setup(){
  
  
  size(600,600);
  //2. Assigning it 
  
 arrow = loadShape("arrow.svg");
  
  
}


void draw(){
  
  background(255);
  // to animate
  y+= 2.2;
  x+=1.5;
  
  
  // 3. Display the image
  // name of image, and x and y from where it displays it
  shape ( arrow, x, y, width/3, height/3);
  
  noFill();
ellipse(mouseX,mouseY, 100,200);

if ( x == mouseX && y == mouseY){
  
fill(200);

}
  
  
}


