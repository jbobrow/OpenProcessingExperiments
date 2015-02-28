
Menu knopf1, knopf2, schrift1, schrift2;

int modus = 0;


void setup()
{
  size(500, 500);
  smooth();
  knopf1 = new Menu();
  knopf2 = new Menu();
  schrift1 = new Menu();
  schrift2 = new Menu();
}


void draw()
{
  background(255);
  if(modus == 0) // Hauptmenu
  {
    schrift1.derText("Das Spiel", width/2 - 30, 20);
    
    if(knopf1.over()) modus = 1;
    knopf1.zeigen(150, 150); 
  }
  if(modus == 1) // Mit der Maus
 {
   
    knopf2.zeigen(width/2, height/2);
 }
 
   
}



class Menu
{
  float xeck, yeck, xball, yball, breite, farbe;
  
  Menu()
  {
    farbe = 255;
    
  }
  
  void zeigen(float xpos, float ypos)
  {
    breite = 20;
    xball = xpos;
    yball = ypos;
    xeck = xball - breite/2;
    yeck = yball - breite/2;
    fill(255);
    rect(xeck, yeck, breite, breite);
    fill(farbe);
    ellipse(xball, yball, breite- 2, breite- 2);
  }
  
  boolean over()
  {
    if(mouseX > xeck && mouseX < xeck + breite && mouseY > yeck && mouseY < yeck + breite && mousePressed && mouseButton == LEFT)
    {
      farbe = 0;
      return true;
    }
    else
    {
      farbe = 255;
      return false;
    }
  }
  
  
  void derText(String wort, float xpos, float ypos)
  {
    fill(0);
    text(wort, xpos, ypos);
  }
  
  
  
  
  
}

    

