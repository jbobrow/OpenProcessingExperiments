
PImage imgBackground;
PImage imgIcons;

String url;
XMLElement xml;
XMLElement[] xmlImagenes;
String farm, server, secret, id, titulo, urlImagen;
PImage imagen;
int i, posX, posY;


void setup()
{
  size(600, 450);
  background(255);
  imgBackground = loadImage("solofondo.jpg");
  imgIcons = loadImage("soloiconos.png");
  drawBackground();
  drawIcons();
  
  //----------
  
}


void draw()
{
  
  noStroke();
}


void fotos(String tag)
{
  posX = width/2;
  posY = height/2;
  url = "http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=299409aec549bea23478a576bf09be4b&tags="+tag+"&format=rest";
  
  XMLElement xml = new XMLElement(this, url);
  xmlImagenes = xml.getChildren("photos/photo");
  i = (int)random(1, xmlImagenes.length);
  farm = xmlImagenes[i].getString("farm");
  server = xmlImagenes[i].getString("server");
  secret = xmlImagenes[i].getString("secret");
  id = xmlImagenes[i].getString("id");
  titulo = xmlImagenes[i].getString("title");
  
  urlImagen = "http://farm"+farm+".staticflickr.com/"+server+"/"+id+"_"+secret+".jpg";
  imagen = loadImage(urlImagen);
}

void pintar()
{   
  imageMode(CENTER);
  image(imagen, posX, posY);
}


void drawBackground()
{
  imageMode(CORNER);
  image(imgBackground, 0, 0);
}


void drawIcons()
{
  imageMode(CORNER);
  image(imgIcons, 0, 0);
}


void mouseClicked()
{
  drawBackground();
  if((mouseX > 20) && (mouseX < 93) && (mouseY > 382) && (mouseY < 450))
  {
    fotos("happy+smile");
    pintar();
  }
  
  if((mouseX > 102) && (mouseX < 165) && (mouseY > 382) && (mouseY < 450))
  {
    fotos("sad+face");
    pintar();
  }
  
  if((mouseX > 178) && (mouseX < 239) && (mouseY > 382) && (mouseY < 450))
  {
    fotos("love");
    pintar();
  }
  
  if((mouseX > 256) && (mouseX < 312) && (mouseY > 382) && (mouseY < 450))
  {
    fotos("jealousy,anger");
    pintar();
  }
  drawIcons();
}

