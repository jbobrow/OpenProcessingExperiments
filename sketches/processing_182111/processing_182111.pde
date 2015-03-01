
void setup() {
  size (640, 640);
  noStroke();
}

void draw() {
  background(0);
  
  fill(#FCF505);
for (int i = 0 ; i < 101 ; i++) {
  for (int j = 0 ; j < 101 ; j++) {
    ellipse(30*i, 30*j, 10, 10) ;
  }
}


  fill(#064D93);
  ellipse(425, 200, 72, 72);

  fill(#064D93);
  ellipse(225, 200, 72, 72);

  fill(#C10006);
  ellipse(325, 190, 100, 100);
  
  fill(#7900B7);
  triangle(265, 350, 200, 442, 273, 442);
  
  fill(#7900B7);
  triangle(378, 350, 451, 442, 378, 442);

  fill(#47D652);
  ellipse(325, 300, 280, 280);

  fill(#FEFCFF);
  ellipse(380, 225, 40, 40);

  fill(#FEFCFF);
  ellipse(265, 225, 40, 40);
  
  fill(0);
  ellipse(258, 228, 20, 20);
  
  fill(0);
  ellipse(386, 219, 20, 20);
  
  fill(#064D93);
  triangle(272, 265, 377, 265, 324, 311);
  

  fill(255);
  text(mouseX + ", " + mouseY, 20, 20);
}



