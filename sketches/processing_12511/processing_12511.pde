
void setup()
{
  size(500, 500);
  smooth();
}

void draw()
{
  background(0);
  Ciclo co = new Ciclo("ea", 9, 1);
}

class Ciclo
{
  //w è l'iniziatore
  String w = "";
  //Queste sono le variabili coinvolte nelle trasformazioni.
  //Le pNa sono cio che è, le pNb ciò che sarà.
  String p1a = "a", p1b = "eb";
  String p2a = "e", p2b = "da";
  String p3a = "b", p3b = "a";
  String p4a = "d", p4b = "e";
  //g0 è la generazione attuale, g1 è la generazione futura.
  String g0, g1 = "";
  int n, l;
  //Variabili per il disegno:
  int posX, posY; float posG;
  int lung; float grad;
  
  Ciclo(String _w, int _n, int _l)
  {
    w = _w; n = _n; l = _l;
    //La prima generazione in assoluto consiste nel solo iniziatore w.
    g0 = w;
    posX = mouseX; //width / 2;
    posY = height / 2;
    posG = 0;
    
    //Il ciclo si ripete per il numero di generazioni desiderato, indicato dalla variabile n.
    for (int i= 0; i < n; i++)
    {
      lung = 15; //int(map(abs(mouseX - (width / 2)), 0, width / 2, 10, 50));
      grad = map(mouseY, 0, height, 125, 55);
      //Prima si definisce il sistema attraverso le stringhe.
      stringa();
    }
  }
  
  private void stringa()
  {
    //La generazione attuale g0 viene esaminata in tutta la sua lunghezza.
    //l rappresenta il numero di lettere da esaminare alla volta, è pari a 1 se si desidera 
    //un'analisi lettera per lettera, pari a 2 per esaminare coppie di lettere e così via.
    for (int i = 0; i <= g0.length() - l; i = i + l)
    {
      //Si crea il segmento da comparare, questo parte dal punto in cui si è arrivati nella
      //stringa (i) al punto definito dalla lunghezza del segmento desiderato (i + l).
      String c = g0.substring(i, i + l);
      //Qui avvengono le trasformazioni in base alle variabili pN* per creare la nuova generazione.
      if (c.equals(p1a) == true)
      {
        g1 = g1 + p1b;
        linea(lung, true, grad);
      }
      else if (c.equals(p2a) == true)
      {
        g1 = g1 + p2b;
        linea(lung, true, grad);
      }
      else if (c.equals(p3a) == true)
      {
        g1 = g1 + p3b;
        linea(lung, false, grad);
      }
      else if (c.equals(p4a) == true)
      {
        g1 = g1 + p4b;
        linea(lung, false, grad);
      }
    }
    //println(g0);
    //La nuova generazione diventa la vecchia, e si azzera g1 per poter ricominciare il ciclo.
    g0 = g1;
    g1 = "";
  }
  
  private void linea(int lunghezza, boolean destra, float gradi)
  {
    if (destra == false)
    {
      gradi = 360 - gradi;
    }
    float nposG = posG + gradi;
    int nposX = posX + int((cos(radians(nposG))) * lunghezza);
    int nposY = posY + int((sin(radians(nposG))) * lunghezza);
    stroke(0x80558877); strokeWeight(6);
    line(posX, posY, nposX, nposY);
    posX = nposX;
    posY = nposY;
    posG = nposG;
  }
}

