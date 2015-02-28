
// Classe définissant l'attracteur de deJong
class deJongAttractor {
  PImage pi; // Déclaration de la fenêtre de rendu
  // Déclaration des variables de calcul
  float pa, pb, pc, pd; // Paramètres de l'attracteur
  float newx, newy, oldx, oldy; // Coordonnées n+1 et n de la suite
  float ecranX, ecranY; // Taille de l'écran de visualisation
  float logmaxd; // Logarithme de la densité maximum
  int maxdense = 0; // Densité maximum
  int[][] density = new int[Width][Height]; // Tableau de la densité

  // Constructeur de la classe
  void construct(float a,float b,float c,float d) {
    // Paramètres de l'attracteur
    pa = a;
    pb = b; 
    pc = c; 
    pd = d;  
    // Condition initiale
    oldx = 0;
    oldy = 0;
    // Création de la fenêtre de rendu
    pi = createImage(Width, Height, RGB);
    // Initialisation du tableau de densité
    for (int i = 0; i < Width; i++) {
      for (int j = 0; j < Height; j++) {
        density[i][j] = 0;
      }
    }
  }

  // Fonction de calcul de l'attracteur
  void populate(int s, int n, float flou) {
    // Déclaration et définition des variables de boucle
    int samples = s;
    int number = n;
    // Boucles de calcul des points de l'attracteur
    for (int i = 0; i < samples; i++) {
      for (int j = 0; j < number; j++) {
        // Calcul des points de l'attracteur de deJong
        newx = sin(pa * oldy) - cos(pb * oldx);
        newy = sin(pc * oldx) - cos(pd * oldy);
        // Un peu de flou pour un meilleur rendu
        newx += random(-flou, flou);
        newy += random(-flou, flou);
        // On transforme pour le rendu 
        ecranX=(newx+2)*Width/4;
        ecranY=(newy+2)*Height/4;
        // Si on est dans la fenêtre de rendu, la densité du point courant augmente
        if ((ecranX > 0) && (ecranX < Width) && (ecranY > 0) && (ecranY < Height) ) {
          density[int(ecranX)][int(ecranY)] += 1;
          // On cherche la densité la plus importante
          if (density[int(ecranX)][int(ecranY)]>maxdense)
          {
            maxdense=density[int(ecranX)][int(ecranY)];
          }
        }
        // On adapte pour le calcul du prochain point
        oldx = newx;
        oldy = newy;   
      }
    }
    // On calcule le logarithme de la densité 
    logmaxd=log(maxdense);
  }

  // Fonction appelée à chaque rafraichissement
  void incrementalupdate(int nombreIteration, int iteration,float flou,boolean invert) {
    populate(nombreIteration, iteration,flou); // Calcul des points de l'attracteur
    plot(invert); // Dessin des points de l'attracteur
  }


  // Fonction de dessin
  PImage plot(boolean invert) {
    float mybright;
    pi.loadPixels();
    // Boucle de rendu
    for (int i = 0; i < Width; i++) {
      for (int j = 0; j < Height; j++) {
        // Si la densité est supérieure à 0
        if (density[i][j] > 0) {
          if(invert)
          {
            mybright = map(log(density[i][j]), 0, logmaxd, 255, 0); // Blanc
          }
          else
          {
            mybright = map(log(density[i][j]), 0, logmaxd, 0, 255); // Noir
          }  
          color newc = color(mybright);
          color oldc = pi.pixels[i * Width + j];
          newc = blendColor(newc, oldc, SOFT_LIGHT);
          pi.pixels[i * Width + j] = newc;
        }
        else // Si la densité est nulle
        {
          if(invert)
          {
            pi.pixels[i*Width+j]=color(255); // Blanc
          }
          else
          {
            pi.pixels[i*Width+j]=color(0); // Noir
          }
        }
      }
    }
    pi.updatePixels();
    return pi;
  }

}











