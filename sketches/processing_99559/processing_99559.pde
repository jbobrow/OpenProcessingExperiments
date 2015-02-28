
/*
Pour ce sketch, j'ai repris la dernière rotation de triangles que j'avais créée
et optimisée. En ajoutant les fonctions mouseX et mouseY à certaines de mes
variables je permet ainsi de moduler le sketch à volonté. De nouvelles formes
se créent, le sketch évolue avec les mouvements de la souris.
*/

void setup()
{ 
// la TAILLE, le FOND, et le NON REMPLISSAGE des formes de mon sketch
  size(500,500);
  smooth();
  background(0);
  noFill();
}

void draw ()
{ 
  
//je crée une boucle for pour faire tourner mes formes
    translate(width/2,height/2);
   for (int i=0;i<360;i+=20) 
  { 
//je déclare une variable pour la position et la taille de mon triangle
  int A;
  A = mouseX;
  int B;
  B = 200;
 
    // rotation triangle n°1 (bleu clair)
    rotate(radians(20));
    stroke(#03FFFD,90);
    strokeWeight(8);
    triangle(A,A,B,A,A,B);
  }
  
  
   for (int i=0;i<360;i+=20)
  { 
    // rotation triangle n°2 (extérieur)
    //je crée une variable X = 100
    int X;
    X=mouseY;
    rotate(radians(20));
    stroke(#0343FF,90);
    strokeWeight(10);
    triangle(X,X,X+100,X,X,X+100);
  }
  
  
   for (int i=0;i<360;i+=10)
  { 
    // rotation triangle n°3 (intérieur)
    //je crée une variable Y = 50
    int Y;
    Y = 50;
    rotate(radians(10));
    stroke(#0343FF,90);
    strokeWeight(10);
    triangle(Y,0,Y+50,Y+50,0,Y);
  }

}


