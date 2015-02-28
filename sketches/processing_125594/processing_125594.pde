
import ddf.minim.analysis.*;
import ddf.minim.*;


//Défini la class BeatListener non implantée dans minim
class BeatListener implements AudioListener
{
  private BeatDetect beat;
  private AudioPlayer source;
  
  BeatListener(BeatDetect beat, AudioPlayer source)
  {
    this.source = source;
    this.source.addListener(this);
    this.beat = beat;
  }
  
  void samples(float[] samps)
  {
    beat.detect(source.mix);
  }
  
  void samples(float[] sampsL, float[] sampsR)
  {
    beat.detect(source.mix);
  }
}

//Définition des variables et des objets (Minim, le player, le détecteur de beats (filtre gris), le beatlistener)
Minim minim;
AudioPlayer song;
BeatDetect beat;
BeatListener bl;

//FFT => analyse des bandes de fréquence (déclaration de l'objet)
FFT fftLin;

//Taille des formes
int w;

//Coordonnées des lignes et du premier point du triangle
float l1, l2, t1, t2;

//Variables nécessaires au calcul de la puissance moyenne des bandes de fréquences
int nbrond, nbcarre, nbtriangle, nbligne = 0;
int moyennerond, moyennecarre, moyennetriangle, moyenneligne = 0;
int totalrond, totalcarre, totaltriangle, totalligne = 0;


int grey = 0;

//Déclaration de la police de caractère
PFont font;


void setup()
{
  //Paramètres de l'image
  size(1200, 700, P3D);
  smooth(8);
  frameRate(30);
  strokeWeight(1);
  
  //Sélection de la police de caractère
  font = loadFont("avenir.vlw");
  textFont(font, 12);

  //Initialisation de minim
  minim = new Minim(this);
  
  //Load le morceau et le lance
  song = minim.loadFile("cryptocracy.mp3", 2048);
  song.play();
  
  //création de l'objet BeatDetect + gestion de la sensibilité
  beat = new BeatDetect(song.bufferSize(), song.sampleRate());
  beat.setSensitivity(300);
  
  //Création de l'objet BeatListener et de la FFT (algorythme d'analyse des fréquences du tampon)
  bl = new BeatListener(beat, song);
  fftLin = new FFT(song.bufferSize(), song.sampleRate());
  
  //Défini le nombre de bandes de fréquences
  fftLin.linAverages(4);
}
 
void draw()
{
  //Initialisation de la matrice pour contrôler les rotates
  pushMatrix();
  
  // lancement de l'analyse du tampon
  fftLin.forward(song.mix);
  
  // Si le BeatListener capte un kick, alors le filtre DILATE se lance (une fois sur deux)
  if ( beat.isKick() )
  {
    
    if (grey == 0)
    {
      filter(GRAY);
      grey --;
    }
    else
    {
      grey = 0;
    }
  }
  
  //Boucle générant les formes
  for(int i = 0; i < fftLin.avgSize(); i++)
  {
    
    //Le switch attrappe une par une les bandes de fréquence (4)
    switch(i) {
      
      case 0:
      
        // + Création des ellipse (basses)
        noStroke();
        // Ajustement de la taille à la puissance
        w = int(fftLin.getAvg(i)*10);
        // Couleur random
        fill(random(200,255), random(30, 75),random(30,75), 200);
        // Forme
        ellipse(random(width), random(height), w, w);
        // Compteur
        nbrond ++;
        totalrond += w;
        moyennerond = totalrond / nbrond;
        break;
        
        
      case 1:
      
        // + Création des carrés (médiums)
        noStroke();
        // Ajustement de la taille à la puissance
        w = int(fftLin.getAvg(i)*150/3.5);
        // Couleur random
        fill(random(0, 50), random(90, 150),random(0, 50), 200);
        // Forme
        rect (random(width), random(height), w, w);
        // Compteur
        nbcarre++;
        totalcarre += w;
        moyennecarre = totalcarre / nbcarre;
        break;
        
        
      case 2:
      
        // + Création des triangles (médiums aigus)
        noStroke();
        // Ajustement de la taille à la puissance
        w = int(fftLin.getAvg(i)*250/3);
        // Rotation de la forme
        rotate(random(90));
        // Génère le premier point du triangle
        t1 = random(width);
        t2 = random(height);
        // Couleur random
        fill(random(0,135), random(130,255), random(200,254));
        // Forme
        triangle(t1, t2, t1 + w, t2, t1 + (w/2), t2 + w);
        // Compteur
        nbtriangle ++;
        totaltriangle += w;
        moyennetriangle = totaltriangle / nbtriangle;
        break;
        
        
      case 3:
      
        // + Création des lignes (aigus)
        stroke(0);
        // Ajustement de la taille à la puissance
        w = int(fftLin.getAvg(i)*1000);
        // Rotation de la forme
        rotate(random(90));
        // Génère le premier point de la ligne
        l1 = random(width);
        l2 = random(height);
        // Forme
        line(l1, l2, l1 + w, l2);
        // Compteur
        nbligne++;
        totalligne += w;
        moyenneligne = totalligne / nbligne / 6;
        break;
    }
  }
  
  
  //Dessin de la carte d'identité du morceau
  if ( song.isPlaying() )
  {
    //Réinitialisation de la matrice (rotate à 0) pour éviter que la carte d'identité tourne
    popMatrix();
    
    //Vire le contour généré pour les lignes dans le draw
    noStroke();
    
    //Carré noir pour la carte d'identité du morceau
    fill(0);
    rect(0, 0, 250, 100);
    
    //Texte pour la carte d'identité du morceau
    fill(255);
    textSize(12);
    text("PUISSANCE MOYENNE\nRonds (Bass) = " + moyennerond + "\nCarres (Medium) = " + moyennecarre + "\nTriangles (Medium Treble) = " + moyennetriangle + "\nLignes (Treble) = " + moyenneligne, 5, 5, 250, 90);
  }
  //Évite le bug du dernier pushMatrix()
  else { popMatrix(); }
}

//Arrêt de toutes les fonctions et donc du son à la fin du morceau
void stop()
{
  song.close();
  minim.stop();
  super.stop();
}

//Screenshots avec la touche S
void keyPressed()
{
  if(key == 's') saveFrame("screenshot_" + millis() + ".png");
}


