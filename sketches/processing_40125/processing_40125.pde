
import processing.opengl.*;

float inc = 0.0; //this is a float setup to change the rotation as per incrementation

void setup(){
//gives no stroke to the cube.  can run no stroke and no fill to leave a skeleton
noStroke(); 
fill(255);//gives the cube a colour
size(400,400,OPENGL); //x and y size definition and then applying a 3rd dimension renderer, OPENGL. OPENGL uses the power from the graphics card to render and play with objects


}

void draw(){
 background(137,137,137); //defines the background colour.
 lights(); //puts lighting on the object to create tone and depth on the box
 inc+=0.065; //increment by a decimal number to make the box rotate slowly
 pushMatrix(); //creates a new matrix (an array of numbers) on top of the current co-ordinate system.  Uses that array of numbers to change the position of the coordinate system when requested.
 translate(mouseX, mouseY); //defines the location of the cube
 rotateX(inc); //rotates on the X axis as defined by the float increment. rotation must come before popmatrix so that it is not overridden before a rotation can take affect
 rotateY(inc); //rotates the Y axis as defined by the float increment.  without x or y it will spin on one axis
 box(50, 50, 50); //creates a cube.
 popMatrix(); //deletes array so that it doesnt affect any objects outside of the push matrix. 
}


