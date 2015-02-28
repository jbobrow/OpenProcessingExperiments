
//CircDraw By Sergio Luna 

//Make sure you move the mouse slowly or the Circles will cover
//the screen

int value = 0;


String message = "(v.v)";
float x, y; 
float hr, vr;  

void setup() {
  size(800, 650);
  background(0);

 
  
  
  
}

void draw() {
 
  


   if(mousePressed == true){
  fill(value);
 } else {
 fill(random(0,255));
  
  
 }
 ellipse(mouseX, mouseY, 20,20);
  ellipse(mouseY+50,mouseY-40,20,20);
  ellipse(mouseY,mouseX,20,20);
  ellipse(mouseX+50,mouseY-40,20,20);
 }


