
float acu1 = 0;
float acu2 = 0;

float posix1 = 300;
float posix2 = 350;
float posix3 = 400;
float posix4 = 350;
float posix5 = 300;
float posiy1 = 150;
float posiy2 = 110;
float posiy3 = 150;
float posiy4 = 250;
float posiy5 = 110;

float colorG = 116;
float colorB = 167;

void setup () {
  size(640, 360);
  //size(1280, 720);
  background (0);
}

void draw () {
  stroke (0, colorG, colorB, 30);
  strokeWeight (2);
  noFill();
  beginShape();
  vertex(posix1, posiy1);
  vertex(posix2, posiy2);
  vertex(posix3, posiy3);
  vertex(posix4, posiy4);
  vertex(posix5, posiy5);
  endShape(CLOSE);
  
  //rect (posix1, posiy1, 20, 20);
  
  //println (acu1);
  
 
  /* //movimiento automatico
  posix1 = posix1 - 1;
  posix2 = posix2 - 1;
  posix3 = posix3 + 2;
  posix4 = posix4 + 1;
  posix5 = posix5 - 2;
  
  posiy1 = posiy1 + 1;
  posiy2 = posiy2 - 2;
  posiy3 = posiy3 - 1;
  posiy4 = posiy4 + 2;
  posiy5 = posiy5 + 2;
  */
  
  /*//movimiento automatico y con el mouse
  posix1 = posix1 - map (mouseX, 0, 639, -1, 1);
  posix2 = posix2 - map (mouseX, 0, 639, -1, 1);
  posix3 = posix3 + map (mouseX, 0, 639, -1, 1);
  posix4 = posix4 + map (mouseX, 0, 639, -1, 1);
  posix5 = posix5 - map (mouseX, 0, 639, -1, 1);
  
  posiy1 = posiy1 + map (mouseY, 0, 359, -1, 1);
  posiy2 = posiy2 - map (mouseY, 0, 359, -1, 1);
  posiy3 = posiy3 - map (mouseY, 0, 359, -1, 1);
  posiy4 = posiy4 + map (mouseY, 0, 359, -1, 1);
  posiy5 = posiy5 + map (mouseY, 0, 359, -1, 1);
  **/
  
   
  //movimiento segumiento y con el mouse lento
  posix1 = posix1 + map (mouseX, 0, 639, -.5, .5);
  posix2 = posix2 + map (mouseX, 0, 639, -1, 1);
  posix3 = posix3 + map (mouseX, 0, 639, -.5, .5);
  posix4 = posix4 + map (mouseX, 0, 639, -1, 1);
  posix5 = posix5 + map (mouseX, 0, 639, -1, 1);
  
  posiy1 = posiy1 + map (mouseY, 0, 359, -1, 1);
  posiy2 = posiy2 + map (mouseY, 0, 359, -.5, .5);
  posiy3 = posiy3 + map (mouseY, 0, 359, -1, 1);
  posiy4 = posiy4 + map (mouseY, 0, 359, -.5, .5);
  posiy5 = posiy5 + map (mouseY, 0, 359, -1, 1);
 
 /* 
   //movimiento segumiento con el mouse rapido
  posix1 = posix1 + map (mouseX, 0, 639, -5, 5);
  posix2 = posix2 + map (mouseX, 0, 639, -3, 3);
  posix3 = posix3 + map (mouseX, 0, 639, -5, 5);
  posix4 = posix4 + map (mouseX, 0, 639, -3, 3);
  posix5 = posix5 + map (mouseX, 0, 639, -5, 5);
  
  posiy1 = posiy1 + map (mouseY, 0, 359, -5, 5);
  posiy2 = posiy2 + map (mouseY, 0, 359, -5, 5);
  posiy3 = posiy3 + map (mouseY, 0, 359, -3, 3);
  posiy4 = posiy4 + map (mouseY, 0, 359, -5, 5);
  posiy5 = posiy5 + map (mouseY, 0, 359, -5, 5);
  */
  
  //cambio de color del stroke
  acu1 = sin (mouseX);
  acu2 = cos (mouseY);
  colorG = map (acu1, -1, 1, 0, 255);
  colorB = map (acu2, -1, 1, 0, 255);
  
}



