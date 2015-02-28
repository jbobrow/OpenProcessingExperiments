
/* @pjs preload="Explicativo.png, colormap2.png, mapmalasananoyo.png, noyo.png, portada2.png"; 
 */



PImage mapa, colormap, portada, Explicativo, noyo, ex;
float xCentro, yCentro;
float xDestino, yDestino;

//noyo©
void setup() {
  size(600, 500);
  mapa = loadImage("mapmalasananoyo.png");
  colormap = loadImage("colormap2.png");
  portada = loadImage("portada2.png");
  noyo = loadImage("noyo.png");
  //ex = loadImage("Explicativo.png");
  //colormap = loadImage("colormap-madrid.png");
}

void draw() {
  background(0);
  noStroke();
  
  
  pushMatrix();
  translate(xCentro, yCentro);
  tint(255);
  image(mapa, 0, 0); 
  //image(portada, 0, 0);
  //tint(255, 50);
  //image(colormap, 0, 0);
  popMatrix();
  
//  pushMatrix();
//  if (width <= 600) {
//    image(portada, 0, 0);
//  }
//  
//  popMatrix();
  
  
  
  //Portada
  //image(portada, 0, 0);

  // Easing para el mapa
  xCentro = xCentro + (xDestino-xCentro)*0.05;
  yCentro = yCentro + (yDestino-yCentro)*0.05;
  
  
  //colores
  color c = colormap.get(floor(mouseX-xCentro), floor(mouseY-yCentro));
  //portada
  if (c == color(255, 153, 102)) {
    image(portada, 0, 0);
  }
  //ficha1
  if (c == color(255, 238, 76)) {
    ficha1();
  }
  //ficha2
  if (c == color(57, 230, 94)) {
    ficha2();
  }
  //ficha3
  if (c == color(64, 84, 255)) {
    ficha3();
  }
  //ficha4
  if (c == color(230, 69, 212)) {
    ficha4();
  }
  //ficha5
  if (c == color(255, 241, 112)) {
    ficha5();
  }
  //ficha6
  if (c == color(255, 173, 133)) {
    ficha6();
  }
  //ficha7
  if (c == color(235, 106, 221)) {
    ficha7();
  }
  //ficha8
  if (c == color(97, 235, 126)) {
    ficha8();
  }
  //ficha9
  if (c == color(102, 118, 255)) {
    ficha9();
  }
  //ficha10
  if (c == color(255, 194, 163)) {
    ficha10();
  }
}

//ficha1
void ficha1() {
  fill(208, 62, 133, 200);
  rect(width/2, 10, width/2-10, height-20);
  fill(0);
  textAlign(CENTER);
  text("GRAPHIC BOOK", width/2+10, 20, width/2-20, height-20);
  text("Calle Libreros 3, 28004, Madrid", width/2+10, 50, width/2-20, height-40);
  textAlign(LEFT);
  text("En la librería Graphic Book encontrarás libros de diseño, ilustración, fotografía, moda, interiorismo, arte urbano y literatura ilustrada.", width/2+10, 100, width/2-20, height-40);
  textAlign(CENTER);
  text("Haz click para ir al siguiente punto.", width/2+10, 400, width/2-20, height-40);
}

//ficha2
void ficha2() {
  fill(208, 141, 73, 200);
  rect(width/2, 10, width/2-10, height-20);
  fill(0);
  textAlign(CENTER);
  text("DOSDE MARKET", width/2+10, 20, width/2-20, height-20);
  text("Plaza 2 de Mayo, 28004, Madrid", width/2+10, 50, width/2-20, height-40);
  textAlign(LEFT);
  text("Este mercado de diseño se une al de las Artes y el Coleccionismo que desde hace años se viene desarrollando los sábados en el mismo emplazamiento, constituyéndose como una sección del mismo. Conjuntamente, se pretende dinamizar comercialmente el área, dando prioridad a la participación en el mismo a las tiendas del barrio.", width/2+10, 100, width/2-20, height-40);
  textAlign(CENTER);
  text("Haz click para ir al siguiente punto.", width/2+10, 400, width/2-20, height-40);
}

