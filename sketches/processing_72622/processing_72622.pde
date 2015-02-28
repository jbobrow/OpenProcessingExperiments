
void setup () {
  size (600, 600);
  smooth ();
  frameRate (30);
}

void draw () {
  background (200);
  
 //spidey head
 fill (mouseX, 0, mouseY);
 ellipseMode (CENTER);
 stroke (0);
 //ellipse (300, 280, 75, 50);
 ellipse (mouseX, mouseY, 75, 50);
 
 //spidey feet
 strokeWeight (abs(pmouseX-mouseX));
 //set 1 (upper)
// line (270, 260, 200, 200);
// line (330, 260, 400, 200);
// //set 1 (lower)
// line (200, 200, 250, 500);
// line (400, 200, 365, 500);
// //set 2 (upper)
// line (260, 275, 175, 250);
// line (340, 275, 425, 250);
// //set 2 (lower)
// line (175, 250, 190, 475); 
// line (425, 250, 415, 475);

 // set 1 (upper)
 line (mouseX-30, mouseY-20, mouseX-100, mouseY-80);
 line (mouseX+30, mouseY-20, mouseX+100, mouseY-80);
 // set 1 (lower)
 line (mouseX-100, mouseY-80, 250, 500);
 line (mouseX+100, mouseY-80, 365, 500);
 // set 2 (upper)
 line (mouseX-40, mouseY-5, mouseX-125, mouseY-30);
 line (mouseX+40, mouseY-5, mouseX+125, mouseY-30);
 //set 2 (lower)
 line (mouseX-125, mouseY-30, 190, 475);
 line (mouseX+125, mouseY-30, 415, 475);
 
 
}
