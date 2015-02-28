
// Exercise: 3-2

void setup() { 
// Skrev fel först. Skrev "void Setup" istället för "void setup". 
//Det gick att exportera sketchen men endast en liten del av kepsen syntes.

  size(300, 300);
}


void draw() {
  
  background(125,0,150); // R, G, B bg-color
  smooth();

  rectMode(CENTER);
  ellipseMode(CENTER);


  // HAIR - - 
  // sroke in the middle
  strokeWeight(1);
  stroke(0);
  line(150, 25, 150, 75);


  // stroke 25 degrees to left
  stroke(0, 255, 0, 255);
  line(125, 25, 150, 75);


  // stroke 25 degrees to right
  stroke(0, 255, 0, 255);
  line(175, 25, 150, 75);
  // HAIR STOP - -


  // ARMS START
  strokeWeight(2);
  stroke(0);
  line (150, 150, 190, 125);
  line (150, 150, 110, 125); 
  // ARMS STOP



  // BODY START - -
  noStroke();
  fill(50, 0, 100, 250);

  // triangle
  quad (120, 100, 180, 100, 150, 240, 150, 240); // tog fel på quad & arc först
  // BODY STOP - -

  // HAT START - - 
  // halvformad circle
  fill(255);
  arc (149, 99, 60, 55, -PI, 0);
  rectMode(CORNER);
  rect(90, 95, 55, 4);
  // HAT STOP - -

  // EYES - -

  // overall eyes
  fill(0, 255, 255, 255);
  noStroke();
  ellipse (mouseX-15, mouseY, 10, 20); // To put the mouse cursor in between the two eyes. (Window size = 300 pix width / 2 = 150 pix. ellipseMode(CENTER). The center of the eye-ellipse = 135, 135 - 150 = -15)
  ellipse (mouseX+15, mouseY, 10, 20); // TO put the mouse cursor in between the two eyes. (Window size = 300 pix width / 2 = 150 pix. ellipseMode(CENTER). The center of the eye-ellipse = 135, 150 - 135 = +15)
  // ellipse (135, 110, 10, 20); // Functions from a previous version.
  // ellipse (163, 110, 10, 20); // Functions from a previous version.

  // pupiller
  fill(0);
  ellipse (135, 115, 5, 10);
  ellipse (163, 115, 5, 10);
  // EYES STOP - -


  // MOUTH START - -
  strokeWeight(3);
  stroke(255, 0, 0, 255);
  noFill();
  arc (156, 148, 20, 25, -PI, -PI / 2);
  // MOUTH STOP - - 

  // FEETS START - -
  ellipseMode(CORNER);
  noStroke();
  fill(0);
  ellipse(115, 232, 35, 10);
  ellipse(150, 232, 35, 10);
  // FEETS STOP - -
}


