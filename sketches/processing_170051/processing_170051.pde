
// Importation de rentrer audio - mic
import ddf.minim.*;
Minim minim;
AudioInput in;

void setup(){
    size(1280,600);          // taille de l'écran
    background(250);       // couleur de fond = blanc
    smooth();              // dessiner mieux les ellipses
    minim = new Minim(this);
    in = minim.getLineIn(Minim.STEREO, 512);  
    }
  
void draw() {
    float x = 0;                          // indiquer que les variables sur l'abscise (dans ce cas ce sont des flottants)
    for (int i = 0; i<width; i+=5) {     // pour chaque valeur plus petite que la largeur de l'écran, une ellipse est dessinée. Les ellipses sont dessinées à 5 px les unes aux autres
        fill(176, 23, 31, 40);           // couleur des élipses en rouge indien (RGB) avec une opacité de 40%
        ellipse(i, noise(i*0.004f, frameCount*in.mix.level()/100)*height, 10, 10); // dessier les ellipses sur x = variable ; y = (noise=niveau de variables) et framecount=vitesse de déplacement sur y, qui dans ce cas dépends du niveau sonore capté; avec un diamètre de 10px.  
      }
    }

// Arrêter le mic en fermant le programme /l'application 
void stop() {
  in.close();
  minim.stop();
  super.stop();
}



