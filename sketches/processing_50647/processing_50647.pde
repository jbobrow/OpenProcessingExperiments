
// assignment 4
// Mi Jin Hwang copyright 2012
// * Upper key for chaning in random color of the ellipse
// * 's' key for changes in size of the main ellipse
// * 'm' key for random changes in sizes of the ellipses with random colors
// * 'j' key for random changes in sizes of the ellipses with random fainted colors 

float x, y, dia;

void setup (){
  size (800,500);
  noStroke();
  smooth();
  background(214, 199, 208);
  fill(random(97), random(213), random(234));
}

void draw (){
  
  ellipse(width, height, dia, dia); 
  dia = random (400);
  strokeWeight (30);
  bezier (350, 355, 330, 320, 370, 320, 350, 355);
  bezier (350, 355, 330, 390, 370, 390, 350, 355);
  bezier (350, 355, 315, 335, 315, 375, 350, 355);
  bezier (350, 355, 385, 335, 385, 375, 350, 355);

  
}

void keyPressed() {
  if (keyCode == UP){
  fill (random (255), random (46), random (168));
}
  if (key == 's') {
    ellipse (random (width), random (height), dia, dia);
  }
  if (key =='m'){
    ellipse(random (width+10), random (height+10), random (dia+10), random (dia+10));
    fill (random (252), random (84), random (183));
  }

  if (key == 'j'){
  ellipse (random (width-20), random (height -20), random (dia -10), random (dia -10));
  fill (random (255), random (255), random (255), 50);  
  }
  
}




