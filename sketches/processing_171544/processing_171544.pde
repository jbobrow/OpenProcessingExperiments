
void setup() {
  size(700,700); //creates the size of the usable area
  background(255); //sets background white
}


void draw(){
ellipse(pmouseX,pmouseY,20,20); // makes the circle follow the mouse cursor and repeatedly copies itself wherever it goes

}
void drawFace(int x,int y){
  ellipse(x,y,50,60); //the circle
}
  
 void mousePressed(){
   if (mousePressed){ //activates when the mouse is pressed
   fill(random(255), random(255), random (255), random(255)); //click mouse to change into random color
 }
 }
