


//I made this using codes from the textbook and some 
//examples on open processing from York university
// :)


float x = 0;
float y = 0;
float easing = 0.05;

boolean drawing= false;
boolean locked = false;
PImage bg;

void setup(){
  bg = loadImage("bg.png");
  
  
  x= 0;
  y= 0;
  easing = 0.05;
  size(500,500);
  noStroke();
}
void draw(){ 
  smooth();
   
 float targetX = mouseX;
 x+= (targetX - x)*easing;
 
  if(drawing == true) {
    //purple circle
  fill(#a270db,mouseY * easing);
  stroke(2);
  stroke(#0d38a4);
  ellipse(250,250,mouseX,mouseY);
  //blue trail
  
  fill(#58b4ee);
  noStroke();
  ellipse(mouseX, mouseY, 45,45);
  fill(#b659d8);
  noStroke();
  ellipse(mouseX+easing, mouseY, 25,25);
  fill(#ed3be3);
  noStroke();
  ellipse(mouseX+easing, mouseY, 10,10);
  }
}
void mousePressed () {
  background (bg);
  if (mouseButton == LEFT) {
    drawing = true;
    
  }

  if(locked) {
drawing = true;
  }
 }
void mouseDragged() {
 
  if((mouseX <=width) && (mouseY <=height)){
drawing = true;

  }
}


void mouseReleased () {
   
  drawing = false;
  
}


