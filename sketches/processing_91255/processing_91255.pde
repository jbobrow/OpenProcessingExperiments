
int breaker = 0;
int breakerF = 0;
int tengoWeather = 0;
int tamImagen = 75;
float posx = 0, posy = 0;
String globalTemp = "", globalTemperature = "";
int i=1,j = 1, jj = 1;

void setup()
{
  size(600,600);
  background(255);
  smooth();
  
  if (tengoWeather == 0)
  {
    PImage imagen;
    // URL de consulta del API de flickr
    String urlClima = "http://weather.yahooapis.com/forecastrss?w=368153&u=c";
  
    // Objeto que lee la respuesta en XML
    XMLElement xmlClima = new XMLElement(this,urlClima);
  
    // Busco los elementos que necesito
    XMLElement[] xmlCondition = xmlClima.getChildren("channel/item/yweather:condition");
    XMLElement[] xmlUnits = xmlClima.getChildren("channel/yweather:units");
  
    
    println(xmlCondition.length);
    globalTemp = xmlCondition[breaker].getString("temp");
    globalTemperature = xmlUnits[breaker].getString("temperature");
    
    tengoWeather = 1;
  }
}

void draw()
{
  //PFont f = loadFont("AdobeGothicStd-Bold-50.vlw");
  //textFont(f);
  fill(255,255,0);
  textSize(50);
  text(globalTemp + globalTemperature + "°", width-120, 50); 
  //Flicker Start
  PImage imagenF;
  // URL de consulta del API de flickr
  String urlFlickr = "http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=cacf445c6f446064dcddfa9b484d7188&tags=cartagena%2Ccolombia&tag_mode=all&text=cartagena&sort=relevance&per_page=500&format=rest";

  // Objeto que lee la respuesta en XML
  XMLElement xmlFlickr = new XMLElement(this,urlFlickr);

  // Busco los elementos que necesito
  XMLElement[] xmlImagenes = xmlFlickr.getChildren("photos/photo");
  
  // Extraigo la información del elemento que necesito y la dejo en variables
  String farmId = xmlImagenes[breakerF].getString("farm");
  String serverId = xmlImagenes[breakerF].getString("server");
  String secret = xmlImagenes[breakerF].getString("secret");
  String photoId = xmlImagenes[breakerF].getString("id");
  String titulo = xmlImagenes[breakerF].getString("title");

  // Construyo la URL para descargar la imagen
  String[] urlImagen = new String[xmlImagenes.length];
  urlImagen[breakerF] = "http://farm"+farmId+".staticflickr.com/"+serverId+"/"+photoId+"_"+secret+"_s.jpg";
  println(urlImagen[breakerF]);
  imagenF = loadImage(urlImagen[breakerF]);

  resetMatrix();
  image(imagenF, posx, posy);
  if (i/8 != 1)
  {
    posx = posx + tamImagen;
    i = i + 1;
  }
  else 
  {
    posx = 0;
    i = 1;
  }
  if (jj/8 != 1)
  {
    if (j/8 != 1)
    {
      j = j + 1;
    }
    else
    {
      posy = posy + tamImagen;
      j = 1;
      jj = jj + 1;
    }
  }
  else
  {
   jj = 1;
  }
  
  breakerF =  breakerF + 1;
  
  if (breakerF == xmlImagenes.length)
    breakerF = 0;   
  //Flicker End
    
  fill(0);
  textSize(50);
  text(globalTemp + globalTemperature + "°", width-120, 50);
  fill(255,255,0);
  text(globalTemp + globalTemperature + "°", width-123, 53);
}

