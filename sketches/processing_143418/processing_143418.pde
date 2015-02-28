
/* @pjs preload="11.jpeg, 3961473352_54cb27dfed_b_800.jpg, 41474685.jpg, 4b059302c1b4bfoto_1.jpg.jpg, bellasartes.png, franz.png, laboratorio.png, mapmexico3.png, mapmexico.jpg, mumedi.jpg, museo.jpg, tamayo.png"; 
 */

PImage img, colorMap, foto1, foto2, foto3, foto4, foto5, foto6, foto7, foto8, foto9, foto10;

void setup() { 
  img = loadImage("mapmexico.jpg");
  colorMap = loadImage("mapmexico3.png");
  foto1 = loadImage("4b059302c1b4bfoto_1.jpg.jpg");
  foto2 = loadImage("mumedi.jpg");
  foto3 = loadImage("bellasartes.png");
  foto4 = loadImage("laboratorio.png");
  foto5 = loadImage("11.jpeg");
  foto6 = loadImage("museo.jpg");
  foto7 = loadImage("franz.png");
  foto8 = loadImage("tamayo.png");
  foto9 = loadImage("41474685.jpg");
  foto10 = loadImage("3961473352_54cb27dfed_b_800.jpg");

  size(839,610);
}

void draw() {
  background(img);
  //image(colorMap, 0, 0);

  fill(0); 
  noStroke(); 
  fill(0);
  textSize(39);
  color c = colorMap.get(mouseX, mouseY);
  println(red(c)+" " + green(c)+" "+blue(c));
  println(mouseX + " " +mouseY);
  if (img.get(mouseX, mouseY) == color(254, 0, 0) || colorMap.get(mouseX, mouseY) == color(252, 13, 27)) { 
    text("MUSEO ARCHIVO DE LA FOTOGRAFIA", 40, 55);
    noFill();
    stroke(50);
    ellipse(728, 357, 80, 80);
    fill(255, 0, 255);
    noStroke();
    rect(500, 100, 250, 150);
    fill(0);
    textSize(12);
    text("DIRECCIÓN: REPÚBLICA DE GUATEMALA 34, CENTRO, CUAUHTÉMOC, D.F. TELÉFONO: 26 16 70 57.                  HORARIO: 10:00-18:00", 510, 120, 245, 145);
    image(foto1, 345, 100, 150, 100);
  } 
  if (colorMap.get(mouseX, mouseY) == color(0, 255, 255) ||  colorMap.get(mouseX, mouseY) == color(45, 255, 254) ) {
    text("MUSEO MEXICANO DEL DISEÑO", 40, 55);
    noFill();
    stroke(50);
    ellipse(412, 370, 80, 80);
    fill(255, 0, 255);
    noStroke();
    rect(500, 100, 250, 150);
    fill(0);
    textSize(12);
    text("DIRECCIÓN: AV. FCO. I. MADERO 74, CENTRO, CUAUHTÉMOC, D.F.                    TELÉFONO: 55 10 86 09.              HORARIO: 8:00-21:00", 510, 120, 245, 145);
    image(foto2, 345, 100, 150, 100);
  }
  if (colorMap.get(mouseX, mouseY) == color(0, 255, 0) ||colorMap.get(mouseX, mouseY) == color(41, 253, 46) ) {
    text("BELLAS ARTES", 40, 55);
    noFill();
    stroke(50);
    ellipse(355, 305, 80, 80);
    fill(255, 0, 255);
    noStroke();
    rect(500, 100, 250, 150);
    fill(0);
    textSize(12);
    text("DIRECCIÓN: AV. HIDALGO 1, CENTRO, CUAUHTÉMOC, D.F.                       TELÉFONO: 55 12 25 93.                   HORARIO: 10:00-20:00", 510, 120, 245, 145);
    image(foto3, 345, 100, 150, 100);
  }
  if (colorMap.get(mouseX, mouseY) == color(244, 132, 183) || colorMap.get(mouseX, mouseY) == color(242, 134, 183) ) {
    text("LABORATORIO DE ARTE ALAMEDA", 40, 55);
    noFill();
    stroke(50);
    ellipse(239, 314, 80, 80);
    fill(255, 0, 255);
    noStroke();
    rect(500, 100, 250, 150);
    fill(0);
    textSize(12);
    text("DIRECCIÓN: DOCTOR MORA 7, CENTRO, CUAUHTÉMOC, D.F.                              TELÉFONO: 55 10 27 93.                             HORARIO: 9:00-17:00", 510, 120, 245, 145);
    image(foto4, 345, 100, 150, 100);
  }
  if (colorMap.get(mouseX, mouseY) == color(255, 255, 0) || colorMap.get(mouseX, mouseY) == color(255, 253, 56) ) {
    text("MUSEO DE ARTE CONTEMPORANEO MUAC", 18, 55);
    noFill();
    stroke(50);
    ellipse(18, 71, 80, 80);
    fill(255, 0, 255);
    noStroke();
    rect(500, 100, 250, 150);
    fill(0);
    textSize(12);
    text("DIRECCIÓN: INSURGENTES SUR 3000, CENTRO, COYOACÁN, D.F.                           TELÉFONO: 56 22 69 72.                               HORARIO: 10:00-18:00", 510, 120, 245, 145);
    image(foto5, 345, 100, 150, 100);
  }
  if (colorMap.get(mouseX, mouseY) == color(255, 0, 255) || colorMap.get(mouseX, mouseY) == color(252, 40, 252) ) {
    text("MUSEO DE ARTE MODERNO", 40, 55);
    noFill();
    stroke(50);
    ellipse(15, 589, 80, 80);
    fill(255, 0, 255);
    noStroke();
    rect(500, 100, 250, 150);
    fill(0);
    textSize(12);
    text("DIRECCIÓN: PASEO DE LA REFORMA Y GANDHI S/N, BOSQUE DE CHAPULTEPEC, D.F.                                               TELÉFONO: 55 53 62 33.                                      HORARIO: 10:00-17:00", 510, 120, 245, 145);
    image(foto6, 345, 100, 150, 100);
  }
  if (colorMap.get(mouseX, mouseY) == color(50, 4, 248) || colorMap.get(mouseX, mouseY) == color(52, 36, 244) ) {
    text("MUSEO FRANZ MAYER", 40, 55);
    noFill();
    stroke(50);
    ellipse(227, 277, 80, 80);
    fill(255, 0, 255);
    noStroke();
    rect(500, 100, 250, 150);
    fill(0);
    textSize(12);
    text("DIRECCIÓN: HIDALGO 45, CENTRO, CUAUHTÉMOC, D.F.                                       TELÉFONO: 55 18 22 66.                          HORARIO: 10:00-17:00", 510, 120, 245, 145);
    image(foto7, 345, 100, 150, 100);
  }
  if (colorMap.get(mouseX, mouseY) == color(248, 119, 4) || colorMap.get(mouseX, mouseY) == color(246, 119, 35) )  {
    text("MUSEO TAMAYO", 40, 55);
    noFill();
    stroke(50);
    ellipse(13, 382, 80, 80);
    fill(255, 0, 255);
    noStroke();
    rect(500, 100, 250, 150);
    fill(0);
    textSize(12);
    text("DIRECCIÓN: PASEO DE LA REFORMA 51, BOSQUE DE CHAPULTEPEC, MIGUEL HIDALGO, D.F.                                        TELÉFONO: 52 86 65 29.                            HORARIO: 10:00-18:00", 510, 120, 245, 145);
    image(foto8, 345, 100, 150, 100);
  }
  if (colorMap.get(mouseX, mouseY) == color(201, 129, 221) || colorMap.get(mouseX, mouseY) == color(200, 132, 219) ) {
    text("MUNAL", 40, 55);
    noFill();
    stroke(50);
    ellipse(461, 325, 80, 80);
    fill(255, 0, 255);
    noStroke();
    rect(500, 100, 250, 150);
    fill(0);
    textSize(12);
    text("DIRECCIÓN: TACUBA 8, CENTRO, CUAUHTÉMOC, D.F.                                TELÉFONO: 51 30 34 00.                           HORARIO: 10:00-17:00", 510, 120, 245, 145);
    image(foto9, 345, 100, 150, 100);
  }
  if (colorMap.get(mouseX, mouseY) == color(153, 57, 175) || colorMap.get(mouseX, mouseY) == color(152, 62, 173) ) {
    text("ANTIGUO COLEGIO DE SAN ILDEFONSO", 40, 55);
    noFill();
    stroke(50);
    ellipse(426, 392, 80, 80);
    fill(255, 0, 255);
    noStroke();
    rect(500, 100, 250, 150);
    fill(0);
    textSize(12);
    text("DIRECCIÓN: JUSTYO SIERRA 16, CENTRO, CUAUHTÉMOC, D.F.                           TELÉFONO: 57 02 29 91.                             HORARIO: 9:00-18:00", 510, 120, 245, 145);
    image(foto10, 345, 100, 150, 100);
  }
}



