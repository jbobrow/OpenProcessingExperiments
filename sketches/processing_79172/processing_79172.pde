
void setup() {
size(400,400); //Size of the sketch window.
ellipseMode(CENTER); //set ellipses to CENTER mode
}

void draw() {
  
background(0,170,255); //Background colour for the sketch (cyan)

fill(0,255,0); //Colour for the body.

stroke(0); //Colour for the outline of the character.

ellipse(mouseX,mouseY,200,200); //Size and shape of the base body for sketch and it follows the mouse.

fill(255); //Right eye colour.

stroke(0); //right eye outline.

ellipse(pmouseX-45,pmouseY-25,50,50); //Right eye follows mouse

fill(0); //Right eye pupil colour.

ellipse(pmouseX-45,pmouseY-25,25,25); //Right eye pupil follows mouse

fill(255); // Left eye colour.

stroke(0); //Left eye outline.

ellipse(pmouseX+45,pmouseY-25,50,50); //Left eye follows mouse

fill(0); //Left eye pupil colour.

ellipse(pmouseX+45,pmouseY-25,25,25); //Left eye pupil follows mouse

fill(0,255,70); //Nose colour

stroke(0); //Nose outline

ellipse(pmouseX,pmouseY+25,80,50); //Nose follows mouse.

fill(0); //Right nostril colour.

ellipse(pmouseX-20,pmouseY+25,15,30); //Right nostril follows mouse.

ellipse(pmouseX+20,pmouseY+25,15,30); //Left nostril follows mouse

fill(0,255,0); //Colour for ear.

stroke(0); //Outline for ear

ellipse(pmouseX-50,pmouseY-110,50,50); //Right ear follows mouse.

ellipse(pmouseX+50,pmouseY-110,50,50); //Left ear follows mouse.

fill(0); //Inside of ear colour.

ellipse(pmouseX-50,pmouseY-110,25,25); //Inside of right ear follows mouse.

ellipse(pmouseX+50,pmouseY-110,25,25); //Inside of left ear follows mouse.

}



