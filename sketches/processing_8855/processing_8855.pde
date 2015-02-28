
final int WIDTH = 1000;
final int HEIGHT = 600;
int bord = 50;
int FrameRate = 60;
color backg = color(30, 130, 60);
float age_maturite = 3;
float duree_dvlpmt_embryon = 5;
color[] rgb = {color(0, 100, 230), color(230, 0, 100), color(0, 230, 160), color(255, 255, 255)};
int[] Nb_lapins = {};
int[][] evenements_importants = {};
int[] sexes_importants = {};
//PImage screen_capt;

ArrayList lapins;
int duree_vie_moy = 4; //en années
char[] sexes = {'m', 'f'};

Prairie prairie;

class Lapin
{
  char sexe;
  float age; //en mois?
  float taille;
  float age_mort;
  float barre_faim;
  //int personnalite;
 
  PVector pos;
  PVector dir;
  float allure;
  int date_naissance;
  Lapin mere_;
  //Lapin pere_;
  boolean enceinte;
  float age_rapport;
 
  Lapin()
  {
    age = 0;
    date_naissance = frameCount;
    pos = new PVector(random(0+bord, WIDTH-bord), random(0+bord, HEIGHT-bord));
    float tet = random(-PI, PI);
    dir = new PVector(1*cos(tet), 1*sin(tet));
    allure = random(1, 8);
    sexe = sexes[(int)random(0, 2)];
    age_mort = duree_vie_moy*12 + random(-10, 10);
    enceinte = false;
    barre_faim = 100;
  }
   
  Lapin (Lapin pere, Lapin mere)
  {
    age = -duree_dvlpmt_embryon;
    date_naissance = frameCount + (int)map(duree_dvlpmt_embryon, 0, 2, 0, FrameRate);
    sexe = sexes[(int)random(0, 2)];
    mere_ = mere;
    pos = new PVector(mere.pos.x, mere.pos.y);;
    taille = mere_.taille/2.0;//pppppppppppppppppppppppppppppppppppppprobleme
    allure = mere.allure;
    float tet = random(-PI, PI);
    dir = new PVector(1*cos(tet), 1*sin(tet));
    enceinte = false;
    mere.age_rapport = mere.age;
    pere.age_rapport = pere.age;
    age_mort = duree_vie_moy*12 + random(-10, 10);
    barre_faim = 100;
  }
 
  void dessine()
  {
      if (sexe == 'm') {stroke(red(rgb[0]), green(rgb[0]), blue(rgb[0])); fill(rgb[0]);} else {stroke(rgb[1]); fill(rgb[1]);} //Couleur progressif
      if (age < age_maturite) {stroke(rgb[3]); fill(rgb[3]);}
      if (age >= 0) {taille = map(age, 0, duree_vie_moy*12, 10, 50);}
      ellipse(pos.x, pos.y, taille, taille);
  }
  
  void actualise()
  {
    //Prend de l'age
    age += 2/(float)(FrameRate); //il prends deux mois toutes les secondes
    
    //Se deplace
    if (age < 0) 
      {pos = new PVector(mere_.pos.x, mere_.pos.y);}
    else //age >= 0
    {      
      float ori = atan2(dir.y, dir.x);
      float alea = random(-PI/8, PI/8);
      float norme = sqrt(sq(dir.x)+sq(dir.y));
      dir = new PVector(norme*cos(ori+alea), norme*sin(ori+alea));
      dir.normalize();
      if ((pos.x-taille/2.0 <= 0+bord)||(pos.x+taille/2.0 >= WIDTH-bord))  {dir.x *= -2;}
      if ((pos.y-taille/2.0 <= 0+bord)||(pos.y+taille/2.0 >= HEIGHT-bord)) {dir.y *= -2;}
      pos.add(PVector.mult(dir, allure));
      
      //barre_faim -= FrameRate/100.0; //La barre de vie de 100 points dure 10 s = 10*Framecount images;
      if ((sexe == 'f') && (age > age_rapport + duree_dvlpmt_embryon + 6)) {enceinte = false;}
      
      //AMOUR?/§
      
      //Se nourrit
      
    }
  }
  void mange(PVector position)
  {
    //prairie(pos) == false;
    barre_faim = 100;
  }
}
//if ((barre_faim < 50) && (prairie[pos] == true)) {mange(pos);}
//boolean prairie(PVector position)
//{
//  
//}
//  for (int i = 0; i < WIDTH; i+=30) {}
class Prairie
{
  int taille_herbe;
  boolean[][] herbe;
  int[][]age_sousterre;
  PVector[][] pos;
  int orig = 50;
  int Imax;
  int Jmax;
  
