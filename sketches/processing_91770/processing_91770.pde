
int contador;

void setup()
{
  size(800, 550);
  background(230, 220, 180); //Color crema
  contador = 0;
  frameRate(10);
}

void draw()
{
  if (contador == 0)
  {
    //////// Dibujo Estático  //////

    noStroke();

    // Rectangulo negro
    fill(0, 0, 0);
    rect(5, 5, 200, 540);

    // Rectangulos rojos
    fill(180, 0, 25);
    rect(215, 5, 800, 50);
    rect(215, 495, 800, 50);

    quad(620, 100, 620, 170, 805, 90, 805, 20);
    quad(620, 180, 620, 220, 805, 185, 805, 105); //separado superior 

    quad(620, 550-180, 620, 550-220, 805, 550-185, 805, 550-118); //separado inferior
    quad(620, 550-100, 620, 550-170, 805, 550-105, 805, 550-35); 

    // Triangulos verdes
    fill(180, 170, 70);
    triangle(215, 62, 685, 62, 215, 252);
    triangle(215, 550-62, 685, 550-62, 215, 550-252);


    // Circulos
    fill(230, 220, 180); //crema
    ellipse(215, 275, 440, 440);

    fill(#062576); // azul
    ellipse(215, 275, 425, 425);

    // Triangulo negro
    fill(0, 0, 0);
    triangle(200, 275, 635, 93, 635, 550-93);

    // Parche Crema
    fill(230, 220, 180);
    quad(635, 93, 635, 550-93, 650, 550-80, 650, 80);

    // Rect Azul
    fill(#062576); // azul
    quad(645, 230, 645, 550-230, 801, 550-195, 801, 195);
    

    // Imagen
    PImage b = loadImage("rodchenko.png");
    image(b, 0, 85, 405, 405);

    /////////////////////////////
  }

  fill(180, 0, 25);
  noStroke();

  //  LETRAS ROJAS  ////

  if (contador==5)
  {
    beginShape();
    vertex(302, 260);
    bezierVertex(302, 260, 301.5, 277.5, 301, 295);
    bezierVertex(301, 295, 310.5, 298, 320, 301);
    bezierVertex(320, 301, 320.5, 292, 321, 283);
    bezierVertex(321, 283, 327.5, 283, 334, 283);
    bezierVertex(334, 283, 337, 285, 340, 287);
    bezierVertex(340, 287, 340.5, 298, 341, 309);
    bezierVertex(341, 309, 350.5, 312.5, 360, 316);
    bezierVertex(360, 316, 360.5, 301, 361, 286);
    bezierVertex(361, 286, 355.5, 280.5, 350, 275);
    bezierVertex(350, 275, 356, 270.5, 362, 266);
    bezierVertex(362, 266, 362, 251.5, 362, 237);
    bezierVertex(362, 237, 352.5, 241, 343, 245);
    bezierVertex(343, 245, 343, 252.5, 343, 260);
    bezierVertex(343, 260, 340.5, 263, 338, 266);
    bezierVertex(338, 266, 330.5, 266, 323, 266);
    bezierVertex(323, 266, 323, 259, 323, 252);
    bezierVertex(323, 252, 313.5, 255, 304, 258);
    bezierVertex(304, 258, 303.5, 259.5, 303, 261);
    endShape(CLOSE);
  }

  if (contador==10)
  {
    beginShape();
    vertex(372, 233);
    bezierVertex(372, 233, 371.5, 276, 371, 319);
    bezierVertex(371, 319, 380.5, 322.5, 390, 326);
    bezierVertex(390, 326, 390, 306.5, 390, 287);
    bezierVertex(390, 287, 398.5, 287, 407, 287);
    bezierVertex(407, 287, 407.5, 310, 408, 333);
    bezierVertex(408, 333, 418, 336.5, 428, 340);
    bezierVertex(428, 340, 428.5, 275.5, 429, 211);
    bezierVertex(429, 211, 419, 214.5, 409, 218);
    bezierVertex(409, 218, 409, 240.5, 409, 263);
    bezierVertex(409, 263, 400.5, 263, 392, 263);
    bezierVertex(392, 263, 392, 244, 392, 225);
    endShape(CLOSE);
  }

  if (contador==15)
  {
    beginShape();
    vertex(437, 207);
    bezierVertex(437, 207, 436.5, 275, 436, 343);
    bezierVertex(436, 343, 446, 346, 456, 349);
    bezierVertex(456, 349, 466.5, 308.5, 477, 268);
    bezierVertex(477, 268, 476.5, 312, 476, 356);
    bezierVertex(476, 356, 486, 360, 496, 364);
    bezierVertex(496, 364, 496, 274, 496, 184);
    bezierVertex(496, 184, 487, 188, 478, 192);
    bezierVertex(478, 192, 467.5, 233.5, 457, 275);
    bezierVertex(457, 275, 456.5, 237.5, 456, 200);
    bezierVertex(456, 200, 446.5, 203.5, 437, 207);
    endShape(CLOSE);
  }
  if (contador==20)
  {
    beginShape();
    vertex(505, 179);
    bezierVertex(505, 179, 505, 272.5, 505, 366);
    bezierVertex(505, 366, 515.5, 369.5, 526, 373);
    bezierVertex(526, 373, 527, 288.5, 528, 204);
    bezierVertex(528, 204, 540, 199.5, 552, 195);
    bezierVertex(552, 195, 552, 178.5, 552, 162);
    endShape(CLOSE);
  }
  if (contador==25)
  {
    beginShape();
    vertex(560, 158);
    bezierVertex(560, 158, 559.5, 271, 559, 384);
    bezierVertex(559, 384, 570, 388, 581, 392);
    bezierVertex(581, 392, 589.5, 336.5, 598, 281);
    bezierVertex(598, 281, 598.5, 339, 599, 397);
    bezierVertex(599, 397, 609, 401.5, 619, 406);
    bezierVertex(619, 406, 619, 270, 619, 134);
    bezierVertex(619, 134, 609.5, 137, 600, 140);
    bezierVertex(600, 140, 591, 201, 582, 262);
    bezierVertex(582, 262, 581.5, 206, 581, 150);
    bezierVertex(581, 150, 570.5, 154, 560, 158);
    endShape(CLOSE);
  }
  if (contador>30)
  {
    contador = -1;
  }

  //noLoop();

  contador++;
}