//ficha3
void ficha3() {
  fill(95, 186, 151, 200);
  rect(width/2, 10, width/2-10, height-20);
  fill(0);
  textAlign(CENTER);
  text("LA INDUSTRIAL", width/2+10, 20, width/2-20, height-20);
  text("Calle de San Andrés 8, 28004, Madrid", width/2+10, 50, width/2-20, height-40);
  textAlign(LEFT);
  text("La Industrial es un espacio para trabajar, compartir inquietudes e ideas y sobre todo el sitio donde podrás conectar con otras personas con las que desarrollar nuevos proyectos y negocios. Espacio de coworking en Madrid, Cursos y Eventos.", width/2+10, 100, width/2-20, height-40);
  textAlign(CENTER);
  text("Haz click para ir al siguiente punto.", width/2+10, 400, width/2-20, height-40);
}

//ficha4
void ficha4() {
  fill(73, 74, 153, 200);
  rect(width/2, 10, width/2-10, height-20);
  fill(0);
  textAlign(CENTER);
  text("INFOPRINT", width/2+10, 20, width/2-20, height-20);
  text("Calle de San Andrés 3, 28004, Madrid", width/2+10, 50, width/2-20, height-40);
  textAlign(LEFT);
  text("Disponen tanto de maquinaria de impresión offset para tiradas grandes y de calidad, como de maquinaria digital para tiradas cortas. Tienen dos tipos de producto; El producto realizado a medida del cliente con los requerimientos solicitados exactos, y por otro lado las denominadas ofertas que son productos estándar en calidad y cantidad que rebajan los precios al aunar muchos pedidos similares y repartir los costos de arranque y producción entre varios clientes, sin disminuir la calidad.", width/2+10, 100, width/2-20, height-40);
  textAlign(CENTER);
  text("Haz click para ir al siguiente punto.", width/2+10, 400, width/2-20, height-40);
}

//ficha5
void ficha5() {
  fill(73, 74, 153, 200);
  rect(width/2, 10, width/2-10, height-20);
  fill(0);
  textAlign(CENTER);
  text("LA RIVA", width/2+10, 20, width/2-20, height-20);
  text("Plaza de San Ildefonso 4 - 5, 28004, Madrid", width/2+10, 50, width/2-20, height-40);
  textAlign(LEFT);
  text("Empresa familiar fundada en el año 1.926. Desde ese momento están vinculados al mundo del Papel y de las Bellas Artes. Su constante, desde aquellos tiempos, ha sido la de intentar ofrecer la mas amplia gama de Papeles Especiales del mercado español.", width/2+10, 100, width/2-20, height-40);
  textAlign(CENTER);
  text("Haz click para ir al siguiente punto.", width/2+10, 400, width/2-20, height-40);
}

//ficha6
void ficha6() {
  fill(208, 141, 73, 200);
  rect(width/2, 10, width/2-10, height-20);
  fill(0);
  textAlign(CENTER);
  text("CAJA BAJA", width/2+10, 20, width/2-20, height-20);
  text("Calle de Valverde 35, 28004, Madrid", width/2+10, 50, width/2-20, height-40);
  textAlign(LEFT);
  text("Estudio de diseño gráfico, web y maquetación que convive con una pequeña papelería, tienda de impresiones digitales, fotocopias y serigrafía.", width/2+10, 100, width/2-20, height-40);
  textAlign(CENTER);
  text("Haz click para ir al siguiente punto.", width/2+10, 400, width/2-20, height-40);
}

//ficha7
void ficha7() {
  fill(208, 62, 133, 200);
  rect(width/2, 10, width/2-10, height-20);
  fill(0);
  textAlign(CENTER);
  text("PANTA RHEI", width/2+10, 20, width/2-20, height-20);
  text("Calle Hernán Cortés 7, 28004, Madrid", width/2+10, 50, width/2-20, height-40);
  textAlign(LEFT);
  text("Librería dedicada a las artes visuales con énfasis en la cultura contemporánea en donde encontrar libros de diseño gráfico, digital, de publicidad, lo último en catálogos de exposiciones de los artistas más punteros, libros de moda, ediciones especiales, y literatura infantil ilustrada junto con una galería especializada en dibujo e ilustración.", width/2+10, 100, width/2-20, height-40);
  textAlign(CENTER);
  text("Haz click para ir al siguiente punto.", width/2+10, 400, width/2-20, height-40);
}

