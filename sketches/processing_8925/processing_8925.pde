
//Attracteurs étranges, v.2, gestion param graphiquemt

PVector P_n;
boolean param_en_cours;
int methode;
float A, B, C, D;

float tay_fen = 3;
PImage col;
 
void setup()
{
  size(800, 800);
  smooth();
  background(0);
  ellipseMode(RADIUS);
  rectMode(CORNER); //defaut
  textMode(MODEL);  //defaut
  //colorMode(HSB);
  
  init_var();
  P_n = new PVector(0, 0);
  param_en_cours = false;
  init_param();
  col = loadImage("coul.jpg");
}

void draw()
{
  if (!param_en_cours)
    {dessine_attract();}
    //{genere_attract();}
  else
    {edit_param();}
}

void keyPressed()
{
  if (keyCode == ENTER)
    {param_alea();}
  if (key == 'p')
    {param_en_cours = !param_en_cours;}
  background(0);
  println("Methode " + methode + "; A = " + A + "; B = " + B + "; C = " + C + "; D = " + D);
  P_n = new PVector(0, 0);
}

void init_param()
{
  methode = 1;
  A = 1.1;
  B = -1.0;
  C = 1.0;
  D = 1.5;
  
  methode = 0;
  A = 1.4; 
  B = -2.3; 
  C = 2.4; 
  D = -2.1;
}

void dessine_attract()
{
  float x_f;
  float y_f;
  
  switch(methode)
  {
    case 0: //Peter de Jong
    x_f = sin(A*P_n.y) - cos(B*P_n.x);
    y_f = sin(C*P_n.x) - cos(D*P_n.y);
    break;
    
    case 1: //Clifford
    x_f = sin(A*P_n.y) + C*cos(A*P_n.x);
    y_f = sin(B*P_n.x) + D*cos(B*P_n.y);
    break;
    
    default: 
    x_f = 0;
    y_f = 0;
    break;
  }
  
  P_n = new PVector(x_f, y_f);
  PVector P_ecran = new PVector(map(x_f, F_cur_min.x, F_cur_max.x, 0, width), map(y_f, F_cur_min.y, F_cur_max.y, height, 0));
  stroke(col.get((int)P_ecran.x, (int)P_ecran.y), 150);
  //stroke(255, 100);
  point(P_ecran.x, P_ecran.y); 
  //println(P_ecran.x + "; " + P_ecran.y); println(x_f + "; " + y_f);
}


void param_alea()
{
  methode = (int)random(0, 2);
  A = random(-3, 3);
  B = random(-3, 3);
  C = random(-3, 3);
  D = random(-3, 3);
}


void genere_attract()
{
  background(0);
  for (int cpt = 0; cpt < 250000; cpt++) {dessine_attract();}
  saveFrame("Methode " + methode + "; A = " + A + "; B = " + B + "; C = " + C + "; D = " + D + ".png");
  param_alea();
  println("Methode " + methode + "; A = " + A + "; B = " + B + "; C = " + C + "; D = " + D);
}

