
/* 
 HALVVEIS TILFELDIGE FIRKANTER (2013)
 Laget av Kristian Pedersen: Masterstudent, Resøørcher, Pres'.
 */

// IMPORT OG GLOBALE VARIABLER

float farge1 = 100; // Nedre RGB-grense
float farge2 = 255; // Øvre RBG-grense
float r_rnd = random(farge1, farge2); // Bakgrunnsfargens bestanddeler
float g_rnd = random(farge1, farge2);
float b_rnd = random(farge1, farge2);
int index = 0; // For å holde telling på hvor mange firkanter som har blitt lagd / Øke skriftstørrelsen
int antallFirkanter = 100; // Antall firkanter som tegnes før programmet begynner på ny



// LERRETT OG FRAMERATE
void setup() 
{
  size (1920/2, 1080/2);  // Lerrett
  background(r_rnd, g_rnd, b_rnd); // Tilfeldig bakgrunnsfarge hver gang programmet kjøres
  stroke(255, 255, 255); // Border-farge
  frameRate(60);

//  minim = new Minim(this);
//  player = minim.loadFile("test.mp3");
//  player.play();
}

// FÅ TING TIL Å VISES PÅ SKJERMEN; OPPDATERES KONTINUERLIG
void draw() 
{
  if (index < antallFirkanter) 
  {
    firkant(25, 50); // Tegn firkant med tilfeldig høyde og bredde mellom disse tallene.
    index++;
  }
  else 
  { // Tilbakestiller index til 0 igjen, og skifter til ny bakgrunnsfarge
    index += -antallFirkanter;
    float r_rnd_ny = random(farge1, farge2);
    float g_rnd_ny = random(farge1, farge2);
    float b_rnd_ny = random(farge1, farge2);
    background(r_rnd_ny, g_rnd_ny, b_rnd_ny);
  }
}

// HVER ENKELT FIRKANTS FARGE OG DIMENSJONER
void firkant(float storrelseX, float storrelseY) 
{
  // Farger
  int r_rnd_f = int(random(farge1, farge2)); // Egne tilfeldige farger for firkantene. Har gjort resøørch.
  int g_rnd_f = int(random(farge1, farge2));
  int b_rnd_f = int(random(farge1, farge2));

  // Firkantens koordinater, dimensjoner og hjørneavrunding
  float x = random(0, width);
  float y = random(0, height);
  float bredde = random(storrelseX, storrelseY);
  float hoyde = random(storrelseX, storrelseY);
  int smuud = 2;

  // Tegn firkant
  rect(x, y, bredde, hoyde, smuud);
  fill(r_rnd_f, g_rnd_f, b_rnd_f);

  // Skriv ut oversikt til konsoll
  println(index + "/" + antallFirkanter);
}

