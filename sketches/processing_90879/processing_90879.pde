
// dans ce sketch je crée un fond qui ne sera pas modifié (à base de trois triangles)
// puis des cercles sont créés où l'utilisateur le souhaite. 
//cependant, les couelurs restent le choix du hasard

void setup ()
{
  size (750,725) ;
  smooth ();
  background (0);

  //forme de base qui ne bouge pas à base de triangles 
  stroke(250);
  strokeWeight(3);
  scale(1.5);
  fill(250, 90);
  triangle(150, 200, 250, 48, 350, 200);

  translate(125, 200);
  scale(0.5);
  triangle(150, 200, 250, 48, 350, 200);

  scale(2);
  translate(375, 150);
  rotate(radians(180));
  triangle(150, 200, 250, 48, 350, 200);
  noLoop();
}

void draw() {
}

int x, y;

void mousePressed() {
  x= mouseX;
  y= mouseY;
}

void mouseDragged() {
  float d= dist (mouseX, mouseY, x, y);

  fill (random (400),random (90), random (0));
  ellipse (x, y, d*12, d*12);
  loop();
}



