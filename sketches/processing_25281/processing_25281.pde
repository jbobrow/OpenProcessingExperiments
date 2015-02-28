
/*
Cet exemple importe la logitheque Minim et 
 demontre comment jouer une piste de fond
 et des echantillons sporadiques.
 */

import ddf.minim.*;

Minim minim;

AudioSample echantillon;
AudioPlayer musique;

float trigger;

void setup()
{
  size(300, 300);
  // always start Minim before you do anything with it
  minim = new Minim(this);

  // Charger un echantillon. Un echantillon est un son de
  // courte duree qui peut-etre reutilise plusieurs
  // fois.
  echantillon = minim.loadSample("808clap.wav", 1024);

  // Charger un fichier de longue duree.
  musique = minim.loadFile("groove.mp3", 2048);

  // Jouer le fichier en boucle
  musique.play();
  musique.loop();
}

void draw()
{
  background(0);

  fill(255);
  
  // Animer un rectangle donc la largeur correspond a la 
  // progression de la lecture de la musique.
  float progressionMusique = musique.position() / (float) musique.length();
  rect(0,0,progressionMusique*width,height/2);

  // Animer un autre rectange por demontrer la lecture
  // de l'echantillon.
  trigger = max(trigger - 0.05,0);
  fill(trigger*255);
  rect(0,height/2,width,height/2);
}

void mousePressed() {
  trigger = 1;
  echantillon.trigger();
}



// Ici, nous creons un "override" du stop() du sketch.
// Une override remplace la fonction de la classe et 
// permet de la personnaliser. La commande "super.stop()"
// lance la methode stop originale du sketch apres avoir
// execute le code personnalise.

void stop()
{
  // Fermer tous les objets Minim.
  echantillon.close();
  musique.close();
  minim.stop();

  // Lancer la methode originale.
  super.stop();
}


