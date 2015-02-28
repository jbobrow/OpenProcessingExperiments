

float CrMin = -2;    // limite sinistro di C
float CrMax = 1;     // limite destro di C
float CiMin = -1.5;  // limite inferiore di C
float CiMax = 1.5;   // limite superiore di C

int maxCicli = 300;  // numero massimo di cicli da considerare

float Zr;            // valore reale di Z
float Zi;            // valore immaginario di Z
float Cr;            // valore reale di C
float Ci;            // valore immaginario di C

float passoX;        // passo orizzontale del pixel
float passoY;        // passo verticale dei pixel

void setup()
{
  size(600,600);
  passoX = (CrMax-CrMin) / width;   // passo orizzontale del pixel
  passoY = (CiMax-CiMin) / height;  // passo verticale dei pixel

  noLoop();
  background(0);
}

void draw() 
{
  loadPixels();

  for (int y=0;  y < height;  ++y) {  // Considera tutte le righe di pixel
    Ci = CiMin + y*passoY;            // Ricava il valore immaginario di C da analizzare
    
    for (int x=0;  x < width;  ++x) {   // Considera tutti i pixel di ogni riga
      Cr = CrMin + x*passoX;            // Ricava il valore reale di C da analizzare

      Zr = 0;          // Azzera valori reale e immaginario di Z
      Zi = 0;
      float ZrZr = 0;  // Azzera i valori di Z elevati al quadrato
      float ZiZi = 0;

      int ciclo;
      for (ciclo=0;  ciclo < maxCicli;  ++ciclo) {  // Esegui fino a maxCicli cicli di analisi

        Zi = Zr * Zi * 2 + Ci;  // Calcola i nuovi valori immaginario e reale di Z 
        Zr = ZrZr - ZiZi + Cr;  // [vedi: en.wikipedia.org/wiki/Mandelbrot_set]       
        ZrZr = Zr * Zr;         // Eleva al quadrato i valori di Z
        ZiZi = Zi * Zi;

        if (ZrZr+ZiZi > 4) {  // Se il modulo di Z è maggiore di 2 (la successione diverge) ...
          break;              // interrompi il ciclo di analisi (C NON appartiene all'insieme di Mandelbrot]
        }
      }

      if (ciclo < maxCicli) {                       // Se il numero di cilci NON è arrivato al massimo ... 
        pixels[x+y*width] = color(ciclo*20 % 255);  // colora il pixel di grigio (fuori dall'insieme)
      }
    }
  }
  updatePixels();
}

