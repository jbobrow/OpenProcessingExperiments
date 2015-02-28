
float tay = 20;
float vision = 15;
color backg = color(200);

class Banc
{
  int nb_indiv;
  PVector[] pos;
  float[] ori;
  float[] rapidite;
  float[] influenciation;
  color[] rgb;
  ArrayList voisins;
  
  Banc (int Nb_Indiv)
  {
    nb_indiv = Nb_Indiv;
    pos = new PVector[nb_indiv];
    ori = new float[nb_indiv];
    rapidite = new float[nb_indiv];
    influenciation = new float[nb_indiv];
    rgb = new color[nb_indiv];
    voisins = new ArrayList();
    
    init_aleatoire();
    
    for (int i = 0; i < nb_indiv; i++)
    {
      rgb[i] = color((int)map(influenciation[i], 0, 1, 0, 255)); //1 : très influencable -> blanc
    }
  }
  
  void init_aleatoire()
  {
    for (int i = 0; i < nb_indiv; i++)
    {
      pos[i] = new PVector((int)random(0, width), (int)random(0, height));
      ori[i] = random(-PI, +PI);
      rapidite[i] = random(1/0.7, 1/0.3);
      influenciation[i] = random(0.75, 1);
    }
    for (int i = 1; i <= 10; i++)
    {
      int compt = (int)(nb_indiv/(i+1));
      influenciation[compt] = 1/2048.0;
      rapidite[compt] = 1/0.5;}
  }
  
  void actualise()
  {
    for(int i = 0; i < nb_indiv; i++)
    {
      //Influence sur l'ori des alentours;
      PVector vect_influence = new PVector(0, 0);
      for (int j = 0; j < nb_indiv; j++)
      {
        if ((j != i) && (sq((pos[j].x - pos[i].x)%(width+20)) + sq((pos[j].y - pos[i].y)%(height+20)) < sq(vision)))
        {
          //ori[i] += (ori[j]-ori[i])/256.0;
          //Premiere methode : Le param entre en compte dans l'influence sur l'individu
          //vect_influence = PVector.add(vect_influence, new PVector(cos(ori[j]), sin(ori[j])));
          //Deuxième méthode : Le param entre en compte dans l'influence de chaque voisin
          PVector vect_i = new PVector(cos(ori[j]), sin(ori[j]));
          vect_i = PVector.mult(vect_i, map(influenciation[i], 0, 1, 2, 0));
          vect_influence = PVector.add(vect_influence, vect_i);
          vect_influence.normalize();
          float ori_resultante = atan2(vect_influence.y, vect_influence.x);
          ori[i] += (ori_resultante - ori[i])*map(influenciation[i], 0, 1, 1/1024.0, 1/64.0);
        }
      }
      //Alea (volonté?)
      ori[i] += random(-PI/256, PI/256);
      PVector dplcmt = new PVector(cos(ori[i]+HALF_PI), sin(ori[i]+HALF_PI)); dplcmt = PVector.mult(dplcmt, rapidite[i]);
      pos[i] = PVector.add(pos[i], dplcmt);
      
      //if ((pos[i].x < -10)||(pos[i].x > width+10)||(pos[i].y < -10)||(pos[i].y > height+10))
      //  {pos[i] = new PVector((pos[i].x)%(width+20), (pos[i].y)%(height+20));}
      if (pos[i].x < -10)       {pos[i].x = width+10;}
      if (pos[i].x > width+10)  {pos[i].x = -10;}
      if (pos[i].y < -10)       {pos[i].y = height+10;}
      if (pos[i].y > height+10) {pos[i].y = -10;}
    }
  }
  
  void affiche()
  {
    for(int i = 0; i < nb_indiv; i++)
    {
      fill(rgb[i]);
      translate(+pos[i].x, +pos[i].y);
      rotate(ori[i]);
      beginShape();
      vertex(0, tay); vertex(-tay/3, 0); vertex(+tay/3, 0);
      endShape(CLOSE);
      rotate(-ori[i]);
      translate(-pos[i].x, -pos[i].y);
    }
  }
}

Banc individus;

void setup()
{
  size(800, 600);
  background(backg);
  smooth();
  
  individus = new Banc(400);
  individus.affiche();
}

void draw()
{
  background(backg);
  
  individus.actualise();
  individus.affiche();
}

void keyPressed()
{
  if (keyCode == ENTER) {saveFrame();}
}



