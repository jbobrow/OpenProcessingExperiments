
float dt = 0.1;

class Masse
{
  float mass;
  float ray;
  boolean fixe;
  ArrayList r_int;
  int num;
  color cou;
  
  PVector pos;
  PVector vit;
  PVector acc;
  
  Masse(float mass_i, float ray_i, boolean fixitude, ArrayList r_int_i, PVector pos_i, PVector vit_i, PVector acc_i)
  {
    mass = mass_i;
    ray = ray_i;
    fixe = fixitude;
    r_int = r_int_i;
    pos = pos_i;
    vit = vit_i;
    acc = acc_i;
    cou = color(80, 250, 140, 100);
    cou = color((int)random(0, 255), (int)random(0, 255), (int)random(0, 255));
  }
  Masse(boolean fixitude, PVector pos_i)    //Valeaurs par défaut (ray, ...)
    {this(1, 8, fixitude,  new ArrayList(), pos_i, new PVector(0, 0), new PVector(0, 0));}
  Masse()
    {this(false, new PVector(0, 0));}
  
  void actu()
  {
    if (!fixe)
    {
      //Def forces exercee;
      PVector resultante = new PVector(0, 0);
      //Force souris
      PVector vect = new PVector(pos.x - mouseX, pos.y - mouseY);
      float dplcmt = sqrt(sq(pmouseX - mouseX) + sq(pmouseY - mouseY))/10;
      vect.mult(for_souris*dplcmt/(pow(vect.mag(), 2))); //A tester, sympa avec un -
      resultante.add(vect);
      
      for (int i = 0; i < r_int.size(); i++)
        {Ressort ressort_i = (Ressort) ressorts.get((Integer)(r_int.get(i))); resultante.add((ressort_i).Force(num));}
      float b = 0.4; //Frottements
      resultante.add(PVector.mult(vit, -b));
      acc = PVector.mult(resultante, 1/mass);
      vit = PVector.add(vit, PVector.mult(acc, dt));
      pos = PVector.add(pos, PVector.mult(vit, dt));
    }
  }
  
  void aff()
  {
    fill(cou, 150);
    ellipse(pos.x, pos.y, ray, ray);
  }
}

class Ressort
{
  float const_k; //constante de raideur
  float l_vide; //longueur a vide
  
  Masse M1;
  Masse M2;
  int m1_int;
  int m2_int;
  
  //Ressort(float const_raid, float long_vide, Masse Masse1, Masse Masse2)
  Ressort(float const_raid, float long_vide, int Masse1, int Masse2)
  {
    const_k = const_raid;
    l_vide = long_vide;
    m1_int = Masse1;
    m2_int = Masse2;
    
    //Attention, structure compliquée, car m_fixes et mobiles séparées. on def les masses (2 tableaux), puis ressorts par masses attachees, ou l ressort se rajoute ds la def de la masse, avec son numero ordre
    ((Masse) masses.get(m1_int)).num = 1;
    ((Masse) masses.get(m2_int)).num = 2;
  }
  Ressort(int m1_int, int m2_int)
    {this(random(0.5, 1.5), 00, m1_int, m2_int);}
  Ressort()
    {this(0, 0);}
  
  PVector Force(int numero)
  {
    Masse M1 = (Masse) masses.get(m1_int);
    Masse M2 = (Masse) masses.get(m2_int);
    
    PVector u_dir = new PVector(M2.pos.x - M1.pos.x, M2.pos.y - M1.pos.y);
    float l_ress = u_dir.mag();
    u_dir.normalize();
    if (numero == 1)
      {return(PVector.mult(u_dir, (const_k * (l_ress - l_vide))));}
    else
      {return(PVector.mult(u_dir, -(0.5 * const_k * (l_ress - l_vide))));}
  }
}

float for_souris;
int mode; 

void setup()
{
  size(800, 800);
  smooth();
  ellipseMode(RADIUS);
  stroke(0, 0); fill(80, 250, 140, 100);//fill(240, 20, 20, 100);
  
  mode = 0;
  for_souris = -5000;
  init(500);
}

void draw()
{
  switch (mode)
  {
    case 0 : 
      background(0);
      for (int i = 0; i < masses.size(); i++)
      {
        if (!(((Masse) masses.get(i)).fixe))
        {
          ((Masse) masses.get(i)).actu();
          ((Masse) masses.get(i)).aff();
        }
      }
      break;
    case 1 : 
      //background(0);
      mode_edition();
      for (int i = 0; i < masses.size()/2; i++)
        {((Masse) masses.get(2*i)).aff();}
      break;
    case 2 : 
      //mode_image("tri.png", 400); //test : mode image en continu ici un par un, pas ds le key
      for (int i = 0; i < masses.size()/2; i++)
        {((Masse) masses.get(2*i)).aff();}
      break;
    default : 
      break;
  }
  println(masses.size()/2);
}

ArrayList ressorts;
ArrayList masses;

void init(int n_mob)
{
  ressorts = new ArrayList();
  masses = new ArrayList();
  
  for (int i = 0; i < n_mob; i++)
  {
    masses.add(new Masse(true, new PVector((int)random(100, width-100), (int)random(100, height-100))));
    masses.add(new Masse(false, new PVector((int)random(100, width-100), (int)random(100, height-100))));
  }
  for (int i = 0; i < masses.size(); i+=2) //Bijection Ressort -> 2 masses (ou bij masses mobiles et fixes)
  {
    Masse m_fixe_i = (Masse) masses.get(i);
    Masse m_mob_i = (Masse) masses.get(i+1);
    int m1_int = i; //Variables rajoutées pour le rafraichissement de la pos masse mobile, une inutile.
    int m2_int = i+1;
    Ressort ressort_inter = new Ressort(m1_int, m2_int);
    
    ressorts.add(ressort_inter);
    //Assoc ressorts aux masses
    ((Masse)masses.get(i)).r_int.add(ressorts.size()-1);
    ((Masse)masses.get(i+1)).r_int.add(ressorts.size()-1);
  }
}

