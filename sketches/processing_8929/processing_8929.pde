
//Written by Jonathan Chemla
//Please contact me for non-private use ;)
//jos.chemla@gmail.com

//--------------------CLASSE GRAPHE-------------------\\

//import processing.opengl.*;

int WIDTH = 800;
int HEIGHT = 600;
color backg = color(200);
PFont font;

class Graphe
{
  int n; 
  PVector[] pos;
  float[] poids;
  
  Graphe (int N_noeuds)
  {
    n = N_noeuds;
    attribue_pos(n);
    initialise_poids(n);
  }
  
  void attribue_pos(int N_noeuds)
  {
    int delta = 100;
    pos = new PVector[N_noeuds];
    for (int i = 0; i < N_noeuds; i++)
    {
      int x = (int)random(0+delta, WIDTH-delta);
      int y = (int)random(0+delta, HEIGHT-delta);
      pos[i] = new PVector(x, y);
      
      pos[0] = new PVector(delta-20, HEIGHT/2);
      pos[N_noeuds-1] = new PVector(WIDTH-(delta-20), HEIGHT/2);
    }
  }
  void initialise_poids(int N_noeuds)
  {
    int N_arretes = 0;
    for (int i = 0; i < N_noeuds; i++)
      {N_arretes += N_noeuds-i;} //Stocke tous les arretes, même inutiles 
    N_arretes = n*(n+1)/2; //Formule plus simple
    poids = new float[N_arretes];
    for (int i = 0; i < N_arretes; i++)
      {poids[i] = 1;}
  }
  
  int i_arrete_de(int n1, int n2)
  {
    if (n1 > n2) {int n_i = n1; n1 = n2; n2 = n_i;}
    int i_ch = 0;
    for (int i = 0; i < n1; i++) {i_ch += n-i;}
    i_ch += n2-n1;
    return (i_ch);
  }
  
  float poids_de(int n1, int n2)
    {return(poids[i_arrete_de(n1, n2)]);}
  
  void dessine()
  {
    ellipseMode(CENTER);
    rectMode(CENTER);
    textAlign(LEFT, TOP);
    textFont(font, 16);
    stroke(0);
    for (int i = 0; i < n; i++)
    {
      fill(255); ellipse(pos[i].x, pos[i].y, cir, cir);
      //fill(0); rect(pos[i].x, pos[i].y, 7, 7); fill(255); rect(pos[i].x, pos[i].y, 3, 3);
      fill(0); text("(" + i + ")", pos[i].x+10, pos[i].y+10);
    }
  }
}
//-----FIN CLASSE GRAPHE-----\\

Graphe graphe = new Graphe(20);
//PrintWriter output;

void setup()
{
  size(WIDTH, HEIGHT); //, OPENGL);
  background(backg);
  font = loadFont("CourierNew36.vlw");
  //output = createWriter("output.txt");
  smooth();
  
  graphe.dessine();
  for (int i = 0; i < N_fourmis; i++) {fourmi[i] = new Fourmis(0);}
  //actu_fourmis();
}

void keyPressed()
{
  /*
  if (keyCode == ENTER)
  {
    output.print("graphe.pos = [");
    for (int i = 0; i < graphe.n-1; i++)
      {output.println("new PVector(" + graphe.pos[i].x + ", " + graphe.pos[i].y + "), ");}
    output.println("new PVector(" + graphe.pos[graphe.n-1].x + ", " + graphe.pos[graphe.n-1].y + ")]; ");
    
    output.println();
    output.println("graphe.poids.length : " + graphe.poids.length + ", ");
    for (int i = 0; i < graphe.n; i++)
      {output.println(graphe.i_arrete_de(graphe.n, i));}
    output.flush();
    output.close();
  }
  */
}
void mousePressed()
{
  background(backg);
  fourmi = (Fourmis[]) append(fourmi, new Fourmis(0));
}

//--------------------CLASSE FOURMI-------------------\\
int N_fourmis = 1;
Fourmis[] fourmi = new Fourmis[N_fourmis];
float cir = 20;

class Fourmis
{
  int i_noeud;
  int i_noeud_choisi;
  int[] chemin;
  int ray;
  PVector pos;
  PVector dir;
  PVector vit;
  
  color rgb;
  color rgb1;
  color rgb2;
  
  Fourmis(int i_depart)
  {
    i_noeud = i_depart;
    chemin = new int[0];
    chemin = append(chemin, i_noeud);
    ray = 200;
    pos = new PVector(graphe.pos[i_noeud].x, graphe.pos[i_noeud].y);
    dir = new PVector(0, 0);
    rgb = color(70, 200, 220);
    rgb1 = color(40, 115, 40);
    rgb2 = color(235, 30, 70);
  }
  
  int[] possibilite;
  int N_possibilites;
  
