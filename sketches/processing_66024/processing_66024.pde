
size(410, 335);
background(0);

int posX = 30;
int posY = 30;
int tamX = 25;
int tamY = 25;
int s = 5;
color amarillo = color(255, 230, 0);
color azul = color(0, 0, 250);
color rojo = color(250, 0, 0);
color blanco = color(255);
color negro = color(0);

// First Column - - - - - - - - - - - - 
  fill(blanco);
rect(s, s, tamX*3, tamY);
rect(s, posY+s, tamX*3, tamY);
  fill(azul);
rect(s, (posY*2+s), tamX*3, tamY*6);
  fill(blanco);
rect(s, (posY*6)+(8*s), tamX*3, tamY);
rect(s, (posY*7)+(8*s), tamX*3, tamY);
  fill(amarillo);
rect(s, (posY*8)+(8*s), tamX*3, tamY*2);

// 2 Column - - - - - - - - - - - - 
  fill(blanco);
rect(posY*3-5, s, tamX*2, tamY);
rect(posY*3-5, posY+s, tamX*2, tamY);
  fill(blanco);
rect(posY*3-5, (posY*2+s), tamX*2, tamY*6);
  fill(rojo);
rect(posY*3-5, (posY*6)+(8*s), tamX*2, tamY);
  fill(amarillo);
rect(posY*3-5, (posY*7)+(8*s), tamX*2, tamY);
  fill(blanco);
rect(posY*3-5, (posY*8)+(8*s), tamX*2, tamY*2);

// 3 Column - - - - - - - - - - - - 
  fill(negro);
rect(posY*5-10, s, tamX*2, tamY);
  fill(rojo);
rect(posY*5-10, posY+s, tamX*2, tamY);
  fill(amarillo);
rect(posY*5-10, (posY*2+s), tamX*2, tamY*6);
  fill(negro);
rect(posY*5-10, (posY*6)+(8*s), tamX*2, tamY);
  fill(amarillo);
rect(posY*5-10, (posY*7)+(8*s), tamX*2, tamY);
  fill(blanco);
rect(posY*5-10, (posY*8)+(8*s), tamX*2, tamY*2);

// 4 Column - - - - - - - - - - - - 
  fill(blanco);
rect(posY*7-15, s, tamX*4, tamY);
  fill(blanco);
rect(posY*7-15, posY+s, tamX*4, tamY);
  fill(blanco);
rect(posY*7-15, (posY*2+s), tamX*4, tamY*6);
  fill(blanco);
rect(posY*7-15, (posY*6)+(8*s), tamX*4, tamY);
  fill(blanco);
rect(posY*7-15, (posY*7)+(8*s), tamX*4, tamY);
  fill(blanco);
rect(posY*7-15, (posY*8)+(8*s), tamX*4, tamY*2);

// 5 Column - - - - - - - - - - - - 
  fill(rojo);
rect(posY*10, s, tamX*2, tamY);
  fill(rojo);
rect(posY*10, posY+s, tamX*2, tamY);
  fill(blanco);
rect(posY*10, (posY*2+s), tamX*2, tamY*6);
  fill(rojo);
rect(posY*10, (posY*6)+(8*s), tamX*2, tamY);
  fill(blanco);
rect(posY*10, (posY*7)+(8*s), tamX*2, tamY);
rect(posY*10, (posY*8)+(8*s), tamX*2, tamY*2);

// 6 Column - - - - - - - - - - - - 
  fill(blanco);
rect(posY*12-5, s, tamX*2, tamY);
  fill(blanco);
rect(posY*12-5, posY+s, tamX*2, tamY);
  fill(blanco);
rect(posY*12-5, (posY*2+s), tamX*2, tamY*6);
  fill(blanco);
rect(posY*12-5, (posY*6)+(8*s), tamX*2, tamY);
  fill(rojo);
rect(posY*12-5, (posY*7)+(8*s), tamX*2, tamY);
  fill(blanco);
rect(posY*12-5, (posY*8)+(8*s), tamX*2, tamY*2);



