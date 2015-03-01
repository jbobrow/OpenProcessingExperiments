


//Layout de 255x255 en estàtic
void setup() {
  size(255, 255);
}

//Objectes en moviment/canvi de colors
void draw() {

  //Layout que canvia de color en escala de grisos segons la posició Y del ratolí
  background(mouseY);

  //Línies: el seu color varia de manera aleatòria i constant segons la posició del ratolí en X,Y, i segueixen el moviment de les boles
  stroke(random(255), random(255), random(255));
  strokeWeight(5);
  line(mouseX-25, mouseY-25, mouseX+25, mouseY+25);
  line(mouseX+25, mouseY-25, mouseX-25, mouseY+25);

  //Bola del mig: el color de la línia canvia segons la posició X del ratolí en un gradient de liles, el color que l'omple varia segons la posició X en un gradient de roses i en opacitat, i la seva mida canvia segons la posició Y del ratolí dins la seva pròpia escala
  stroke(mouseX, random(100), random(255));
  strokeWeight(2);
  fill(240, mouseX, 214, 98);
  ellipse(mouseX, mouseY, mouseY/2, mouseY/2);

  //Bola esquerre dalt: el color que l'omple varia segons la posició X del ratolí en un gradient de blaus, i la seva mida canvia segons la posició Y del ratolí dins la seva pròpia escala
  stroke(255, 153, 0);
  fill(0, 0, mouseX);
  ellipse(mouseX-25, mouseY-25, mouseY/3, mouseY/3);

  //Bola dreta dalt: el color que l'omple varia segons la posició X del ratolí en un gradient de verds, i la seva mida canvia segons la posició Y del ratolí dins la seva pròpia escala
  stroke(233, 255, 0);
  fill(0, mouseX, 0);
  ellipse(mouseX+25, mouseY-25, mouseY/3, mouseY/3);

  //Bola esquerre baix: el color que l'omple varia segons la posició X del ratolí en un gradient de vermells, i la seva mida canvia segons la posició Y del ratolí dins la seva pròpia escala (diferent de les de dalt)
  stroke(0, 232, 255);
  fill(mouseX, 0, 0);
  ellipse(mouseX-25, mouseY+25, mouseY/4, mouseY/4);

  //Bola dreta baix: el color que l'omple varia segons la posició X del ratolí en un gradient de grocs, i la seva mida canvia segons la posició Y del ratolí dins la seva pròpia escala (diferent de les de dalt)
  stroke(88, 0, 255);
  fill(mouseX, mouseX, 0);
  ellipse(mouseX+25, mouseY+25, mouseY/4, mouseY/4);
}

