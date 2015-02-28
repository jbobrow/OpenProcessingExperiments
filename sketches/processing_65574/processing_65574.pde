
/* ---
  
  TDA che definisce un oggetto "Bubble". 
  Setta un valore di posizione casuale.
  Dimensione massima e tinta hanno valore casuale entro un range specifico.
  Le bolle aumentano di dimensione e, a partire da una certa dimensione, diventano sempre più trasparenti,
  fino a scomparire.
 
   --- */
   
class Bubble {
  private float posX, posY, growRate, hue;
  private int dimension, saturation, brightness, opacity;
  private color col;
  private final float MAX_DIMENSION;
  
  //Costruttore dell'oggetto "Bubble"
  public Bubble() {
    posX = random(0, width);
    posY = random(0, height);
    dimension = 0;
    MAX_DIMENSION = random(80, 200);
    growRate = 2;
    opacity = 130;
    hue = random(40, 60);
    saturation = 89;
    brightness = 100;
    col = color(hue, saturation, brightness, opacity);
  }
  
  //Costruttore dell'oggetto "Bubble" con parametri formali per il posizionamento
  public Bubble(float x, float y) {
    posX = x;
    posY = y;
    dimension = 0;
    MAX_DIMENSION = 160;
    growRate = 2;
    opacity = 120;
    hue = 15;
    saturation = 89;
    brightness = 100;
    col = color(hue, saturation, brightness, opacity);
  }
  
  //Procedura che incrementa le dimensioni dell'oggetto
  public void grow() {
    dimension+=growRate;
  }
  
  //Funzione che controlla le dimensioni dell'oggetto "Bubble": se sono nel range di valori
  //rende l'oggetto più trasparente. Se eccedono il valore limite restituisce "false".
  public boolean growCheck() {
    if (dimension>100 && dimension<150) {
      opacity-=5;
      col = color(hue, saturation, brightness, opacity);
      return true;
    }
    if (dimension>MAX_DIMENSION) {
      return false;
    }
    return true;
  } 
  
  //Procedura che traccia l'oggetto "Bubble"
  public void display() {
    fill(col);
    stroke(hue, saturation, brightness, opacity);
    strokeWeight(1);
    ellipse(posX, posY, dimension, dimension);
  }
}

