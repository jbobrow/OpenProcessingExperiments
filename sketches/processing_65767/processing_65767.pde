
public class Boule {

  float x;
  float y;
  float startx;
  float starty;
  float vitx0;
  float vity0;
  float vitx;
  float vity;
  float angle;
  float coeff;
  int couleur;
  int index;

  Boule() {

    couleur= color(random(255), random(255), random(255));
    startx=random(400, 600);
    starty=random(400, 600);
    vitx0=4-random(4);
    vity0=4-random( 4);
    coeff=random(1, 15);
    x=startx;
    y=starty;
    vitx=vitx0;
    vity=vity0;
  }
}


