
int x= 255;
int y= 255;
float mida = 10;
float resta = 50;
float cosa = 0.25;

void setup () {
  size (x, y);
  background (0, 0, 0);
}


void draw () {
  background  (182, 0, mouseX);
  strokeWeight (5);
  stroke (random (252), (0), (0));
  fill (mouseY, 255, mouseX); 

  //Ellipse central
  ellipse (mouseX, mouseY, mouseY, mouseY);
  //Ellipse esquerra
  noStroke ();
  noFill ();
  fill (28,230, mouseX);
  ellipse (mouseX-resta, mouseY, mouseY*cosa, mouseY*cosa);
  //Ellipse dreta
  ellipse (mouseX+resta, mouseY, mouseY*cosa, mouseY*cosa);
  //Ellipse superior
  ellipse (mouseX, mouseY-resta, mouseY*cosa, mouseY*0.15);
  ellipse (mouseX, mouseY+resta, mouseY*cosa, mouseY*0.15);
  
  //TRIANGULITOS
  noStroke ();
  stroke (255, 206, 5);
  fill (random (0), (0));
  triangle (mouseX, mouseY-resta, mouseX-resta, mouseY, mouseY*cosa, mouseY*0.15);
  triangle (mouseX, mouseY+resta, mouseX+resta, mouseY, mouseY*cosa, mouseY*0.15);
  triangle (mouseX+resta, mouseY, mouseX, mouseY-resta, mouseY*cosa, mouseY*0.15);
  triangle (mouseX-resta, mouseY, mouseX, mouseY+resta, mouseY*cosa, mouseY*0.15);
  

  //linies interiors diagonals
  stroke (random (5), (180));
  line (mouseX-mida, mouseY-mida, mouseX+mida, mouseY+mida);
  line (mouseX+mida, mouseY-mida, mouseX-mida, mouseY+mida);
}