  Prairie(int taille)
  {
    taille_herbe = taille;
    Imax = (int) ((WIDTH-2*orig)/taille); 
    Jmax = (int) ((HEIGHT-2*orig)/taille);
    herbe = new boolean[Imax][Jmax];
    age_sousterre = new int[Imax][Jmax];
    pos = new PVector[Imax][Jmax];
    
    for (int i = 0; i < Imax; i++)
      {for (int j = 0; j < Jmax; j++)
         {herbe[i][j] = true; age_sousterre[i][j] = frameCount; pos[i][j] = new PVector(orig+taille + 2*taille*i, orig+taille + 2*taille*j);}
      }
  }
  void rafraichis()
  {
    for (int i = 0; i < Imax; i++)
      {for (int j = 0; j < Jmax; j++)
       {
         if (herbe[i][j] == false) {age_sousterre[i][j] ++;} else {age_sousterre[i][j] = 0;}
         if (age_sousterre[i][j] >= 3*FrameRate/1.0) {herbe[i][j] = true;} //la pousse est sous terre (ne repousse pas) pendant 3s;
       }
      }
  }
  void dessine()
  {
    for (int i = 0; i < Imax; i++)
      {for (int j = 0; j < Jmax; j++)
         {stroke(0); if (herbe[i][j] == false) {fill(backg);} else {fill(0);} ellipse(pos[i][j].x, pos[i][j].y, 2*taille_herbe, 2*taille_herbe);}
      }
  }
}
void setup()
{
  size(WIDTH, HEIGHT);
  smooth();
  noFill(); stroke(0); rect(bord, bord, WIDTH-2*bord, HEIGHT-2*bord);
 
  //IMPORTANT
  pause = false;
  prairie = new Prairie(100);
  ellipseMode(CENTER);
  lapins = new ArrayList();
  lapins_add(20);
}

void draw()
{
  //background(backg);
  if (pause == false)
  {
    fill(red(backg), green(backg), blue(backg), 20); noStroke(); rect(0, 0, WIDTH, HEIGHT);
    noFill(); stroke(0); rect(bord, bord, WIDTH-2*bord, HEIGHT-2*bord);
    //prairie.rafraichis();
    //prairie.dessine();
    
    for (int i = 0; i < lapins.size(); i++)
    {
      Lapin lapin = (Lapin) lapins.get(i);
      
      if (lapin.age >= lapin.age_mort) {lapins.remove(i); println(lapins.size()); int[] inter = {frameCount, 1}; evenements_importants = (int[][]) append(evenements_importants, inter);}
      if (lapin.barre_faim <= 0) {lapins.remove(i);}
      
      lapin.actualise();
      lapin.dessine();
      
      //Reprographie ------------------- Amour?§
      for (int j = 0; j < lapins.size(); j++)
      {
        float astrologie = random(0, 100); //50% de chances qd 2 individus de sexe opposés se rencontrent qu'ils aient un enfant
        Lapin lcompagnon = (Lapin) lapins.get(j);
        if ((lapin.sexe != lcompagnon.sexe) && (sq(lapin.pos.x-lcompagnon.pos.x)+sq(lapin.pos.y-lcompagnon.pos.y) < sq(25))) //(j != i) s'en va car remplacée par la cond sur le sexe
        {
          if (lapin.sexe == 'm')
            {if ((astrologie < 20) && (lapin.age >= age_maturite) && (lcompagnon.age >= age_maturite) && (lcompagnon.enceinte != true) && (lapin.age > lapin.age_rapport + 6) && (lcompagnon.age > lcompagnon.age_rapport + duree_dvlpmt_embryon + 6)) 
               {naissance_lapin(lapin, lcompagnon);}}
          else
            {if ((astrologie < 20) && (lapin.age >= age_maturite) && (lcompagnon.age >= age_maturite) && (lapin.enceinte != true) && (lapin.age > lapin.age_rapport + duree_dvlpmt_embryon + 6) && (lcompagnon.age > lcompagnon.age_rapport + 6))
               {naissance_lapin(lapin, lcompagnon);}}
        }
      }
    }
    if (lapins.size() == 0) {pause = true; graphique_naissances();} //exporte_naissances();}
  }
}

