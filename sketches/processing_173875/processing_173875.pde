
Ball tennisball;
Ball fussball;
Ball fussball2;

void setup(){
  size(500,500);
  background(255);
  
  //Erzeugung der Objekte
  fussball = new Ball();
  fussball2 = new Ball();
  tennisball = new Ball(color(255,255,0), 30, 250, 300);
}

void draw()
{
    background(255);
    tennisball.bewegDich(2, 0);
    
    fussball.zeichne();
    fussball2.aenderePosition(100,100);
    fussball2.zeichne();
  
    tennisball.zeichne();
}

//**********************START DER KLASSE *******************

class Ball{
    
    color farbe;
    int groesse;
    int posX, posY;
    
    
    //Konstruktor der initialisiert die Objekteigenschaften
    Ball(){
      farbe = color(255,0,0);
      groesse = 50;
      posX = width/2;
      posY = height/2;
    }
    
    //Konstruktor mit eigenen Parametern
    Ball(color bFarbe, int bGroesse, int x, int y)
    {
      farbe = bFarbe;
      groesse = bGroesse;
      posX = x;
      posY = y;
    }
    
    //Setzt den Ball an eine andere Position
    void aenderePosition(int meinX, int meinY)
    {
      posX = meinX;
      posY = meinY;
    }
    
    //sorgt für eine Bewegung
    void bewegDich(int x, int y)
    {
        posX += x;
        posY = posY + y;
        
        zeichne();
        
        if(posX == width){
          posX = 0;
        }else if(posY == height)
        {
          posY = 0;
        }
    }
    
    //zeichnet unseren Ball
    void zeichne(){
     fill(farbe);
      ellipse(posX, posY, groesse, groesse);
    } 
}
