
Fotos foto;
Temperatura temp;
String ciudad;
int i, tamX, tamY, posX, posY;

void setup()
{
  size(600, 600);
  background(255);
  frameRate(25);
  tamX = (int)width/6;
  tamY = (int)height/6;
  posX = tamX/2;
  posY = tamY/2;
  
  ciudad = "São Carlos";  
  
  temp = new Temperatura();
}

void draw()
{
  foto = new Fotos(ciudad, posX, posY, tamX, tamY);
  foto.pintar();   
  
  if(posX < height)
  {
    posX = posX + tamX;
  }
  else{
    posX = tamX/2;
  }
  
  if((posY < width) && (posX == tamX/2))
  {     
    posY = posY + tamY;    
  }
  
  
  temp.escribir(); 
}
class Fotos
{
  XML xml;
  XML[] xmlImagenes;
  String url;
  String farm, server, secret, id, titulo, urlImagen;
  PImage imagen;
  int posX, posY, i, tamX, tamY;
  
  Fotos(String tag, int pX, int pY, int tX, int tY)
  {
    posX = pX;
    posY = pY;
    tamX = tX;
    tamY = tY;
    
    
    url = "http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=604d74ce214b614adf03cc617f40818e&tags="+tag+"&tag_mode=all&format=rest";
    xml = loadXML(url);
    XML[] xmlImagenes = xml.getChildren("photos/photo");
    
    i = (int)random(0, xmlImagenes.length);
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
    image(imagen, posX, posY, tamX, tamY);
  }
}
class Temperatura
{
  XML xml;
  XML[] xmlTemp;
  String url, temp, cod;
  //PFont fuente;
  int posX, posY, tam;
  
  
  Temperatura()
  {
    posX = width-80;
    posY = 80;
    tam = 40;    
    //fuente = loadFont("ACaslonPro-Semibold-40.vlw");
    
    cod = "456586";
    url = "http://weather.yahooapis.com/forecastrss?w="+cod+"&u=C";
    xml = loadXML(url);
    XML[] xmlTemp = xml.getChildren("channel/item/yweather:condition");
    //println(url);
    temp = xmlTemp[0].getString("temp");    
  }
  
  void escribir()
  {
    fill(0);
    textSize(40);
    //textFont(fuente, tam);
    text(temp+"º", posX, posY);
  }
}


