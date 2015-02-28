
//Tu def ta fleur, elle se cree un arraylist de petales dt les carac dependent d'elle, au debut seules carac statiques

class Fleur
{
  PVector pos; //Position
  float ray;   //Rayon du bulbe central
  PVector pos_tige; //Pour connaitre sa taille, racine..
  
  ArrayList petales; //Les aigrettes :)
  
  Fleur (PVector pos_i, float ray_i, PVector pos_tige_i, int N_petales)
  {
    pos = pos_i;
    ray = ray_i;
    pos_tige = pos_tige_i;
    
    petales = new ArrayList();
    for (int i = 0; i < N_petales; i++)
    {
      float ori_p = random(0, TWO_PI);
      //PVector pos_p = pos;
      PVector pos_p = PVector.add(pos, PVector.mult(new PVector(cos(ori_p), sin(ori_p)), 0.9999*ray)); //Carac. Fleur (pos et ray) determinent celles d'un petale
      ori_p += random(-PI/32, PI/32); //alea de l'orientation, pas totalemt alignee au centre de la fleur
      float tay_p = random(2.1*ray, 2.4*ray);
      //A ce stade, on ne definit pas les caracteristiques du mouvement, chaque petale etant immobile
      Petale petale_i = new Petale(pos_p, ori_p, tay_p, true);
      petales.add(petale_i);
    }
  }
  
  void actu()
  {
    for (int i = 0; i < petales.size(); i++)
      {((Petale)petales.get(i)).actu();}
    if (souffle_declenche)
    {
      for (int i = 0; i < petales.size(); i++)
        {((Petale)petales.get(i)).vit_e = new PVector((arrivee_vent.x - origine_vent.x)/100, (arrivee_vent.y - origine_vent.y)/100);
        ((Petale)petales.get(i)).vit_r.mult(((Petale)petales.get(i)).vit_e.mag() / ((Petale)petales.get(i)).vit_r.mag() / 1.5);}
    }
  }
  
  void affiche()
  {
    noStroke();
    fill(100, 100, 100, 100);
    ellipse(pos.x, pos.y, ray, ray);
    strokeWeight(2); stroke(0); noFill();
    bezier(pos_tige.x, pos_tige.y, pos_tige.x-20, pos_tige.y-20,   pos.x-20, pos.y+20, pos.x, pos.y);
    for (int i = 0; i < petales.size(); i++)
      {((Petale)petales.get(i)).affiche();}
  }
  
  void active()
  {
    for (int i = 0; i < petales.size(); i++) //Carac dynamiques, en attente
    {
        ((Petale) petales.get(i)).vit_e = new PVector(1, 0);
        float alp = random(0, TWO_PI); ((Petale) petales.get(i)).vit_r = PVector.mult(new PVector(cos(alp), sin(alp)), 2); //((Petale) petales.get(i)).vit_e.mag()/5);
        ((Petale) petales.get(i)).w = random(-PI, PI);
        ((Petale) petales.get(i)).phi = random(0, TWO_PI);
        ((Petale) petales.get(i)).fixe = false;
    }
  }
}

class Petale
{
  PVector pos;
  float ori;
  float tay;
  boolean fixe;
  
  //Choix : vitesses dentrainement et relative
  PVector vit_e; //Celle du vent UNE SEULE????????????????????????????????
  PVector vit_r; //Celle propre, norme fact. fois moins importante que le vent
  float w;
  float phi;
  
  Petale(PVector pos_i, float ori_i,  float tay_i, boolean fixe_i)
  {
    pos = pos_i;
    ori = ori_i;
    tay = tay_i;
    fixe = fixe_i;
  }
  
  void actu()
  {
    if (!fixe)
    {
      //Calcul vitesse relative, decalage d'orientation et de norme
      float ori = atan2(vit_r.y, vit_r.x);
      float dvit_r = random(0.9, 1.1);
      float dori = random(-PI/16, PI/16);
      //dori = 0; ori = cos(w*(frameCount/frameRate)/3 + phi); //période de 3s
      if ((vit_r.mag() * dvit_r > vit_e.mag()/5)|(vit_r.mag() * dvit_r > vit_e.mag()/5)) {dvit_r = 1;}
      vit_r = PVector.mult(new PVector(cos(ori + dori), sin(ori + dori)), vit_r.mag() * dvit_r);
      //vit_r = new PVector(0, 0);
      
      PVector vit = PVector.add(vit_e, vit_r);
      pos = PVector.add(pos, PVector.mult(vit, dt));
    }
  }
  
  void affiche()
  {
    stroke(0);
    strokeWeight(1);
    translate(pos.x, pos.y);
    rotate(ori);
    line(0, 0, tay, 0);
    line(tay, -random(3, 5), tay, random(3, 5));
    rotate(-ori);  
    translate(-pos.x, -pos.y);
  }
}

float dt = 1;
float fact = 5;

Fleur fleur;
Fleur fleur1;
Fleur fleur2;


void setup()
{
  size(900, 600);
  smooth();
  ellipseMode(RADIUS);
  stroke(0);
  
  fleur = new Fleur(new PVector(100, 300), 30, new PVector(250, height - 25), 100);
  fleur.affiche();
  souffle_declenche = false;
  fleur1 = new Fleur(new PVector(140, 160), 25, new PVector(250, height - 25), 100);
  fleur2 = new Fleur(new PVector(240, 300), 26, new PVector(250, height - 25), 100);
}

void draw()
{
  background(200);
  dessine_vent();
  fleur.actu();
  fleur.affiche();
  fleur1.actu(); fleur2.actu();
  fleur1.affiche(); fleur2.affiche();
  
}

boolean souffle_declenche;
PVector origine_vent;
PVector arrivee_vent;
void mouseDragged() //Pressed()
{
  if (!souffle_declenche) 
  {
    origine_vent = new PVector(mouseX, mouseY); 
    souffle_declenche = true;
    fleur.active();
    fleur1.active(); fleur2.active(); 
  }
  arrivee_vent = new PVector(mouseX, mouseY);
}
void mouseReleased()
  {souffle_declenche = false;}
void dessine_vent()
{
  if (souffle_declenche)
  {
    stroke(255, 50, 50, 200);
    line(origine_vent.x, origine_vent.y, arrivee_vent.x, arrivee_vent.y);
  }
}

