
/* Code by Julia Grzeskowiak
York/Sheridan Joint Program in Design */
//reference: Sofía Quintana - http://openprocessing.org/sketch/3075//


   float x = random (10, 5); //setting x variable 
 
  
void setup(){
  background(0); //set background to black
  size(450,450);  //set canvas size (x,y)
    stroke(0);    //set black stroke
  smooth();      //smooth vectoring

}
void draw(){
 
  fill(mouseX, mouseY,x,6.5);             //Red hue determined by horizontal mouse coordinate, Green hue determined by vertical mouse coordinate, Blue hue determined by x value, opacity determined by value of 6.5.
  ellipse(mouseY,mouseX,mouseX,mouseX); // x position determined by vertical mouse coordinate, y position determined by horizontal mouse coordinate, 
                                        //width determined by horizontal mouse coordinate, height determined by horizontal mouse coordinate.

}

void mousePressed() {
background(0); //when mouse pressed, background returns to black and clears canvas.
}
