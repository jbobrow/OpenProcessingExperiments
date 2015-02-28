
/* @pjs preload="AntiguoPalacio.jpg, Catedral.jpg, MuseoMexico.jpg, ccem.jpg, colormap.jpg, colormap2.png, df.jpg, estanquillo.jpg, fotografia.jpg, galeriashcp.jpg, mapa.jpg, mumedi.jpg, palacioi.jpg"; 
 */

PImage img, img2, img3, img4, img5, img6, img7, img8, img9, img10, img11, colorMap, colorMap2;
void setup() { 
  img = loadImage("mapa.jpg");
  colorMap = loadImage("colormap.jpg");
  colorMap2 = loadImage("colormap2.png");
  img2 = loadImage("palacioi.jpg");
  img3 = loadImage("estanquillo.jpg");
  img4 = loadImage("mumedi.jpg");
  img5 = loadImage("AntiguoPalacio.jpg");
  img6 = loadImage("MuseoMexico.jpg");
  img7 = loadImage("Catedral.jpg");
  img8 = loadImage("galeriashcp.jpg");
  img9 = loadImage("ccem.jpg");
  img10 = loadImage("fotografia.jpg");
  img11 = loadImage("df.jpg");
  size(820, 573);
}

void draw() {
  background(img);
  image(colorMap2, 0, 0);

  fill(255, 200); 
  noStroke(); 
  rect(0, 0, 450, 400);
  fill(0);
  textSize(15);
  color c = colorMap.get(mouseX, mouseY);
  println(red(c)+" "+green(c)+" "+blue(c));
  if (colorMap.get(mouseX, mouseY) == color(0, 0, 254)) { 
    image(img2, 500, 100, 400, 200);
    text("Palacio de Iturbide", 40, 55);
    text("El Palacio de Iturbide es un edificio localizado en el Centro Histórico de la Ciudad de México, construido con una combinación de cantera y el tezontle. Fue la única residencia palaciega del siglo XVIII que fue construida en cuatro niveles durante el México colonial.", 40, 100, 400, 400);
  } 

  if (colorMap.get(mouseX, mouseY) == color(255, 255, 1)) {
    image(img3, 500, 100, 400, 200);
    text("Museo del Estanquillo", 40, 55);
    text("Fue fundado en 2006 a partir del deseo de Monsiváis de compartir su colección integrada por más de 20,000 piezas, entre ellas documentos históricos, pinturas, fotografías, dibujos, grabados, miniaturas y maquetas. De la diversidad de estas colecciones surge el nombre del museo, que establece una analogía con los pequeños comercios, que en el México de los siglos XIX y primera mitad del XX se conocían como “estanquillos”, en los que era posible adquirir prácticamente todo tipo de mercancías.", 40, 100, 400, 400);
  }
  if (colorMap.get(mouseX, mouseY) == color(0, 255, 1)) {
    image(img4, 600, 100, 400, 200);
    text("MUMEDI", 40, 55);
    text("El Museo Mexicano de Diseño fue hecho para darle al diseño mexicano el espacio que se merece. La casa que alberga al también llamado Mumedi fue construida sobre el palacio de Hernán Cortés. Su fachada actual fue diseñada a final del siglo XVIII por un discípulo de Manuel Tolsá (arquitecto con obras como el Palacio de Minería y el Museo Nacional de San Carlos).", 40, 100, 400, 400);
  }
  if (colorMap.get(mouseX, mouseY) == color(254, 0, 0)) {
    image(img5, 500, 100, 400, 200);
    text("Antiguo Palacio del Ayuntamiento", 40, 55);
    text("Es la sede del Gobierno del Distrito Federal, poder ejecutivo local del Distrito Federal de México. En ella tiene su despacho el Jefe de Gobierno y las principales jefaturas de la administración capitalina. Dentro alberga patrimonio histórico como el Salón de Cabildos y el Centro de Documentación Francisco Gamoneda. En el sesionó el primer ayuntamiento de la ciudad el 10 de mayo de 1524.", 40, 100, 400, 400);
  }
  if (colorMap.get(mouseX, mouseY) == color(204, 0, 175)) {
    image(img6, 500, 100, 400, 200);
    text("Museo de la Ciudad de México", 40, 55);
    text("Es un recinto público ubicado en el antiguo Palacio de los Condes de Santiago de Calimaya, sobre la avenida Pino Suárez número 30, a dos cuadras de la Plaza de la Constitución (Zócalo). El museo es un hermoso palacio virreinal cuya construcción se remonta a 1536. Desde entonces el edificio ha sido remodelado y modificado en muchas ocasiones, tanto en su aspecto como en su funcionamiento, habiendo servido desde palacio de nobles familias hasta vecindad.", 40, 100, 400, 400);
  }
  if (colorMap.get(mouseX, mouseY) == color(1, 255, 255)) {
    image(img7, 500, 100, 400, 200);
    text("Catedral Metropolitana de México", 40, 55);
    text("Es la sede de la Arquidiócesis Primada de México y se ubica frente a la Plaza de la Constitución, en el Centro Histórico de la Ciudad de México. Las medidas aproximadas de este templo son 59 metros de ancho por 128 de largo y una altura de 60 metros hasta la cúpula.1 Es también una de las obras más sobresalientes del arte hispanoamericano.2 Construida con cantera gris, cuenta con cinco naves y 16 capillas laterales. Está dedicada a la Asunción de la Virgen María.", 40, 100, 400, 400);
  }
  if (colorMap.get(mouseX, mouseY) == color(0, 157, 0)) {
    image(img8, 500, 100, 400, 200);
    text("Galería de la SHCP", 40, 55);
    text("La Galería de la Secretaría de Hacienda y Crédito Público está ubicada en la planta baja de una construcción de estilo neoclásico de principios del siglo XIX. Este espacio está destinado principalmente a la exposición de obras de jóvenes creadores, por lo que es un lugar obligado para el conocimiento de la plástica representativa del México contemporáneo.", 40, 100, 400, 400);
  }  
  if (colorMap.get(mouseX, mouseY) == color(241, 138, 1)) {
    image(img9, 500, 100, 400, 200);
    text("Centro Cultural de España", 40, 55);
    text("El Centro Cultural de España en México (CCEMx) es un espacio cultural que, ubicado en el corazón del Centro Histórico de la Ciudad de México, forma parte de la Red de Centros Culturales de la Agencia Española de Cooperación Internacional para el Desarrollo (AECID). Todas sus actividades son abiertas y gratuitas. Se trata de un espacio cultural multidisciplinario que ofrece actividades en ocho diferentes formatos: cine; música; formación (a través de talleres y conferencias); artes en vivo; humanidades y literatura; actividades infantiles; arte, ciencia, tecnología y sociedad; exposiciones.", 40, 100, 400, 400);
  } 
  if (colorMap.get(mouseX, mouseY) == color(255, 0, 255)) {
    image(img10, 500, 100, 400, 200);
    text("Museo Archivo de la Fotografía", 40, 55);
    text("La llamada Casa de las Ajaracas, un inmueble de finales del siglo XVI, a lo largo de su historia ha sufrido un grave deterioro que provocó incluso la demolición de una parte de la fachada. El Museo Archivo de la Fotografía, en el cual se concentra más de dos millones de imágenes que dan cuenta de la labor realizada por las autoridades locales para dotar de infraestructura y servicios públicos a la capital. Este espacio da cabida para el montaje de distintas exposiciones temporales.", 40, 100, 400, 400);
  }
  if (colorMap.get(mouseX, mouseY) == color(174, 0, 255)) {
    image(img11, 500, 100, 400, 200);
    text("Archivo Histórico del Distrito Federal", 40, 55);
    text("Uno de los acervos documentales más importantes de México porque contiene gran parte de la historia de la capital, desde 1524 hasta 1928 fecha en que se da un parteaguas en la ciudad porque desaparece el Ayuntamiento de la Ciudad de México y nace el Departamento del Distrito Federal. Incluye 5 mil 486 volúmenes que fueron recopilados por nuestros antepasados, donde se puede consultar la evolución y crecimiento de la ciudad y un Catálogo electrónico que contiene alrededor de 212 mil fichas.", 40, 100, 400, 400);
  }
}  



