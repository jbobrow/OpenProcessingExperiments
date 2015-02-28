
PImage imgFondo;
float rotacion;
float posx;
float posy;

// -----------------------------------------
// Método setup de la composición
// -----------------------------------------
void setup()
{
  size(600,600);
  background(255);
  smooth();
  imgFondo = loadImage("pensando.jpg");
  posx = width;
  image(imgFondo,0,0,650,600);
}

// -----------------------------------------
// Método setup de la composición
// -----------------------------------------
void draw()
{
  
  //noRotate();
  
  
  // URL de consulta del API de 43things
 
  String url43things = "http://www.43things.com/rss/goals/popular";

  // Objeto que lee la respuesta en XML
  XMLElement xml43things = new XMLElement(this,url43things);

  // Busco los elementos que necesito
  
  XMLElement[] xmlMetas = xml43things.getChildren("channel/item/title");

  // Extraigo la información del elemento que necesito y la dejo en variables
  int numero=(int)random(25);
  String titleId = xmlMetas[numero].getContent();
  
  
  
  posx = random(0, 600);
  posy = random(0, height);
  
  resetMatrix();
  translate(posx, posy);
  rotate(random(-PI/4,PI/6));
//imageMode(CENTER);
  text(titleId,0,0);
  
 
  PFont f = loadFont("CharcoalCY-30.vlw");
  fill(random(255),random(255),random(255));
  textFont(f,30);
  text(titleId,posx,posy);
 
 
 

 
 

  
  
 
}

