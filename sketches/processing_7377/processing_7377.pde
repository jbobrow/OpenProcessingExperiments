
PImage tiptoes;
PImage handstandlady;
PImage modelbutt;
PImage holdinghands;
PImage leapfrog;
PImage polkadotbikini;
PImage ladywithsunglasses;
PImage swimcaplady;
PImage ladywithball;
PImage pyramid;
PImage bike;
PImage layingout;
PImage longboard;
PImage sand;

PShape clam;
PShape shell;
PShape bigclam;
PShape bigshell;


float x, y, r;


void setup () {
  size (640, 480);
  smooth ();
  background (155);
  noLoop ();
  //frameRate (.5);
  
  tiptoes = loadImage ("tiptoescopy.png");
  handstandlady = loadImage ("handstandladycopy.png");
  modelbutt = loadImage ("modelbuttcopy.png");
  holdinghands = loadImage ("holdinghandscopy.png");
  leapfrog = loadImage ("leapfrogcopy.png");
  polkadotbikini = loadImage ("polkadotbikinicopy.png");
  ladywithsunglasses = loadImage ("ladywithsunglassescopy.png");
  swimcaplady = loadImage ("swimcapladycopy.png");
  ladywithball = loadImage ("ladywithballcopy.png");
  pyramid = loadImage ("pyramidcopy.png");
  bike = loadImage ("bikecopy.png");
  layingout = loadImage ("layingoutcopy.png");
  longboard = loadImage ("longboardcopy.png");
  sand = loadImage ("sand.png");

  clam = loadShape ("clam.svg");
  shell = loadShape ("seashell.svg");
  bigclam = loadShape ("bigclam.svg");
  bigshell = loadShape ("bigseashell.svg");
  
}


void draw () {
  
  //SAND BACKGROUND
  x = (320);
  y = (240);
  pushMatrix();
  translate(x, y);
  image(sand, -sand.width/2, -sand.height/2);
  popMatrix();
    
    //BIG CLAM DRAWING
  x = random(0, 320);
  y = random(height);
  r = random (0, HALF_PI);
  pushMatrix();
  translate(x, y);
  rotate (r);
  shape(bigclam, -bigclam.width/2, -bigclam.height/2);
  popMatrix();
  
  //BIG SHELL DRAWING
  x = random(320, 640);
  y = random(height);
  r = random (0, HALF_PI);
  pushMatrix();
  translate(x, y);
  rotate (r);
  shape(bigshell, -bigshell.width/2, -bigshell.height/2);
  popMatrix();  
    
  //CLAM DRAWING
  x = random(320, 640);
  y = random(height);
  r = random (0, HALF_PI);
  pushMatrix();
  translate(x, y);
  rotate (r);
  shape(clam, -clam.width/2, -clam.height/2);
  popMatrix();
  
  //SHELL DRAWING
  x = random(0, 320);
  y = random(height);
  r = random (0, HALF_PI);
  pushMatrix();
  translate(x, y);
  rotate (r);
  shape(shell, -shell.width/2, -shell.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(swimcaplady, -swimcaplady.width/2, -swimcaplady.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(polkadotbikini, -polkadotbikini.width/2, -polkadotbikini.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(tiptoes, -tiptoes.width/2, -tiptoes.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(layingout, -layingout.width/2, -layingout.height/2);
  popMatrix();
    
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(longboard, -longboard.width/2, -longboard.height/2);
  popMatrix();  
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(ladywithball, -ladywithball.width/2, -ladywithball.height/2);
  popMatrix();

  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(pyramid, -pyramid.width/2, -pyramid.height/2);
  popMatrix();
      
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(ladywithsunglasses, -ladywithsunglasses.width/2, -ladywithsunglasses.height/2);
  popMatrix();  
   
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(holdinghands, -holdinghands.width/2, -holdinghands.height/2);
  popMatrix();
  
    x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(leapfrog, -leapfrog.width/2, -leapfrog.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(bike, -bike.width/2, -bike.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(modelbutt, -modelbutt.width/2, -modelbutt.height/2);
  popMatrix();
  
  x = random(width);
  y = random(height);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  image(handstandlady, -handstandlady.width/2, -handstandlady.height/2);
  popMatrix();
}

void mousePressed() { 
  redraw(); 

}


