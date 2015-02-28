
/*
CARTOON CHARACTER
Perry the Platypus
AundieMegan Soriano
2nd period
This is an example for creating
a cartoon character with basic shapes
*/
void setup() {
 size (500,500);
 background(181,193,182);
}




void draw() {
 
 fill(34,211,198);
 rect(100,100,290,400,7); //the body
 
 
 //the left eye
 ellipseMode(RADIUS);  // Set ellipseMode to RADIUS
 fill(255);  // the outer part of the eye - white
 ellipse(170,170,40,40);  // Draw white ellipse using RADIUS mode
 ellipseMode(CENTER);  // Set ellipseMode to CENTER
 fill(54,28,8);  // dark brown
 ellipse(170,170,40,40);  // Draw gray ellipse using CENTER mode
    
   ellipseMode(CORNER);  // Set ellipseMode to CENTER
   fill(255);  //white
   ellipse(170,170,15,15);  // Draw white ellipse using CENTER mode



//the right eye
 ellipseMode(RADIUS);  // Set ellipseMode to RADIUS
 fill(255);  // the outer part of the eye - white
 ellipse(320,170,40,40);  // Draw white ellipse using RADIUS mode
 ellipseMode(CENTER);  // Set ellipseMode to CENTER
 fill(54,28,8);  // dark brown
 ellipse(320,170,40,40);  // Draw gray ellipse using CENTER mode
 
   ellipseMode(CORNER);  // Set ellipseMode to CENTER
   fill(255);  // white
   ellipse(320,170,15,15);  // Draw white ellipse using CENTER mode

}
