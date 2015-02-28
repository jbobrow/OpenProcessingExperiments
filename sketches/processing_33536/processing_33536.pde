
PImage earth;
float x1;
float y1;
float x2;
float y2;

int bigeyeball=200;
int radius=10;
int edge=500;
int inner=radius+100;





void setup(){
  background(#0055ba);
  size(600,500);
  earth=loadImage("earth.JPG");
  earth.resize(70,70);
}

void draw(){
  background(mouseX/3+mouseY/3,50,50);
  
  ellipseMode(CORNER);
  fill(255);
  ellipse(70,70,200,200);
  smooth();

  
  ellipseMode(CORNER);
  fill(255);
  ellipse(280,70,200,200);
  smooth();  
 
 //left eyeball//
  
  image (earth,x1,y1);
  image (earth,x2,y2);
  x1=constrain(mouseX,70,200);
  y1=constrain(mouseY,70,200);
  x2=constrain(mouseX,280,410);
  y2=constrain(mouseY,70,200);
  


//  fill(#0055ba);
//  ellipse(mouseX+70,mouseY+70,50,50);
  

//right eyeball//
// fill(#0055ba);
// ellipse(mouseX14,mouseY+140,50,50); 

  
   if (mousePressed){
    textSize(50);
    text("oh my god!", random(50,50), random(50,50));
  }
}



 





