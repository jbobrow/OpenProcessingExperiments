
/**
 * La siguiente composición busca las imágenes que se están subiendo a flickr
 * y las pinta. "The world of images"
 * Autor: Camilo Jiménez - Twitter: @camilji
 */

// -----------------------------------------
// Variables de la composición
// -----------------------------------------
float rotacion;
float posx;
float posy;
PImage fondo;
PFont fuente;

// -----------------------------------------
// Método setup de la composición
// -----------------------------------------
void setup()
{
  size(800, 400);
  background(255);
  smooth();
  frameRate(0.5);

  posx = 40;
  posy = 200;

  fondo = loadImage("fondo.jpg");
  fuente = loadFont("AmericanTypewriter-CondensedBold-48.vlw");
  
  textFont(fuente, 25);
  text("Este año podría...", 40, 75);
}

// -----------------------------------------
// Método setup de la composición
// -----------------------------------------
void draw()
{
  image(fondo, 0, 0);
  

    // URL de consulta del API de flickr
    String url43things = "http://es.43things.com/rss/goals/all";
  
    // Objeto que lee la respuesta en XML
    XMLElement xml43things = new XMLElement(this, url43things);
  
    // Busco los elementos que necesito
    XMLElement[] xmlTitulos = xml43things.getChildren("channel/item/title");
  
    // Extraigo la información del elemento que necesito y la dejo en variables
  
    int i = int(random(xmlTitulos.length));
  
    String titulo = xmlTitulos[i].getContent();
    println(titulo);

  // Escribir texto
  fill(random(200),random(200),random(200));
  textFont(fuente, 25);
  text(titulo, posx, posy);
  
  fill(0);
  textFont(fuente, 40);
  text("Este año podría...", 40, 75);
}


