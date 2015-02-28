
public class Flags{
  
  PImage Argentinie;
  PImage Brazilie;
  PImage Engeland;
  PImage Italie;
  PImage Frankrijk;
  PImage Uruguay;
  PImage Duitsland;
  
  float x, y;
  
  public Flags(){
    
    Argentinie = loadImage("flags/Argentinie.png");
    Brazilie = loadImage("flags/Brazilie.png");
    Engeland = loadImage("flags/Engeland.png");
    Italie = loadImage("flags/Italie.png");
    Frankrijk = loadImage("flags/Frankrijk.png");
    Uruguay = loadImage("flags/Uruguay.PNG");
    Duitsland = loadImage("flags/Duitsland.png");
  }
  
  public void whatFlag(String i){
    if(i.equals("Brazilie") == true){
      image(Brazilie, x, y);
    } else if(i.equals("Argentinie") == true){
      image(Argentinie, x, y);
    } else if(i.equals("Engeland") == true){
      image(Engeland, x, y);
    } else if(i.equals("Italie") == true){
      image(Italie, x, y);
    } else if(i.equals("Frankrijk") == true){
      image(Frankrijk, x, y);
    } else if(i.equals("Uruguay") == true){
      image(Uruguay, x, y);
    } else if(i.equals("Duitsland") == true){
      image(Duitsland, x, y);
    } 
  }
}