//ficha8
void ficha8() {
  fill(208, 141, 73, 200);
  rect(width/2, 10, width/2-10, height-20);
  fill(0);
  textAlign(CENTER);
  text("TIPOS INFAMES", width/2+10, 20, width/2-20, height-20);
  text("Calle San Joaquín 3, 28004 Madrid", width/2+10, 50, width/2-20, height-40);
  textAlign(LEFT);
  text("Tipos Infames es una librería especializada en narrativa literaria de carácter independiente. En la creencia de que es necesario redefinir el concepto tradicional de librería para adaptarlo a los nuevos tiempos, desde Tipos Infames hemos intentado diversificar la actividad articulando un espacio dinámico y abierto a la cultura. Para ello nuestro local cuenta con diferentes ámbitos en los que desarrollar sus actividades: librería, cafetería, enoteca, sala de exposiciones…", width/2+10, 100, width/2-20, height-40);
  textAlign(CENTER);
  text("Haz click para ir al siguiente punto.", width/2+10, 400, width/2-20, height-40);
}

//ficha9
void ficha9() {
  fill(95, 186, 151, 200);
  rect(width/2, 10, width/2-10, height-20);
  fill(0);
  textAlign(CENTER);
  text("DCOLAB", width/2+10, 20, width/2-20, height-20);
  text("Calle San Joaquín 2, 28004, Madrid", width/2+10, 50, width/2-20, height-40);
  textAlign(LEFT);
  text("Happy Coworking. Un inspirador espacio de trabajo donde compartir puestos de trabajo, sala de reuniones y sinergías con otros profesionales.", width/2+10, 100, width/2-20, height-40);
  textAlign(CENTER);
  text("Haz click para ir al siguiente punto.", width/2+10, 400, width/2-20, height-40);
}

//ficha10
void ficha10() {
  fill(175, 183, 82, 200);
  rect(width/2, 10, width/2-10, height-20);
  fill(0);
  textAlign(CENTER);
  text("AULA CREACTIVA", width/2+10, 20, width/2-20, height-20);
  text("Calle de Mejía Lequerica 12, 28004 Madrid", width/2+10, 50, width/2-20, height-40);
  textAlign(LEFT);
  text("Escuela de creativos. Desde 2002 ayudan a jóvenes como tú a encontrar su primer empleo en agencias de publicidad y estudios de diseño gráfico. En Aula Creactiva encontrarás la formación 100 x 100 práctica que necesitas para completar tus conocimientos y acceder con plenas garantías al mercado profesional.", width/2+10, 100, width/2-20, height-40);
  textAlign(CENTER);
  text("Haz click para ir al siguiente punto.", width/2+10, 400, width/2-20, height-40);
}


//noyo© 


//click
void mouseReleased() {
  color c = colormap.get(floor(mouseX-xCentro), floor(mouseY-yCentro));
  //portada
  if (c == color(255, 153, 102)) {
    xDestino = -680;
    yDestino = -850;
  }
  //1
  if (c == color(255, 238, 76)) {
    xDestino = -900;
    yDestino = -330;
  }
  //2
  if (c == color(57, 230, 94)) {
    xDestino = -930;
    yDestino = -400;
  }
  //3
  if (c == color(64, 84, 255)) {
    xDestino = -920;
    yDestino = -420;
  }
  //4
  if (c == color(230, 69, 212)) {
    xDestino = -1060;
    yDestino = -590;
  }
  //5
  if (c == color(255, 241, 112)) {
    xDestino = -1160;
    yDestino = -710;
  }
  //6
  if (c == color(255, 173, 133)) {
    xDestino = -1270;
    yDestino = -660;
  }
  //7
  if (c == color(235, 106, 221)) {
    xDestino = -1190;
    yDestino = -560;
  }
   //8
  if (c == color(97, 235, 126)) {
    xDestino = -1220;
    yDestino = -460;
  }
  //9
  if (c == color(102, 118, 255)) {
    xDestino = -1420;
    yDestino = -260;
  }
  //10
  if (c == color(255, 194, 163)) {
    xDestino = -1770;
    yDestino = -1110;
  }
//  if (c == color(47, 62, 204)) {
//    xDestino = -600;
//    yDestino = -400;
//  }
  
}

//MOVIMIENTO
void mouseDragged() {
  xDestino = xDestino + mouseX - pmouseX;
  yDestino = yDestino + mouseY - pmouseY;
  if (xDestino > 0) {
    xDestino = 0;
  }
  if (yDestino > 0) {
    yDestino = 0;
  }
  if (xDestino < -mapa.width+width) {
    xDestino = -mapa.width+width;
  }
  if (yDestino < -mapa.height+height) {
    yDestino = -mapa.height+height;
  }
}



//noyo©


