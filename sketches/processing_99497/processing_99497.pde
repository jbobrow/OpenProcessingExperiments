
float acu1 = 0;
float acu2 = 0;

float posix1 = 480;
float posix2 = 510;
float posix3 = 580;
float posix4 = 500;
float posiy1 = 200;
float posiy2 = 250;
float posiy3 = 300;
float posiy4 = 200;


float colorG = 116;
float colorB = 167;

void setup () {
  
  size(1024, 576);
  background (255);
}

void draw () {
  stroke (0, 10);
  strokeWeight (2);
  noFill();
  beginShape();
  vertex(posix1, posiy1);
  vertex(posix2, posiy2);
  vertex(posix3, posiy3);
  vertex(posix4, posiy4);
  endShape(CLOSE);
  
   
  
  
 /*
 //movimiento automatico
  posix1 = posix1 - 1;
  posix2 = posix2 - 1;
  posix3 = posix3 + 2;
  posix4 = posix4 + 1;
    
  posiy1 = posiy1 + 1;
  posiy2 = posiy2 - 2;
  posiy3 = posiy3 - 1;
  posiy4 = posiy4 + 2;


  posix1 = posix1 - acu2;
  posix2 = posix2 - acu2;
  posix3 = posix3 + acu2;
  posix4 = posix4 + acu2;
    
  posiy1 = posiy1 + acu2;
  posiy2 = posiy2 - acu2;
  posiy3 = posiy3 - acu2;
  posiy4 = posiy4 + acu2;
  
 */
  
 

   //movimiento segumiento con el mouse rapido
  posix1 = posix1 + map (mouseX, 0, 1023, -5, 5);
  posix2 = posix2 + map (mouseX, 0, 1023, -3, 3);
  posix3 = posix3 + map (mouseX, 0, 1023, -5, 5);
  posix4 = posix4 + map (mouseX, 0, 1023, -3, 3);
  
  
  posiy1 = posiy1 + map (mouseY, 0, 575, -5, 5);
  posiy2 = posiy2 + map (mouseY, 0, 575, -5, 5);
  posiy3 = posiy3 + map (mouseY, 0, 575, -3, 3);
  posiy4 = posiy4 + map (mouseY, 0, 575, -5, 5);
  

  
  //cambio de color del stroke
  acu1 = acu1 + 1;
  acu2 = cos (acu1)*10+1;
  //colorG = map (acu1, -1, 1, 0, 255);
  //colorB = map (acu2, -1, 1, 0, 255);
  
  stroke (0, 10);
  strokeWeight (10);
  fill (255);
  beginShape();
  vertex(posix1, posiy1);
  vertex(posix2, posiy2);
  vertex(posix3, posiy3);
  endShape(CLOSE);
}