void mode_edition()
{
  //init(0);
  if (mousePressed)
  {
    masses.add(new Masse(true, new PVector(mouseX, mouseY)));
    masses.add(new Masse(false, new PVector((int)random(100, width-100), (int)random(100, height-100))));
    int m1_int = masses.size() - 2; //Variables rajoutées pour le rafraichissement de la pos masse mobile, une inutile.
    int m2_int = m1_int + 1;
    Ressort ressort_inter = new Ressort(m1_int, m2_int);
    ressorts.add(ressort_inter);
    //Assoc ressorts aux masses
    ((Masse)masses.get(m1_int)).r_int.add(ressorts.size()-1);
    ((Masse)masses.get(m2_int)).r_int.add(ressorts.size()-1);
  }
}

void mode_image(String img, int n_mob)
{
  PImage image_fond;
  image_fond = loadImage(img);
  image_fond.resize(width, 0);
  int i = 0; 
  while(i < n_mob)
  {
    PVector pos_alea = new PVector(random(0, width), random(0, height));
    if (brightness(image_fond.get((int)pos_alea.x, (int)pos_alea.y)) > 200)
    {
      masses.add(new Masse(true, new PVector(pos_alea.x, pos_alea.y)));
      masses.add(new Masse(false, new PVector((int)random(100, width-100), (int)random(100, height-100))));
      int m1_int = masses.size() - 2; //Variables rajoutées pour le rafraichissement de la pos masse mobile, une inutile.
      int m2_int = m1_int + 1;
      Ressort ressort_inter = new Ressort(m1_int, m2_int);
      ressorts.add(ressort_inter);
      //Assoc ressorts aux masses
      ((Masse)masses.get(m1_int)).r_int.add(ressorts.size()-1);
      ((Masse)masses.get(m2_int)).r_int.add(ressorts.size()-1);
      i++;
    }
  }
}

void mode_imageBW(String img, int n_mob)
{
  PImage image_fond;
  image_fond = loadImage(img);
  image_fond.resize(width, 0);
  int i = 0; 
  while(i < n_mob)
  {
    PVector pos_alea = new PVector(random(0, width), random(0, height));
    color col = image_fond.get((int)pos_alea.x, (int)pos_alea.y);
    if (brightness(col) > 200)
    {
      masses.add(new Masse(true, new PVector(pos_alea.x, pos_alea.y)));
      masses.add(new Masse(false, new PVector((int)random(100, width-100), (int)random(100, height-100))));
      int m1_int = masses.size() - 2; //Variables rajoutées pour le rafraichissement de la pos masse mobile, une inutile.
      int m2_int = m1_int + 1;
      Ressort ressort_inter = new Ressort(m1_int, m2_int);
      ressorts.add(ressort_inter);
      //Assoc ressorts aux masses
      ((Masse)masses.get(m1_int)).r_int.add(ressorts.size()-1);
      ((Masse)masses.get(m2_int)).r_int.add(ressorts.size()-1);
      ((Masse)masses.get(m2_int)).cou = col;
        ((Masse)masses.get(m2_int)).ray = 6;
      i++;
    }
  }
}

void mode_image_quadr(String img, int pas)
{
  PImage image_fond;
  image_fond = loadImage(img);
  image_fond.resize(width, 0);
  for (int i = 0; i < width/pas; i++)
  {
    for (int j = 0; j < image_fond.height/pas; j++)
    {
      PVector pos = new PVector(i*pas, j*pas);
      //pos = new PVector(i*pas + random(-1, 1), j*pas + random(-1, 1));
      color col = image_fond.get((int)pos.x, (int)pos.y);
      if (brightness(col) >= 00)
      {
        masses.add(new Masse(true, new PVector(pos.x, pos.y)));
        masses.add(new Masse(false, new PVector((int)random(100, width-100), (int)random(100, height-100))));
        int m1_int = masses.size() - 2; //Variables rajoutées pour le rafraichissement de la pos masse mobile, une inutile.
        int m2_int = m1_int + 1;
        Ressort ressort_inter = new Ressort(m1_int, m2_int);
        ressorts.add(ressort_inter);
        //Assoc ressorts aux masses
        ((Masse)masses.get(m1_int)).r_int.add(ressorts.size()-1);
        ((Masse)masses.get(m2_int)).r_int.add(ressorts.size()-1);
        ((Masse)masses.get(m2_int)).cou = col;
        ((Masse)masses.get(m2_int)).ray = pas/2;
      }
    }
  }
}

void mousePressed()
{
  //init(500);
}

void keyPressed()
{
  if (key == 'p') {for_souris = - for_souris;}
  if (keyCode == ENTER) {background(0); mode = 0;}
  if (key == 'e') {background(0); mode  = 1; init(0);}
  if (key == 'r') {background(0); mode  = 2; init(0); mode_image("tri.png", 500);}
  if (key == 'i') {background(0); mode  = 3; init(0); mode_imageBW("coeur.png", 1500);}
  if (key == 'o') {background(0); mode  = 4; init(0); mode_image_quadr("tete.png", 12);}
  if (key == 'k') {background(0); mode  = 5; init(0); mode_image_quadr("DSC02439.JPG", 16);}
  if (key == 'l') {background(0); mode  = 6; init(0); mode_image_quadr("film.JPG", 11);}
  
  if (mode > 6) {mode = 0;}
}


