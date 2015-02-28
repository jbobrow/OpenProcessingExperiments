
import arb.soundcipher.*;
import ddf.minim.*;
import ddf.minim.signals.*;

SoundCipher sc = new SoundCipher(this);
Minim minim = new Minim(this);
AudioInput in;
AudioOutput out;

Freq freqs;
Pixel[][] pix;
Radar Radar_;
Potar potarVol;
Source[][] sources;
HScrollbar hs1;float topPos;

int w; // depending on the width of the interface
int vit = 10;

int bs;
int[] mySource = new int[2];
boolean hasChanged = false;

// Comment this for an automatic search
String[] filenames = {"plink.aif", "hats.wav", "kick.wav", "SD.wav", "snare.wav", "rec0.wav", "rec1.wav", "rec2.wav", "rec3.wav"};
// Uncomment this for an automatic search
/*String[] filenames;*/

PFont f;

void setup() {
  size(900, 700); // (screen.width-50,screen.height-50);//900,616);
  background(50);
  frameRate(30);
  f = createFont("Arial Bold", 12, true);
  mySource[0] = 0;
  mySource[1] = 0;

  in = minim.getLineIn(Minim.STEREO, 1648);
  out = minim.getLineOut(Minim.STEREO);
  // Uncomment this for an automatic search
  /*path = sketchPath + "/data/effects";
  filenames = listFileNames(path);*/
  freqs = new Freq();

  smooth();

  potarVol = new Potar(width-width/20, height/5);
  w = width / 100;
  bs = 4 * width / 9; // 2*screen.height/3;

  // Radar
  Radar_ = new Radar(16, 5);
  Radar_.drawBody();
  // Initialise sources
  Radar_.addSources(Radar_.nb, Radar_.nl);
  
  hs1 = new HScrollbar(0, 15, width, 15, 3 + 1);
}

void draw() {
  topPos = hs1.getPos() - width / 2;
  /*textAlign(LEFT);
  fill(0, 40, 63);
  textFont(f, 13);
  text(" - I  N  S  T  R  U  C  T  I  O  N  S - \n " +
       "> 1) Sélectionner votre source sonore parmi les trois catégories: notes de piano, bips, enregistrements\n " +
       "> 2) Sélectionner une postion temporelle sur le radar \n " +
       "> Pour accélérer/ralentir la vitesse de jeu: flèches '>/<' \n " +
       "> Pour remettre à zéro le radar: barre espace \n " +
       "> Fermer l'application: ESC ", topPos * 2, 40); 
  hs1.update();
  hs1.display();*/
  fill(153);
  strokeWeight(1);
  ellipse(Radar_.bx, height / 2, 50, 50);
  float volume = in.mix.level() * 5000;         // niveau sonore d'entrée
  if(volume > 50)
    volume = 50;
  Radar_.drawCenter(volume);

  Radar_.displayLib();

  Radar_.activateSources(vit, Radar_.nb, Radar_.nl);
  potarVol.display();
  if(mousePressed) {
    if(potarVol.check(mouseX, mouseY))
      potarVol.move(mouseY);
    for(int i = 0; i < Radar_.nb; i++)
      for(int j = 0; j < Radar_.nl; j++) {
        if(pix[i][j].type == 2)
          pix[i][j].setMyAmp(-10 * (j + 1 - Radar_.nl) * potarVol.getValue());
        else if(pix[i][j].type == 1)
          pix[i][j].setMyAmp(-10 * (j + 1 - Radar_.nl) * potarVol.getValue() / 100); // .sine.setAmp(0.005);//(Radar_.nl-j+1)/10000*potarVol.getValue());
        else
          pix[i][j].setMyAmp((Radar_.nl - j + 1) * 10 * potarVol.getValue());
      }
  }
  
  
}
void mousePressed() {
  for(int i = 0; i < Radar_.nb; i++)
    for(int j = 0; j < Radar_.nl; j++)
      if(pix[i][j].pospix(mouseX, mouseY) == true) {
        pix[i][j].changeColor(0);
        pix[i][j].display();
        pix[i][j].setSource(mySource[0], mySource[1]);
      }
  for(int i = 0; i < 3; i++)
    for(int j = 0; j < freqs.tab[0].length; j++) {
      if(sources[i][j].posSource(mouseX, mouseY, i) == true) {
        // println(" " + i + " // " +j);
        mySource[0] = i;
        mySource[1] = j;
        hasChanged = true;
      } else
        hasChanged = false;
    }
}
void keyPressed() {
  if(key == ' ') // reinitialise la composition = désactive toute les sources activées

    Radar_.initSources();
   // Agit sur la vitesse de jeu
  if(keyCode == LEFT)
    vit++;
  if(keyCode == RIGHT)
    vit--;
  vit = constrain(vit, 1, 30);
  if(key == 'i') {
    println("Listing all filenames in a directory: ");

    println(filenames);
    println(filenames.length);
  }
}
// This function returns all the files in a directory as an array of Strings
String[] listFileNames(String dir) {
  File file = new File(dir);
  if(file.isDirectory()) {
    String names[] = file.list();
    return names;
  } else
    // If it's not a directory
    return null;
}
void stop() {
  minim.stop();
  super.stop();
}

