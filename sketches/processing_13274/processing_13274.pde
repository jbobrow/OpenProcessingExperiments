
//Banc d'individus
//Written by Jonathan Chemla
//Please contact me for non privcate use :)

//Tableau general contenant l'ensemble des elements
int N_indiv;
ArrayList individu;

float Ray = 50;
float tet_max = PI/64;
boolean pause;

class Indiv //Classe individu, gerant la position, vitesse, ori, influence de chaque individu
{
  PVector pos;
  float vit;
  float ori;
  float p_ori;
  color rgb;
  float influ;
  ArrayList voisins;
  ArrayList amis;
  
  //Constructeurs
  Indiv (PVector pos_i, float ori_i, float influ_i)
  {
    pos = pos_i;
    vit = random(3.0, 3.2);
    ori = ori_i;
    p_ori = ori;
    influ = influ_i;
    rgb = color(5, 50, 160, influ * 200 + 20);
    voisins = new ArrayList();
    amis = new ArrayList();
  }
  Indiv ()
  {
    pos = new PVector((int)random(0, width), (int)random(0, height));
    vit = random(3.0, 3.2);
    ori = random(0, TWO_PI);
    p_ori = ori;
    influ = random(0, 1); //influ = influ/2;
    rgb = color(5, 50, 160, influ * 200 + 20);
    voisins = new ArrayList();
    amis = new ArrayList();
  }
  
  //Influence du groupe dans son voisinnage sur l'orientation de l'individu
  void modifie_ori()
  {
    voisins = new ArrayList();
    PVector resul_ori = new PVector(0, 0);
    float sum_influ = 0;
    
    for (int j = 0; j < N_indiv; j++)
    {
      Indiv indiv_i = (Indiv)individu.get(j);
      if ((sq(pos.x - indiv_i.pos.x) + sq(pos.y - indiv_i.pos.y) < sq(Ray)) && (pos.x != indiv_i.pos.x) && (pos.y != indiv_i.pos.y)) //Si voisin, alors
      {
        voisins.add(j);
        if (amis.size() == 0) {amis.add(j);} if (amis.size() > 0) {int k = 0; while(((Integer)amis.get(k) != j)&&(k < amis.size()-1)) {k++;} if ((k == amis.size()-1)&&((Integer)amis.get(k) != j)) {amis.add(j);}}
        sum_influ += indiv_i.influ;
        resul_ori.add(PVector.mult(new PVector(cos(indiv_i.p_ori), sin(indiv_i.p_ori)), indiv_i.influ)); //Resultante de chaque ori sous forme vectorielle, fonction aussi de l'influence de chacun
      }
    }
    if (sum_influ != 0) {resul_ori.mult(1/sum_influ);} //Ponderation (barycentre), div masse totale pour homogeneite
    resul_ori = PVector.add(PVector.mult(resul_ori, (0.05*1/(influ) - 0.03)/4), new PVector(cos(p_ori), sin(p_ori))); //Gestion influence du groupe/volonte propre de l'individu
    ori = atan2(resul_ori.y, resul_ori.x); //Deduction de l'ori sous forme angulaire
    if (ori - p_ori > tet_max)  {ori += tet_max;}
    if (ori - p_ori < -tet_max) {ori -= -tet_max;}
  }
  
  void actu() //Actualisation des coordonées
  {
    pos = new PVector(pos.x + vit*cos(ori), pos.y + vit*sin(ori));
    p_ori = ori;
    
    if (pos.x < 0) {pos.x = width;}
    if (pos.y < 0) {pos.y = height;}
    if (pos.x > width) {pos.x = 0;}
    if (pos.y > height) {pos.y = 0;}
  }
  
  void aff() //Affichage de l'individu
  {
    stroke(5, 50, 160);
    fill(rgb);
    ellipse(pos.x, pos.y, 10, 10);
    line(pos.x, pos.y, pos.x + 14*cos(ori), pos.y + 14*sin(ori));
    
    /*translate(+pos.x, +pos.y);
    rotate(ori);
    beginShape();
    int tay = 25;
    vertex(tay, 0); vertex(0, -tay/3); vertex(0, +tay/3);
    endShape(CLOSE);
    rotate(-ori);
    translate(-pos.x, -pos.y);*/
  }
}

void modif_ori()
{
  for (int i = 0; i < N_indiv; i++)
    {((Indiv)individu.get(i)).p_ori = ((Indiv)individu.get(i)).ori;}
}


void setup()
{
  size(600, 600);
  smooth();
  ellipseMode(RADIUS);
  stroke(0);
  
  N_indiv = 100;
  individu = new ArrayList();
  for (int i = 0; i < N_indiv; i++)
    {individu.add(new Indiv());}
  pause = false;
}

void draw()
{
  if (!pause) //Affichage et evolution du banc d'individus.
  {
    background(255);
    for (int i = 0; i < N_indiv; i++)
    {
      ((Indiv)individu.get(i)).modifie_ori();
      ((Indiv)individu.get(i)).actu();
      ((Indiv)individu.get(i)).aff();
    }
    modif_ori();
  }
  else //Pour connaitre les relations entre individus, voisins, selection...
  {
    background(255);
    for (int i = 0; i < N_indiv; i++) {((Indiv)individu.get(i)).rgb = color(5, 50, 160, ((Indiv)individu.get(i)).influ * 200 + 20);}
    for (int i = 0; i < N_indiv; i++)
    {
      Indiv indiv_i = ((Indiv)individu.get(i));
      if(sq(indiv_i.pos.x - mouseX) + sq(indiv_i.pos.y - mouseY) < sq(10))
      {
        indiv_i.rgb = color(8, 160, 40, indiv_i.influ * 200 + 20);
        for (int j = 0; j < indiv_i.amis.size(); j++)
        {
          if (indiv_i.amis.size() != 0)
          {((Indiv)individu.get((Integer)indiv_i.amis.get(j))).rgb = color(230, 230, 40, ((Indiv)individu.get((Integer)indiv_i.amis.get(j))).influ * 200 + 20);}
          //println(indiv_i.amis);
        }
        for (int j = 0; j < indiv_i.voisins.size(); j++)
          {((Indiv)individu.get((Integer)indiv_i.voisins.get(j))).rgb = color(160, 8, 10, ((Indiv)individu.get((Integer)indiv_i.voisins.get(j))).influ * 200 + 20);}
      }
    }
    for (int i = 0; i < N_indiv; i++) {((Indiv)individu.get(i)).aff();}
  }
}

void mousePressed()
{
  if (mouseButton == RIGHT) {individu = new ArrayList();
                             for (int i = 0; i < N_indiv; i++)
                               {individu.add(new Indiv());}}
  if (mouseButton == LEFT)  {N_indiv ++; individu.add(new Indiv());}
}
void keyPressed()
{
  if (key == 'p') {pause = !pause;}
}               
