
//Written by Jonathan Chemla
//Please contact me for non-private use ;)
//jos.chemla@gmail.com

  PFont font;
  int WIDTH = 1024; int HEIGHT = 740;

class Objet
{
  //---Objets texte, positionnables et orientables---\\
  PVector pos;
  String txt;
  float h;
  float ori;
  
  boolean respire = true;
  int col;
  float rd; //variable aléatoire, pour random
  float omeg;
  float amp;
  
  color trait = color(0);
  color surb = couleurs[0];
  color rempl = color(brightness(surb), 200);
  
  /*Par défaut*/
  Objet () { 
             this (new PVector(WIDTH/2, HEIGHT/2), "Idée", 60, 0);
           }
  
  Objet (PVector pos_i,
         String texte,
         float h_i,      
         float ori_i)
  {pos = pos_i;
   txt = texte;
   font = loadFont("Eureka-90.vlw");
   h = h_i;
   ori = ori_i;
   
   rd = random(0,PI);
   amp = random(0,1);
   omeg = random(1/20.0, 1/10.0);
   col = 0;
   isClicked = false;
   nb_lettres = txt.length();
   nb_lettres_cur = nb_lettres;}
  
  
  //Objet () {  Objet(new PVector(300,300), "", h = 100, ori = 0);  }
  
  int nb_lignes = 1;
  int nb_lettres;
  int nb_lettres_cur;
  void modif_texte()
  {
    if (((int)key > 30)&&((int)key < 255))    //if ((((int)key >= (int)'a') && ((int)key <= (int)'z')) || (key == ' '))
    {
      //String KEY = (new String(new char[] {(char)key})).toUpperCase(); if (maj) {txt += KEY;} else {txt += (char)key;}
      txt += (char)key;
      nb_lettres_cur ++; if (nb_lettres_cur > nb_lettres) {nb_lettres = nb_lettres_cur;}
    }
    if (keyCode == ENTER)
      {txt += '\n'; nb_lignes ++; nb_lettres_cur = 0;}
    if (key == BACKSPACE)
    {
      if (txt.length() > 1) {if (txt.substring(txt.length() - 2, txt.length() - 1).equals("\n") == true) {nb_lignes --;}}
      if (txt.length() > 0) {txt = txt.substring(0, txt.length() - 1);}
      if (nb_lettres == nb_lettres_cur) {nb_lettres --;} nb_lettres_cur --;
    }
  }
  
  void affiche()
  {
    translate(pos.x, pos.y);
    rotate(ori);
    stroke(trait);
    fill(rempl);
    if ((isSelected() == true)||(isClicked == true)) {fill(surb);}
    textAlign(LEFT, BOTTOM);
    textFont(font, h);
    
    //Ecrire l'idée
    text(txt, 0, 0);
    if (isClicked == true) {rotate(PI/4); rectMode(CENTER); rect(0, 0, h/2, h/2); rotate(-PI/4); ellipse(h/2.0*nb_lettres, 0, h/2, h/2);}
    ellipse(0,0, h/4, h/4);
    
    rotate(-ori);
    translate(-pos.x, -pos.y);
  }
  
  int ep = 30;
  boolean isSelected()
  {
    PVector mouse_chgmt = new PVector((mouseX-pos.x)*cos(ori) + (mouseY-pos.y)*sin(ori), (mouseY-pos.y)*cos(ori) - (mouseX-pos.x)*sin(ori));
    return((mouse_chgmt.x >= 0 - ep)&&(mouse_chgmt.x <= h/2.0*nb_lettres + ep)&&(mouse_chgmt.y > -nb_lignes*h - ep)&&(mouse_chgmt.y < 0 + ep));
  }
  boolean isTurned()
  {
    PVector mouse_chgmt = new PVector((mouseX-pos.x)*cos(ori) + (mouseY-pos.y)*sin(ori), (mouseY-pos.y)*cos(ori) - (mouseX-pos.x)*sin(ori));
    return( (sq(mouse_chgmt.x - (h/2.0*nb_lettres)) + sq(mouse_chgmt.y - 0)) < sq(h/2.0/2) );
  }
  boolean isClicked;
  
  void respire()
    {if (respire) {h += amp*cos((frameCount*omeg)+rd);}}
}

int Nmax = 35;
Objet[] objets = new Objet[Nmax];
Objet obj_def;
int Nb_couleurs = 30;
color[] couleurs = new color[Nb_couleurs];
//couleurs[0] = color(255);
boolean NB = true;
color backg;
int i_cur = 0; //Compteur courant du nombre d'objets à gérer

