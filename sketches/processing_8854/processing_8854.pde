
//Reseau, tracé des routes empruntées en fonction de la densité de passage 
//de l'information par un point d'accès.
//jos.chemla@gmail.com

class Reseau
{
  int Nom;        //Le numéro du point est très important.
  int Nb_points = 500;
  String Mode;
  PVector[] pos = new PVector[Nb_points];  //Tableau contenant l'ensemble des coordonées graphiques
  float[] dens = new float[Nb_points];   //A chaque point est asssocié un poids dans le traffic
  float somme_dens;
  color c_route;
  
  Reseau (String Mode_graphique, color couleur_route) //Constructeur
  {
    Mode = Mode_graphique;
    c_route = couleur_route;
  }
  
  void initialise_points()
  {
    if (Mode.equals("triangle") == true)
    {
      Nom = 0;
      int Etagemax = 8;
      int entre2 = 30;
      for (int etage = 0; etage < Etagemax; etage++)
      {
        for (int iligne = 0; iligne < etage; iligne ++)
        {
          int ecart = (etage - iligne) * (entre2/2 + 30);
          
          int x = (int)(width/2 -1.125*entre2 + (1.5*ecart) - 1.125*entre2*etage);
          int y = (int)(10 + height/10*etage);
          pos[Nom] = new PVector(x, y);
          Nom ++;
        }
      }
      Nb_points = Nom; //Stocke le nombre de points total (flemme de calcul?)
    }
    
    if (Mode.equals("cercle") == true)
    {
      Nom = 0;
      int Nmax = 16;
      int ray = 200;
      
      for (Nom = 0; Nom < Nmax; Nom++)
      {
        float alp = Nom * TWO_PI/Nmax;
        float x = ray * cos(alp) + width/2;
        float y = ray * sin(alp) + height/2;
        
        pos[Nom] = new PVector(x, y);
      }
      Nb_points = Nom;
    }
    
    if (Mode.equals("carre") == true)
    {
      Nom = 0;
      int Imax = 9;
      int Jmax = 9;
      
      for (int i = 0; i < Imax; i++)
      {
        for (int j = 0; j < Jmax; j++)
        {
          float x = 50*i + 50;
          float y = 50*j + 50;
          pos[Nom] = new PVector(x, y);
          Nom ++;
        }
      }
      Nb_points = Nom;
    }
  }
  
  void affiche_points() //Toujours à appeler apres initialise_points()
  {
    for (Nom = 0; Nom < Nb_points; Nom++)
    {
      rectMode(CENTER);
      fill(255);
      rect(pos[Nom].x, pos[Nom].y, 5, 5);
    }
  }
  
  void associe_densite()
  {
    somme_dens = 0;
    
    for (Nom = 0; Nom < Nb_points; Nom++)
    {
      dens[Nom] = random(0, 10);
      somme_dens += dens[Nom];
    }
    //Ce serait pas mal de rapporter la somme des coeff à un chiffre rond
    for (Nom = 0; Nom < Nb_points; Nom++)
      dens[Nom] = dens[Nom]/somme_dens * 100;
  }
  
  int choix()
  {
    somme_dens = 100;
    float aleatoire = random(0, somme_dens);
    
    float somme_dens_inter = 0;
    for (Nom = 0; Nom < Nb_points; Nom++)
    {
      if ((aleatoire > somme_dens_inter) && (aleatoire < (somme_dens_inter + dens[Nom]))) {break;}
      somme_dens_inter += dens[Nom];
    }
    return(Nom);
  }
  
  void trace_route()
  {
    //int[] ch = {choix(), choix()};
    int ch0 = choix();
    int ch1 = choix();
    
    stroke(c_route); noFill();
    line(pos[ch0].x, pos[ch0].y, pos[ch1].x, pos[ch1].y);
  }
  
}


color backg = color(0);
color c_r = color(40, 140, 180, 10); //Transparence!! 

int type = 0;
String[] s_type = {"triangle", "cercle", "carre"};
Reseau Res = new Reseau(s_type[type], c_r);


void setup()
{
  size(500, 500);
  background(backg);
  smooth();
  
  Res.initialise_points();
  Res.affiche_points();
  Res.associe_densite();
}

void draw()
{
  Res.trace_route();
  //saveFrame();
}

void keyPressed()
{
  if (keyCode == ENTER) {saveFrame();}
}

void mousePressed()
{
  type = (type + 1) % 3;
  Res = new Reseau(s_type[type], c_r);
  
  size(500, 500);
  background(backg);
  smooth();
  
  Res.initialise_points();
  Res.affiche_points();
  Res.associe_densite();
}

