
void setup()
{
  background(#6A1111);
size(500,500);


}




void draw ()

  

  //Nouvelle ligne
  {
         for (int posX = 40; posX < width; posX = posX+70)
         {
          for (int posY = 40; posY < height; posY = posY+70)
         {
           noFill();

// création d'une variable pour les couleurs
int R;
R = mouseX;
int Ve;
Ve = mouseY;

// création d'une variable pour les ellipses

int E;
E = 0;
int F;
F = 0;

// création d'une variable pour la taille des ellipses

int G;
G = mouseY;
int H;
H = mouseY;

  //1ème rangée
         ellipse(E+posX, F+posY, G+30, H+30);
         strokeWeight(1);
  //2ème rangée
         ellipse(E+posX, F+posY, G+40, H+40);
         noFill();
  //3ème rangée
           ellipse(E+posX, F+posY, G+90, H+90);
         ellipse(E+posX, F+posY, G+60, H+60);
         fill(R+210, Ve+10);
  //4ème rangée
          ellipse(E+posX, F+posY, G+120, H+120);
         fill(R+250, Ve+20);
  //5ème rangée
       ellipse(E+posX, F+posY, G+10, H+10);
       fill(R+240, Ve+50);
  //6ème rangée
       ellipse (E+posX, F+posY, G+5, H+5);
       fill(R+120,Ve+50);
  //7ème rangée
        ellipse (E+posX, F+posY, G+25, H+25);
        point(posX, posY);
    }
         }

//noLoop ();
}






