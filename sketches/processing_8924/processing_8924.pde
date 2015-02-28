
//Written by Jonathan Chemla
//Please contact me for non-private use ;)
//jos.chemla@gmail.com

int WIDTH = 500;
int HEIGHT = 500;
color backg = color(255);

//Param;
float Ea = 1; float Eb = 1; int wa = 3; int wb = 4; float pa = 0; float pb = PI/3;
float temps = 0;
boolean param_en_cours = false;
int choix = 0;
PVector Point;
PVector[] fenetre = {new PVector(-Ea, Ea), new PVector(-Eb, Eb)};
//PImage graphique;
//PImage fenetre_param;
boolean zoom_actif = false;
PVector[] zoom = {new PVector(0,0), new PVector(0,0)};
int n_modes = 3;
PFont font;

//Calcul des coordonées du point courant en fonction du temps (dépend du mode sélectionné).
void calcule_point(float t, int mode)
{
  if (mode == 0)
    {Point = new PVector(Ea*cos(wa*t+pa), Eb*cos(wb*t+pb));}  
  if (mode == 1)
    {Point = new PVector(t/(1+pow(t,4)), pow(t,3)/(1+pow(t,4)));}
  if (mode == 2)
    {Point = new PVector(pow(cos(t),3), pow(sin(t),3));}
}

//Tracé du point, en fonction de ses coordonnées et des paramètres d'affichage de la fenêtre
void trace_point()
  {stroke(0); strokeWeight(1); point(map(Point.x, fenetre[0].x, fenetre[0].y, 0, WIDTH), map(Point.y, fenetre[1].x, fenetre[1].y, HEIGHT, 0));}

void keyPressed()
{
  if (key == 'p') {background(backg); param_en_cours = !(param_en_cours); temps = 0; if (param_en_cours) {dessine_param();}}
  if (key == 'b') {background(backg);}
  /*if (((int)key >= (int)'0') && ((int)key <= (int)'9'))
    {t = 0; choix = ((int)key)-((int)'0');}
  if (keyCode == ENTER) 
  {
    PVector intermediaire_fenetre0 = new PVector(map(zoom[0].x, 0,WIDTH, fenetre[0].x,fenetre[1].x), map(zoom[0].y, HEIGHT,0, fenetre[0].y,fenetre[1].y));
    PVector intermediaire_fenetre1 = new PVector(map(zoom[1].x, 0,WIDTH, fenetre[0].x,fenetre[1].x), map(zoom[1].y, HEIGHT,0, fenetre[0].y,fenetre[1].y));
    //fenetre = {intermediaire_fenetre0, intermediaire_fenetre1};
    fenetre[0] = intermediaire_fenetre0;
    fenetre[1] = intermediaire_fenetre1;
  }*/
}

void zoome()
{
  stroke(50,25,160);
  fill(90,90,165,60);
  //image(graphique, 0,0);
  rect(zoom[0].x,zoom[0].y,(mouseX-zoom[0].x),(mouseY-zoom[0].y));
}

void mousePressed()
{
  if (!(param_en_cours))
  {
    //saveFrame("graphique.png");
    //graphique = loadImage("graphique.png");
    zoom_actif = true;
    zoom[0] = new PVector(mouseX,mouseY);
    
    if (mouseButton == RIGHT) {fenetre[0] = new PVector(-Ea, Ea); fenetre[1] = new PVector(-Eb, Eb);}
  }
}

void mouseReleased()
{
  if (zoom_actif)
  {
    zoom[1] = new PVector(mouseX,mouseY);
    //image(graphique, 0,0);
    zoom_actif = false;
  }
}

color gris;
color gris_tr;
  
