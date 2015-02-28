
float posX;
float posY;

void setup()
{
  size(600,600);
  background(0);
  smooth();
  

}


void draw()
{
  
  String url43things = "http://www.43things.com/rss/goals/popular";

  XMLElement xml43things = new XMLElement(this,url43things);

  XMLElement[] xmlMetas = xml43things.getChildren("channel/item/title");

  int num = (int) random (xmlMetas.length-1);
  
  String titulo = xmlMetas[num].getContent();
  
posX = posX + 3;

PFont f = loadFont ("letra.vlw");
textFont (f,50);
text (titulo,posX, posY);

posX = random(10, width);
posY = random(10, height); 


// Ir a flickr 
  
}

