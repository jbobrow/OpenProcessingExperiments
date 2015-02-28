
float x;
float y;
boolean isTired = false; 
int counter = 0;

// 1. Create a variable of type PImage 
PShape arrow;
PImage chateau;
PImage shield;

float sheildx, sheildy;



void setup(){
  
  
  size(600,800);
  //2. Assigning it 
  
 arrow = loadShape("arrow.svg");
 
 
chateau = loadImage("castle.jpg"); 
imageMode(CENTER);
shield = loadImage("shield.png"); 

  
}


void draw(){
  
  background(255);
  // to animate
  y+= 2.2;
  x+=1.5;
  
  
   image(chateau, 300, 400, width, height);
  
  // 3. Display the image
  // name of image, and x and y from where it displays it
  
  shapeMode(CENTER);
  shape ( arrow, x, y, width/5, height/5);

  
  noFill();
  image(shield, mouseX, mouseY, width/3, height/3);
  
 text(counter, 40, 40);
 
 
 //if arrow meets shield, change arrow direction
 if ( x>mouseX && y> mouseY){
 x+= x*-1;
 y+= y*-1;
 
 fill(247,10,10,80);
 rect(0,0, width,height);
 
 
 //count points
    counter = counter+1;
      fill(50);
       text(counter, 40, 40);
       
       
       

}
 
 






  
}