  void choisis()
  {
    //Determination des Noeuds accessibles
    N_possibilites = 0;
    for (int i_sel = 0; i_sel < graphe.n; i_sel++) {
      if ((sq(graphe.pos[i_noeud].x - graphe.pos[i_sel].x) + sq(graphe.pos[i_noeud].y - graphe.pos[i_sel].y) <= sq(ray)) && (i_sel != i_noeud))
        {N_possibilites++;}
    }
    possibilite = new int[N_possibilites];
    int i_courant = 0;
    for (int i_sel = 0; i_sel < graphe.n; i_sel++) {
      if ((sq(graphe.pos[i_noeud].x - graphe.pos[i_sel].x) + sq(graphe.pos[i_noeud].y - graphe.pos[i_sel].y) <= sq(ray)) && (i_sel != i_noeud)) {
        possibilite[i_courant] = i_sel;
        i_courant++;
      }
    }
    //Choix en cours
    int sum = 0;
    for (int i = 0; i < N_possibilites; i++)
      {sum += graphe.poids_de(i_noeud, possibilite[i]);}
    float alea = random(sum);
    int sum2 = 0;
    int i_eval = 0;
    //while(!((sum2 <= alea)&&(alea < sum2 + graphe.poids_de(i_noeud, possibilite[i_eval])))) {i_eval ++; sum2 += graphe.poids_de(i_noeud, possibilite[i_eval]);}
    
    for (i_eval = 0; i_eval < N_possibilites; i_eval++)
      {sum2 += graphe.poids_de(i_noeud, possibilite[i_eval]);
       if (alea < sum2) {break;}
      }
    i_noeud_choisi = possibilite[i_eval];
      print("Choix en cours " + "i_noeud = " + i_noeud + "; i_noeud_choisi = " + i_noeud_choisi + "; N_possibilites = " + N_possibilites + "; Possibilites : ("); for (int i = 0; i < N_possibilites; i++) {print(possibilite[i] + ", ");} print("); sum = " + sum + "; alea = " + alea + '\n');
    
    dir = new PVector(graphe.pos[i_noeud_choisi].x - graphe.pos[i_noeud].x, graphe.pos[i_noeud_choisi].y - graphe.pos[i_noeud].y);
    float norme = sqrt(sq(dir.x) + sq(dir.y));
    dir = PVector.mult(dir, 1/norme);
    dir = PVector.mult(dir, 6);
    
    chemin = append(chemin, i_noeud_choisi);
    //Application phéromones : evolution graphe
    if (i_noeud == graphe.n-1) 
    {
      int l_chemin = chemin.length;
      float rapidite = 50;
      for (int i = 0; i < l_chemin-1; i++)
      {
        graphe.poids[graphe.i_arrete_de(chemin[i], chemin[i+1])] += rapidite/((float)l_chemin); 
        println("graphe.poids[graphe.i_arrete_de(i_noeud, i_noeud_choisi)] = " + graphe.poids[graphe.i_arrete_de(chemin[i], chemin[i+1])]);
        i_noeud = 0; 
        pos = graphe.pos[0]; 
        choisis();
      }
    }
  }
  
  void dessine()
  {
    stroke(0);
    ellipseMode(CENTER);
    fill(rgb); ellipse (pos.x, pos.y, cir, cir);
    fill(rgb1); ellipse (graphe.pos[i_noeud].x, graphe.pos[i_noeud].y, cir, cir);
    fill(rgb2); ellipse (graphe.pos[i_noeud_choisi].x, graphe.pos[i_noeud_choisi].y, cir, cir);
    stroke(0, 30); 
    noFill(); ellipse (graphe.pos[i_noeud].x, graphe.pos[i_noeud].y, 2*ray, 2*ray);
    line(graphe.pos[i_noeud].x, graphe.pos[i_noeud].y, graphe.pos[i_noeud_choisi].x, graphe.pos[i_noeud_choisi].y);
    //fill(0); ellipse (pos.x, pos.y, 2, 2);
  }
  
  void deplace()
  {
    pos = PVector.add(pos, dir);
    if (sq(pos.x - graphe.pos[i_noeud_choisi].x) + sq(pos.y - graphe.pos[i_noeud_choisi].y) <= sq(cir/2)) 
    {
      pos = graphe.pos[i_noeud_choisi]; 
      i_noeud = i_noeud_choisi;
      choisis();
    }
  }
}
  
void actu_fourmis()
{
  for (int i = 0; i < fourmi.length; i++) 
  {
    fourmi[i].dessine();
    fourmi[i].deplace();
  }
}

void draw()
{
  if (!(mousePressed)) {
  //background(backg);
  fill(200, 50); rect(0, 0, 2*WIDTH, 2*HEIGHT);
  graphe.dessine();
  actu_fourmis();}
}

