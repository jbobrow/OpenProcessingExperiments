

PImage leaves;
PImage bug;
PImage rocks;
PImage brain;

void setup(){
size(400,400);
smooth();

leaves=loadImage("leaves.jpg");

bug=loadImage("bug.JPG");
rocks=loadImage("rocks.JPG");
brain=loadImage("brain.jpg");
}
void draw(){
  background(500,500,500);
      
    image(leaves,10,25);
    translate(width/6, height/6);
rotate(PI/75);
image(bug, 0,0,130,130);
translate(width/5, height/5);
rotate(PI/50);
  
  image(rocks, 0, 0,120,120);
  translate(width/4, height/4);
rotate(PI/25);
  image(brain,0,0,110,110);


  

  
   
}


