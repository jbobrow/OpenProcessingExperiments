
PImage inutil;
PImage ahora;
PImage puta;
PImage grande;
PImage mecos;
PImage susana;
PImage sangre;
PFont Futura;
float x, y, r;


void setup(){
  size (640,480);
  background(255);
  
  inutil = loadImage ("inutil.png");
  ahora = loadImage ("ahora.png");
  puta = loadImage ("puta.png");
  grande = loadImage ("grande.png");
  mecos = loadImage ("mecos.png");
  susana = loadImage ("susana.png");
  sangre = loadImage ("sangre.png");
  Futura = loadFont ("Futura-120.vlw");

  
  smooth();
  noLoop();
  imageMode(CENTER);

  
}

void draw()
{
  
textFont(Futura,72);
  fill(255,0,0);
  text("compra", 190, 250);
  
  if(mousePressed == true) {
    noCursor();
  } else {
    noCursor();
  }
  pushMatrix();
  x = random(0,width);
  y = random(0,height);
  r = random(0, 40);
  translate(x, y);
  rotate(r);
  image(inutil,0,0);
  popMatrix();
  
  pushMatrix();
  x = random(width);
  y = random(height);
  r = random(0, 40);
  translate(x, y);
  rotate(r);
  image(ahora,0,0);
  popMatrix();
  
  pushMatrix();
  x = random(width);
  y = random(height);
  r = random(0, 40);
  translate(x, y);
  rotate(r);
  image(puta,0,0);
  popMatrix();
  
  pushMatrix();
  x = random(width);
  y = random(height);
  r = random(0, 40);
  translate(x, y);
  rotate(r);
  image(grande,0,0);
  popMatrix();
  
  pushMatrix();
  x = random(width);
  y = random(height);
  r = random(0, 40);
  translate(x, y);
  rotate(r);
  image(mecos,0,0);
  popMatrix();
  
  pushMatrix();
  x = random(width);
  y = random(height);
  r = random(0, 40);
  translate(x, y);
  rotate(r);
  image(susana,0,0);
  popMatrix();
  
  pushMatrix();
  x = random(width);
  y = random(height);
  r = random(0, 40);
  translate(x, y);
  rotate(r);
  image(sangre,0,0);
  popMatrix();
  
 

  
}

void mousePressed ()
{
  redraw();
  background(255);
}