boolean pause;
void mouseClicked()
{
  if (mouseButton == LEFT)  {loop(); Lapin nouveau_ne = new Lapin(); lapins.add(nouveau_ne); gere_naissances(nouveau_ne);}
  if (mouseButton == RIGHT) {loop(); background(200); lapins.clear(); lapins_add(10);}
}

void keyPressed()
{
  
  if (key == 'p') {if (pause == false) {pause = true; noLoop();} 
  else {pause = false; loop();}}
  
  if (keyCode == ENTER) 
  {
    if (pause == false) 
    {
      
      //saveFrame("screen_capt.png");
      //screen_capt = loadImage("screen_capt.png");
      pause = true; 
      graphique_naissances();
    } 
    else {pause = false; loop();} //image(screen_capt, 0, 0);}
  }
}

void lapins_add(int n)
  {for (int i = 0; i < n; i++) {Lapin nouveau_ne = new Lapin(); lapins.add(nouveau_ne); gere_naissances(nouveau_ne);}}

void naissance_lapin(Lapin lapin1, Lapin lapin2)
{
  Lapin nouveau_ne;
  if (lapin1.sexe == 'm') 
    {nouveau_ne = new Lapin(lapin1, lapin2); lapin2.enceinte = true;} 
  else 
    {nouveau_ne = new Lapin(lapin2, lapin1); lapin1.enceinte = true;}
  lapins.add(nouveau_ne); gere_naissances(nouveau_ne);
}

void gere_naissances(Lapin bebe)  {println(lapins.size()); int[] inter = {frameCount, 0}; evenements_importants = (int[][]) append(evenements_importants, inter); sexes_importants = append(sexes_importants, bebe.sexe); }

/*
void exporte_naissances()
{
  PrintWriter output;
  output = createWriter("dates_naissances" + frameCount + ".txt");
  println ("N° output : " + frameCount + "; ");
  output.print("//Dates des Naissances" + '\n' + '\n' + "dates_importantes = {");
  int n_dates = evenements_importants.length;
  for (int i = 0; i < n_dates - 1; i++) {output.print(evenements_importants[i] + ", ");}
  output.print(evenements_importants[n_dates-1] + "}; ");
  output.flush();
  output.close();
}
*/

void graphique_naissances()
{
  pause = true;
  noLoop();
  //saveFrame("screen_capt.png");
  //screen_capt = loadImage("screen_capt.png");
  background(200);
  int nb_even = evenements_importants.length;
  int date_finale = evenements_importants[nb_even-1][0];
  int orig = 50;
  stroke(0); line(orig, orig, orig, HEIGHT-orig); line(orig, HEIGHT-orig, WIDTH-orig, HEIGHT-orig);
  
  int nb_lapins = 0; Nb_lapins = new int[0];// Nb_lapins[0] = 0;
  for (int i = 0; i < nb_even; i++)
  {
    if (evenements_importants[i][1] == 0) {nb_lapins ++;}
    if (evenements_importants[i][1] == 1) {nb_lapins --;}
    Nb_lapins = append(Nb_lapins, nb_lapins);
  }
  int Nmax = 0; for (int i = 0; i < nb_even; i++) {if (Nb_lapins[i] > Nmax) {Nmax = Nb_lapins[i];}}
  stroke(0);
  noFill();
  beginShape();
  for (int i = 0; i < nb_even; i++)
    {vertex(map(evenements_importants[i][0], 0, date_finale, orig, WIDTH-orig), map(Nb_lapins[i], 0, Nmax, HEIGHT-4*orig, orig));}
  endShape();
  
  //666666666666666-------------------------Age MOYEN
  //PrintWriter test;
  //test = createWriter("test.txt");
  //for (int i = 0; i < nb_even; i++) {test.print("");}  
}

