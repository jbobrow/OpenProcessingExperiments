



void setup() {
  size(1000, 1000);
}
void draw() {
  background (0, mouseX+2300/20, mouseX+2550/10);
  noStroke (); 
  // nuvens
  if (( mouseX>0) && (mouseY>0))  


    smooth();
  noStroke ();
  fill (250);
  ellipse (680+mouseX/4, 385+mouseY/4, 60, 60);
  ellipse (660+mouseX/4, 420+mouseY/4, 65, 65);
  ellipse (700+mouseX/4, 420+mouseY/4, 65, 65);

  ellipse (62+mouseX/4, 175+mouseY/4, 60, 60);
  ellipse (40+mouseX/4, 210+mouseY/4, 65, 65);
  ellipse (80+mouseX/4, 210+mouseY/4, 65, 65);

  ellipse (80+mouseX/4, 350+mouseY/4, 75, 75);
  ellipse (40+mouseX/4, 350+mouseY/4, 70, 60);
  ellipse (120+mouseX/4, 350+mouseY/4, 70, 60);

  ellipse (650+mouseX/4, 150+mouseY/4, 75, 75);
  ellipse (610+mouseX/4, 150+mouseY/4, 70, 60);
  ellipse (690+mouseX/4, 150+mouseY/4, 70, 60);

  //sol
  fill (252, 217, 13);
  ellipse (60+mouseX, 60+mouseY, 80, 80);

  //edificio
  stroke (2);
  fill (15, 69, 12);
  rect (0, 500, 1200, 800);
  fill (62, 128, 128);
  stroke (0);
  rect (300, 50, 300, 600 );
  for (int b = 0; b < 5; b++) {
    for (int a = 0; a < 5; a++) {
      fill (255, 255, 0);

      //janela
      float x= mouseX;
      float y= mouseY;
      fill (random (255), random (255), random (255), 127);
      rect (310 + a * 55 + 10, 80 + b * 100, 40, 60);
      strokeWeight (1);
      rect ( 425, 590, 40, 60);
      strokeWeight (0);
    }
  }
}




