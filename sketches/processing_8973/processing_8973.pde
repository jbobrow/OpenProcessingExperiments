
//Nuage de texte, version 2.0, Pb résolu?
//Written By Jonathan Chemla
//Please Contact em for non-private use
//jos.chemla@gmail.com

//Variables de taille de la fenêtre, rayon du nuage
int RAY = 100; 
int WIDTH = 600;
int HEIGHT = 600;

//Tableau contenant l'ensemble des mots affihcés
String[] s_texte = {"France", "Liban", "Allemagne", "Italie", "Tunisie", "U.S.A.", "Angleterre", "Australie", "Grece", 
                    "Australie", "Maroc", "AfriqueDuSud", "Japon", "Israel", "Espagne", "Islande", "Danemark", "Norvege", 
                    "Suede", "Finlande", "Malte", "Iran", "Russie", "Belgique", "Luxembourg", "TachesAFaire"};
//Gestion des positions de chaque mot du nuage
PVector[] pos_texte = new PVector[s_texte.length];
PVector vect_rot;
//PVector[] vect_rot;
//Camera, couleurs
PVector pos_cam;
PFont font;
color[] c_texte = new color[s_texte.length];
color backg = color(0);
//PrintWriter out_pos_texte;

void initialise() //Attribue à chaque mot du nuage une position dans l'espace et stocke deux variables angulaires, modifiées à la souris plus tard
{
  for (int i = 0; i < s_texte.length; i++)
  {
    float alp_t = random(0, TWO_PI); 
    float bet_t = random(0, TWO_PI); 
    
    //Coordonées sphériques
    float x_t = RAY * (-cos(alp_t)) * sin(bet_t);
    float z_t = RAY * sin(alp_t) * sin(bet_t);
    float y_t = RAY * cos(bet_t);
    
    //Position spatiale à partir de deux angles formés par rapport à des axes de référence
    pos_texte[i] = new PVector(x_t, y_t, z_t);
    
    //Couleur associée au mot
    c_texte[i] = color(255);
  }
  
  font = loadFont("Eureka-90.vlw");
  textFont(font, 16);
  textAlign(CENTER);
  //stroke(backg);
  
  vect_rot = new PVector(0, 0, 0);
}

float dt = 1;

void rafraichis_texte() //Modification des positions des mots à la souris (en fonction de l'écartement au centre de l'image)
{
  float dplcmt_x = map(mouseY, 0, WIDTH,  0.05, -0.05); //Vitesse proportionelle à l'écartement, valeurs extrêmes, -0.05, 0.05
  float dplcmt_y = map(mouseX, 0, HEIGHT, -0.05, 0.05);
    
  //Bandes de non-action (zone tampon, la position de la souris n'influe pas sur les paramètres)
  if (sq(dplcmt_x) < sq(0.01)) {dplcmt_x = 0;}  
  if (sq(dplcmt_y) < sq(0.01)) {dplcmt_y = 0;}  
  
  vect_rot = new PVector(dplcmt_x, dplcmt_y, 0);
  
  for (int i = 0; i < s_texte.length; i++)
  {
    PVector vit_i = new PVector(pos_texte[i].z * vect_rot.y - pos_texte[i].y * vect_rot.z, 
                                pos_texte[i].x * vect_rot.z - pos_texte[i].z * vect_rot.x, 
                                pos_texte[i].y * vect_rot.x - pos_texte[i].x * vect_rot.y);
    pos_texte[i] = PVector.add(pos_texte[i], PVector.mult(vit_i, dt));
    pos_texte[i].mult(RAY/pos_texte[i].mag());
  }
}

void affiche_texte() //Affichage du mot du nuage en fonction de la position stockée
{
  for (int i = 0; i < s_texte.length; i++)
  {
    fill(c_texte[i]);
    translate(pos_texte[i].x, pos_texte[i].y, pos_texte[i].z);
    text(s_texte[i], 0, 0, 0);
    translate(-pos_texte[i].x, -pos_texte[i].y, -pos_texte[i].z);
  }
}

void surbrillance_souris() //Pas sur de marcher avec d'autres dimensions
{
  int bordure = 105; //Grandeur mesurée avec println(mouseX), pour déterminer l'abscisse du bord de la sphère (distance centre-du-mot/bord-écran la plus petite)
  for (int i = 0; i < s_texte.length; i++)
  {
    if ((abs(mouseX - map(pos_texte[i].x, -100, 100, bordure, WIDTH-bordure)) < 50) && (abs(mouseY - map(pos_texte[i].y, -100, 100, bordure, HEIGHT-bordure)) < 25))
      {c_texte[i] = color(30, 190, 180);}
    else {c_texte[i] = color(200);}
  }
}

//Fonctions de contrôle de la caméra
void initialise_camera()
{pos_cam = new PVector(0, 0, 3*RAY);}

void rafraichis_camera()
{
  background(backg);
  camera(pos_cam.x, pos_cam.y, pos_cam.z,
         00,        00,        00,
         00,        01,        00);
}

/*
void exporte_pos()
{
  out_pos_texte = createWriter("out_pos_texte.txt");
  out_pos_texte.println("pos_texte = {");
  for (int i = 0; i < s_texte.length; i++)
    {
      out_pos_texte.print("new PVector(" + pos_texte[i].x + ", " + pos_texte[i].y + ", " + pos_texte[i].z + ")");
      if (i < s_texte.length - 1) out_pos_texte.print(", " + '\n');
    }
  out_pos_texte.print( '\n' + "}; ");
  
  out_pos_texte.flush(); out_pos_texte.close();
}
*/

void setup()
{
  size (WIDTH, HEIGHT, P3D);
  background(backg);
  smooth();
  
  initialise(); 
  //exporte_pos(); 
  initialise_camera();
}

void draw()
{
  rafraichis_camera();
  rafraichis_texte();
  affiche_texte();
  surbrillance_souris();
}

void mousePressed() {initialise();}

void keyPressed() { if (keyCode == ENTER) {saveFrame();}}