void dessine_param() //Dessin de la fenêtre fixe 
{
  PVector ori0 = new PVector(20,40); //Origine permettant de déplacer aisémment une boite, tous les autres paramètres étant fixés plus ou moins par approximations.
  strokeWeight(1);
  background(240);
  gris = color(50);
  gris_tr = color(brightness(gris),30);
  textSize(40); fill(100);
  text("Parametrage", ori0.x, ori0.y);
  
  PVector ori1 = new PVector(40,70);
  stroke(gris); fill(gris_tr);
  rect(ori1.x, ori1.y, 80, 110);
  fill(255);
  textSize(25); text("Mode",ori1.x+10, ori1.y+20); textSize(20);
  for (int i = 0; i < n_modes; i++)
    {ellipse(ori1.x+15, ori1.y+45+i*25, 10, 10); text(i, ori1.x+30, ori1.y+50+i*25);}
  
  PVector ori2 = new PVector(150,70);
  stroke(gris); fill(gris_tr);
  rect(ori2.x,ori2.y,250,110);
  fill(255);
  textSize(25); text("Bornes",ori2.x+10,ori2.y+20);
  strokeWeight(10); stroke(gris_tr);
  for (int i=0;i<4;i++) {line(ori2.x+85,ori2.y+30+20*i,ori2.x+210,ori2.y+30+20*i);} 
  strokeWeight(1); stroke(255); textSize(20); String[] txt_f = {"x0","y0","x1","y1"};
  for (int i=0;i<4;i++) {text(txt_f[i],ori2.x+220,ori2.y+30+20*i);} 
  
  PVector ori3 = new PVector(20,200);
  stroke(255); fill(gris_tr);
  rect(ori3.x,ori3.y,440,95);
  textSize(20); fill(255);
  text("Mode 0 : ",ori3.x+20,ori3.y+25);
  fill(255,150);
  for (int i=0; i<2; i++) {rect(ori3.x+332,ori3.y+14+i*16,30,14);}
  for (int i=2; i<4; i++) {rect(ori3.x+332,ori3.y+14+i*16,100,14);}
  fill(gris);
  textSize(18); text("x(t) = Xo*cos(w1*t+p1)" + '\n' + "y(t) = Yo*cos(w2*t+p2)",ori3.x+30,ori3.y+40);

  PVector ori4 = new PVector(20, 310);
  stroke(255); fill(gris_tr);
  rect(ori4.x,ori4.y,440,150);
  textSize(30); fill(100);
  text("Controles",ori4.x+10,ori4.y+30);
  fill(gris);
  textSize(18); text("p : parametrage" + '\n' + "b : efface l'écran" + '\n' + "0,1,2 : change de mode de courbe" + '\n' + "clic/released : zoom",ori4.x+30,ori4.y+60);
  
  //saveFrame("fenetre_param.png");
  //fenetre_param = loadImage("fenetre_param.png");
}

