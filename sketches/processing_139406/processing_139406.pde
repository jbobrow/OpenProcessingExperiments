

PVector[] retta;
PVector puntoFisso, puntoMouse;

PFont f;

//////////////////////////////////////////////////////////////// SETUP
void setup() {
  size(400, 400);
  smooth();  
  //noLoop();
  
  retta = new PVector[2];
  retta[0] = new PVector( random(width), 40+random(height-40) );
  retta[1] = new PVector( random(width), 40+random(height-40) );
  puntoFisso = new PVector( random(width), 40+random(height-40) );
  puntoMouse = new PVector( 0.0, 0.0 );
  
  f = createFont("Courier", 72, true);
  
}


///////////////////////////////////////////////////////////////// DRAW
void draw() {
  
  puntoMouse.set(mouseX, mouseY);
  
  
  pushStyle();
  fill(0);
  textFont(f);
  textAlign(LEFT);
  textSize(12);
  if (stessaParte(retta, puntoFisso, puntoMouse) ) {
    background(0, 255, 0, 60);
    text("il punto fisso e il mouse sono\nsullo stesso lato lato rispetto alla retta", 10, 20);
  } else {
    background(255, 0, 0, 60);
    text("il punto fisso e il mouse sono\nsu lati opposti rispetto alla retta", 10, 20);
  }
  text("fisso", puntoFisso.x, puntoFisso.y);
  text("mouse", puntoMouse.x, puntoMouse.y);
  popStyle();

  pushStyle();
  stroke(0);
  fill(0);
  ellipse(puntoFisso.x, puntoFisso.y, 5, 5);
  ellipse(puntoMouse.x, puntoMouse.y, 5, 5);
  noFill();
  ellipse(retta[0].x, retta[0].y, 5, 5);
  ellipse(retta[1].x, retta[1].y, 5, 5);
  strokeWeight(1);
  line(retta[0].x, retta[0].y, retta[1].x, retta[1].y);
  popStyle();
  

}


///////////////////////////////////////////////////////// STESSA PARTE
boolean stessaParte( PVector[] retta_, PVector P, PVector Q) {
  float dx ,dy, dx1, dx2, dy1, dy2;
  dx  = retta_[1].x - retta_[0].x;
  dy  = retta_[1].y - retta_[0].y;
  dx1 = P.x - retta_[0].x;
  dy1 = P.y - retta_[0].y;
  dx2 = Q.x - retta_[1].x;
  dy2 = Q.y - retta_[1].y;
  return ((((dx*dy1) - (dy*dx1))*((dx*dy2)-(dy*dx2))) >= 0);
}



