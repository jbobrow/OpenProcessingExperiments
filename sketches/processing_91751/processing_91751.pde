
float posx;
float posy;
float rotacion;
float pox;
float poy;



int indice;
PFont fuente;

void setup()
{
  size(850, 200);
  background(255);
  fuente=loadFont("OCRAStd-36.vlw");
  

}

void draw()
{
  String url43Things = "http://www.43things.com/rss/goals/popular";
  XMLElement xml43Things = new XMLElement(this, url43Things);
  XMLElement[] xmltitulo= xml43Things.getChildren("channel/item/title");
  int numero= (int) random (40); 
  String titleId = xmltitulo[numero].getContent();
  String tag=titleId;


  String urlFlickr = "http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=77611ee977d5f014c96825d3b98f3bba&tags="+tag+"&per_page=40&format=rest";
  XMLElement xmlFlickr = new XMLElement(this, urlFlickr);
  XMLElement[] xmlImagenes = xmlFlickr.getChildren("photos/photo");

  String farmId = xmlImagenes[numero].getString("farm");
  String serverId = xmlImagenes[numero].getString("server");
  String secret = xmlImagenes[numero].getString("secret");
  String photoId = xmlImagenes[numero].getString("id");
  String titulo = xmlImagenes[numero].getString("title");
  String urlImagen = "http://farm"+farmId+".staticflickr.com/"+serverId+"/"+photoId+"_"+secret+".jpg";



  PImage imagen = loadImage(urlImagen);
  smooth();
  image(imagen, 0, 0, 500, 500);
   
  filter(BLUR, 4);
  filter(INVERT);

   pox= 40;
  poy= random(40,150);


  noStroke();
  fill(0, 70);
  rect(0, 0, 850, 300);


  fill(255);
  textFont(fuente, 36);
  text(titleId, pox, poy);
  
  
  

}