void parametrage() //Parametrages bourins : tout est a mettre dans une classe param_box avec gestion fenetres-titres et type de param (slider, entrée clavier...)
{
  //image(fenetre_param, 0,0); //Origines
  dessine_param();
  
  PVector ori1 = new PVector(40,70);
  PVector ori2 = new PVector(150,70);
  PVector ori3 = new PVector(20,200);
  PVector ori4 = new PVector(20, 310);
  gris = color(50);
  gris_tr = color(brightness(gris),30);
  
  //Mode
  fill(gris);
  ellipse(ori1.x+15,ori1.y+45+choix*25,10,10);
  fill(gris);
  
  //Sliders des bornes de la fenêtre (Bof, peut-être à enlever
  PVector[][] slider = { {new PVector(ori2.x+85, ori2.x+210),new PVector(ori2.y+27, ori2.y+40)}, {new PVector(ori2.x+85, ori2.x+210),new PVector(ori2.y+45, ori2.y+57)}, {new PVector(ori2.x+85, ori2.x+210),new PVector(ori2.y+67, ori2.y+78)}, {new PVector(ori2.x+85, ori2.x+210),new PVector(ori2.y+88, ori2.y+100)}};
  fill(gris);
  ellipse(map(fenetre[0].x, -3, 0, slider[0][0].x, slider[0][0].y), slider[0][1].x+3, 10, 10);
  ellipse(map(fenetre[0].y, 0, +3, slider[1][0].x, slider[1][0].y), slider[1][1].x+3, 10, 10);
  ellipse(map(fenetre[1].x, -3, 0, slider[2][0].x, slider[2][0].y), slider[2][1].x+3, 10, 10);
  ellipse(map(fenetre[1].y, 0, +3, slider[3][0].x, slider[3][0].y), slider[3][1].x+3, 10, 10);
  text(fenetre[0].x, ori2.x+10,ori2.y+35);
  text(fenetre[0].y, ori2.x+10,ori2.y+55);
  text(fenetre[1].x, ori2.x+10,ori2.y+75);
  text(fenetre[1].y, ori2.x+10,ori2.y+95);
  
  if ((mouseX>ori3.x+332)&&(mouseX<ori3.x+362)&&(mouseY>ori3.y+14)&&(mouseY<ori3.y+28)) 
  {
    fill(gris_tr); rect(ori3.x+332,ori3.y+14,30,14); 
    if (keyPressed) {wa = ((int)key-(int)'0');}
  }
  if ((mouseX>ori3.x+332)&&(mouseX<ori3.x+362)&&(mouseY>ori3.y+30)&&(mouseY<ori3.y+44))
  {
    fill(gris_tr); rect(ori3.x+332,ori3.y+30,30,14); 
    if (keyPressed) {wb = ((int)key-(int)'0');}
  }
   
  //Changement des phases p1 et p2 de chacun des attributs, par slide/affichage de la valeur réelle
  PVector[][] p_slide = {{new PVector(ori3.x+332, ori3.x+432), new PVector(ori3.y+14+2*16, ori3.y+14+2*16+14)}, {new PVector(ori3.x+332, ori3.x+432), new PVector(ori3.y+14+3*16, ori3.y+14+3*16+14)}};
  fill(gris_tr); 
  rect(p_slide[0][0].x, p_slide[0][1].x, map(pa, 0, TWO_PI, p_slide[0][0].x, p_slide[0][0].y)-p_slide[0][0].x, p_slide[0][1].y-p_slide[0][1].x);
  rect(p_slide[1][0].x, p_slide[1][1].x, map(pb, 0, TWO_PI, p_slide[1][0].x, p_slide[1][0].y)-p_slide[1][0].x, p_slide[1][1].y-p_slide[1][1].x);
  fill(gris); textSize(16); text("w1 = " + wa + '\n' + "w2 = " + wb +'\n' + "p1 = " + pa + '\n' + "p2 = " + pb,ori3.x+290,ori3.y+27); //slider pour p2-p1 // + (pa-pb)
   
  if (mousePressed)
  {
    //Mode
    if ((sq(mouseX-(ori1.x+15))+sq(mouseY-(ori1.y+45))) < sq(10)) {choix = 0;}
    if ((sq(mouseX-(ori1.x+15))+sq(mouseY-(ori1.y+70))) < sq(10)) {choix = 1;}
    if ((sq(mouseX-(ori1.x+15))+sq(mouseY-(ori1.y+95))) < sq(10)) {choix = 2;}

    //Bornes
    if ((mouseX>slider[0][0].x)&&(mouseX<slider[0][0].y)&&(mouseY>slider[0][1].x)&&(mouseY<slider[0][1].y)) {fenetre[0].x = map(mouseX, slider[0][0].x, slider[0][0].y, -3, 0);}
    if ((mouseX>slider[1][0].x)&&(mouseX<slider[1][0].y)&&(mouseY>slider[1][1].x)&&(mouseY<slider[1][1].y)) {fenetre[0].y = map(mouseX, slider[1][0].x, slider[1][0].y, 0, +3);}
    if ((mouseX>slider[2][0].x)&&(mouseX<slider[2][0].y)&&(mouseY>slider[2][1].x)&&(mouseY<slider[2][1].y)) {fenetre[1].x = map(mouseX, slider[2][0].x, slider[2][0].y, -3, 0);}
    if ((mouseX>slider[3][0].x)&&(mouseX<slider[3][0].y)&&(mouseY>slider[3][1].x)&&(mouseY<slider[3][1].y)) {fenetre[1].y = map(mouseX, slider[3][0].x, slider[3][0].y, 0, +3);}
    
    //Phases
    if ((mouseX>p_slide[0][0].x)&&(mouseX<p_slide[0][0].y)&&(mouseY>p_slide[0][1].x)&&(mouseY<p_slide[0][1].y)) {pa = map(mouseX, p_slide[0][0].x, p_slide[0][0].y, 0, TWO_PI);}
    if ((mouseX>p_slide[1][0].x)&&(mouseX<p_slide[1][0].y)&&(mouseY>p_slide[1][1].x)&&(mouseY<p_slide[1][1].y)) {pb = map(mouseX, p_slide[1][0].x, p_slide[1][0].y, 0, TWO_PI);}
  }  
}

void setup()
{
  size(WIDTH, HEIGHT);
  smooth();
  background(backg);
  font = loadFont("CourierNew36.vlw");
  textFont(font);
  ellipseMode(CENTER);
}

void draw()
{
  if (!(param_en_cours))
  {
    if (zoom_actif) {zoome();}
    if (!(param_en_cours)&&!(zoom_actif)) 
    {
      calcule_point(temps, choix);
      trace_point();
      temps+=0.01;
    }
  }
  else {parametrage();}
  
}