void setup()
{
  size(WIDTH, HEIGHT); //P2D?
  //frameRate(100);
  smooth();
  
  if (NB == true) {backg = color(050);} else {backg = color(250);}
  if (NB) {couleurs[0] = color(255);} else {couleurs[0] = color(0);}
  for (int i = 1; i < couleurs.length; i++) {couleurs[i] = color(random(0, 255), random(0, 255), random(0, 255));}
  background(backg);
  
  obj_def = new Objet(new PVector(WIDTH/2.0 - 100, 100), "Idées", 100, 0);
  
  objets[0] = new Objet(obj_def.pos, obj_def.txt, obj_def.h, obj_def.ori);
  for (int i = 1; i < Nmax; i++) {objets[i] = new Objet();}
  //initialise();
}

void draw()
{
  background(backg);
  for (int i = 0; i < i_cur+1; i++)
    {
      objets[i].affiche();
      objets[i].respire();
    }
}

void mouseDragged()
{
  for (int i = 0; i < i_cur+1; i++)
    {if (objets[i].isSelected()) {objets[i].pos = new PVector(objets[i].pos.x+(mouseX-pmouseX), objets[i].pos.y+(mouseY-pmouseY));}}
}

void mousePressed()
{
  if ((mouseButton == RIGHT)&&(i_cur < Nmax-1)) 
  {
    i_cur ++;
    objets[i_cur].pos = new PVector(mouseX, mouseY);
    objets[i_cur].ori = obj_def.ori;
  }
  for (int i = 0; i < i_cur+1; i++)
  {
    if (objets[i].isSelected()) {objets[i].isClicked = !objets[i].isClicked;}
    //if (objets[i].isClicked == true)    {objets[i].surb = color(random(0, 255));}
  }
}

void keyPressed()
{
  println((int)key);
  for (int i = 0; i < i_cur+1; i++)
  {
    if (objets[i].isSelected()) 
    {
      if (keyCode == LEFT)  {objets[i].ori -= PI/64;}
      if (keyCode == RIGHT) {objets[i].ori += PI/64;}
      if (keyCode == UP)    {objets[i].h += 4;}
      if (keyCode == DOWN)  {objets[i].h -= 4;}
      
      if (key == '1')       {objets[i].respire = !(objets[i].respire);}
      
      if (key == '_')       {objets[i].col  = ((objets[i].col - 1) % (Nb_couleurs)); 
                             if (objets[i].col < 0) {objets[i].col = Nb_couleurs - 1;}
                             objets[i].surb = couleurs[objets[i].col];
                             objets[i].rempl = color(red(objets[i].surb), green(objets[i].surb), blue(objets[i].surb), 200);}
      
      if (key == 'ç')       {objets[i].col  = ((objets[i].col + 1) % (Nb_couleurs));
                             objets[i].surb = couleurs[objets[i].col];
                             objets[i].rempl = color(red(objets[i].surb), green(objets[i].surb), blue(objets[i].surb), 200);}
                             
      
      if ((((int)key > 30)&&((int)key < 255)&&(key != '_')&&(key != 'ç')) || (key == BACKSPACE) || ((int) key > 256) || (keyCode == ENTER))
      {
        objets[i].modif_texte();
      }
      
    }
  }
  if (keyCode == ENTER) {}//saveFrame(); sauvegarde();}
}

/*PrintWriter output;
void sauvegarde()
{
  output = createWriter("sauvegarde.pde");
  output.println("void initialise() {");
  
  output.println("//Couleurs");
  for (int i = 0; i < Nb_couleurs; i++)
    {output.println("couleurs[" + i + "] = " + "color(" + red(couleurs[i]) + ", " + green(couleurs[i]) + ", " + blue(couleurs[i]) + ");");}
  output.println();
  
  for (int i = 0; i <= i_cur; i++)
  {
    output.print("//Objet " + i + '\n');
    output.println("objets[" + i + "].pos = new PVector(" + objets[i].pos.x + ", " + objets[i].pos.y + ");");
    output.println("objets[" + i + "].txt = " + '"' + objets[i].txt + '"' + ";");
    output.println("objets[" + i + "].h = " + objets[i].h + ";");
    output.println("objets[" + i + "].ori = " + objets[i].ori + ";");
    output.println("objets[" + i + "].respire = true;");
    output.println("objets[" + i + "].col = " + objets[i].col + ";");
    output.println("objets[" + i + "].rd = " + objets[i].rd + ";");
    output.println("objets[" + i + "].omeg = " + objets[i].omeg + ";");
    output.println("objets[" + i + "].amp = " + objets[i].amp + ";");
    output.println("objets[" + i + "].nb_lignes = " + objets[i].nb_lignes + ";");
    output.println("objets[" + i + "].nb_lettres = " + objets[i].nb_lettres + ";");
    output.println("objets[" + i + "].nb_lettres_cur = " + objets[i].nb_lettres_cur + ";");
    output.println(); output.println();
  }
  
  output.println("i_cur = " + i_cur + "; }");
  output.println("NB = " + NB + "; }");
  
  output.flush();
  output.close();
}

*/
void initialise() {}

