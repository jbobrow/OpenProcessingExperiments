
class Metas
{   
  int posX, posY, cantidad, i, tamano;
  XML[] XmlMetas;
  XML XmlContenido;
  String[] titulo;
  String url;
  PFont fuente;
  
  Metas()
  {
    posX = (int)random(5, width-20);
    posY = (int)random(5, height-20);
    fuente = loadFont("ACaslonPro-BoldItalic-30.vlw");
    
    url = "http://www.43things.com/rss/goals/popular";    
    XmlContenido = loadXML(url);   
    XmlMetas = XmlContenido.getChildren("channel/item/title");
    
    cantidad = (int)random(1, XmlMetas.length);
    titulo = new String[cantidad];
    
    i=0;
    while(i < cantidad)
    {
      titulo[i] = XmlMetas[i].getContent();
      i++;
    }
  }
  
  void escribir()
  {
    fill(255);
    for(int j=0; j<cantidad; j++)
    { 
      tamano = (int)random(15, 30);
      textFont(fuente, 20);
      text(titulo[j], posX, posY);
      posX = (int)random(5, width-30);
      posY = (int)random(5, height-30); 
    }
  }
}

