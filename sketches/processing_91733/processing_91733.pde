

float rotacion;
float posx1;
float posy1;
float posx2;
float posy2;
float posx3;
float posy3;
float posx4;
float posy4;



int crece;

// -----------------------------------------
// Método setup de la composición
// -----------------------------------------
void setup()
{
  size(600, 600);
  background(255);
  smooth();
  crece = 0;
  posx1=0;
  posy1=0;
  posx2=400;
  posy2=0;
  posx3=200;
  posy3=200;
  posx4=0;
  posy4=400;
  background (0);
}

// -----------------------------------------
// Método setup de la composición
// -----------------------------------------
void draw()
{

  // URL de consulta del API de flickr

  // imágenes de la luna
  String urlFlickr1 = "http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=270f057de87f30ceb8be8a5ab02eb13a&tags=luna&format=rest&api_sig=5a00c6f44ee56999bfcd9bbfd24c88e6";

  // galaxies
  String urlFlickr2 = "http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=270f057de87f30ceb8be8a5ab02eb13a&tags=galaxies&format=rest&api_sig=d0e64b0b7446c462cd78b4e11b3f3887";

  //astornomy
  String urlFlickr3 = "http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=270f057de87f30ceb8be8a5ab02eb13a&tags=astronomy&format=rest&api_sig=b8d18b6eb5b835a9d369ed9abcdcb3c7";

  //planets
  String urlFlickr4 = "http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=270f057de87f30ceb8be8a5ab02eb13a&tags=planets&format=rest&api_sig=8ab9621a9896de629d86d6169290a655";

  // Objeto que lee la respuesta en XML
  XMLElement xmlFlickr1 = new XMLElement(this, urlFlickr1);
  XMLElement xmlFlickr2 = new XMLElement(this, urlFlickr2);
  XMLElement xmlFlickr3 = new XMLElement(this, urlFlickr3);
  XMLElement xmlFlickr4 = new XMLElement(this, urlFlickr4);

  // Busco los elementos que necesito
  XMLElement[] xmlImagenes1 = xmlFlickr1.getChildren("photos/photo");
  XMLElement[] xmlImagenes2 = xmlFlickr2.getChildren("photos/photo");
  XMLElement[] xmlImagenes3 = xmlFlickr3.getChildren("photos/photo");
  XMLElement[] xmlImagenes4 = xmlFlickr4.getChildren("photos/photo");

  // Extraigo la información del elemento que necesito y la dejo en variables
  String farmId1 = xmlImagenes1[0+crece].getString("farm");
  String serverId1 = xmlImagenes1[0+crece].getString("server");
  String secret1 = xmlImagenes1[0+crece].getString("secret");
  String photoId1 = xmlImagenes1[0+crece].getString("id");
  String titulo1 = xmlImagenes1[0+crece].getString("title");

  String farmId2 = xmlImagenes2[0+crece].getString("farm");
  String serverId2 = xmlImagenes2[0+crece].getString("server");
  String secret2 = xmlImagenes2[0+crece].getString("secret");
  String photoId2 = xmlImagenes2[0+crece].getString("id");
  String titulo2 = xmlImagenes2[0+crece].getString("title");

  String farmId3 = xmlImagenes3[0+crece].getString("farm");
  String serverId3 = xmlImagenes3[0+crece].getString("server");
  String secret3 = xmlImagenes3[0+crece].getString("secret");
  String photoId3 = xmlImagenes3[0+crece].getString("id");
  String titulo3 = xmlImagenes3[0+crece].getString("title");

  String farmId4 = xmlImagenes4[0+crece].getString("farm");
  String serverId4 = xmlImagenes4[0+crece].getString("server");
  String secret4 = xmlImagenes4[0+crece].getString("secret");
  String photoId4 = xmlImagenes4[0+crece].getString("id");
  String titulo4 = xmlImagenes4[0+crece].getString("title"); 

  // Construyo la URL para descargar la imagen
  String urlImagen1 = "http://farm"+farmId1+".staticflickr.com/"+serverId1+"/"+photoId1+"_"+secret1+".jpg";
  String urlImagen2 = "http://farm"+farmId2+".staticflickr.com/"+serverId2+"/"+photoId2+"_"+secret2+".jpg";
  String urlImagen3 = "http://farm"+farmId3+".staticflickr.com/"+serverId3+"/"+photoId3+"_"+secret3+".jpg";
  String urlImagen4 = "http://farm"+farmId4+".staticflickr.com/"+serverId4+"/"+photoId4+"_"+secret4+".jpg"; 

  crece = crece+1;

  // Descargo la imagen de flickr según la url
  PImage imagen1 = loadImage(urlImagen1);
  PImage imagen2 = loadImage(urlImagen2);
  PImage imagen3 = loadImage(urlImagen3);
  PImage imagen4 = loadImage(urlImagen4);
  // Variables para describir el movimiento de las imágenes.



  // Pinto la imagen dando el efecto de desorden y superposición entre ellas

  //-------------------------------
  // cuadrante superior izquierdo//
  //--------------------------------
  imagen1.resize (100, 100);
  image (imagen1, posx1, posy1);

  posx1=posx1+100;

  if (posx1 == 200)
  {
    posx1 = 0;
    posy1=posy1+100;
  }

  if (posy1 == 200)
  {
    posy1 = 0;
  }

  if (crece == 99)
  {
    crece = 0;
  }

  //-------------------------------
  // cuadrante superior derecho//
  //--------------------------------

  imagen2.resize (200, 200);
  image (imagen2, posx2, posy2);


  //-------------------------------
  // imagen en el centro//
  //--------------------------------

  imagen3.resize (200, 200);
  image (imagen3, posx3, posy3);


  //-------------------------------
  // líneas bajas//
  //--------------------------------

  imagen4.resize (50, 50);
  image (imagen4, posx4, posy4);

  posx4=posx4+50;

  if (posx4 == width)
  {
    posx4 = 0;
    posy4=posy4+50;
  }

  if (posy4 == 600)
  {
    posy4 = 400;
  }

 
}


