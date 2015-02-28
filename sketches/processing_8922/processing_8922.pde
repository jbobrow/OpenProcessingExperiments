
//Album Photos version No2
//Les photos utilisées proviennent du site http://www.photo-libre.fr ,
//Mais je vous conseille vraiment d'essayer avec vos photos personelles,
//ca rend vraiment bien, c'est plus joli et ca fait plus plaisir.

//Il faut impérativement que vous renomiez vos photos :
//Image01.jpg, Image02.jpg, Image03.jpg ûis Image011.jpg, Image012.jpg, Image013.jpg et Image020.jpg, Image021.jpg;
//Ca se fait assez facilement avec certains logiciels, sous Ububntu j'ai utilisé Phatch PhotoBatchProcessor,
//et vos photos doivent redimensionnées à environ 300pixels de longeur;
//Sinon, vous pouvez modifier le nom de vos photos sur la ligne qu'il faut, après avoir renommé vos fichiers en masse.

//Written by Jonathan Chemla,
//Please contact me for non-private use ;)
//jos.chemla@gmail.com

int imax = 30; //Nombre d'images affichées
PImage[] Image = new PImage[imax]; //Tableau stockant ces images

//Position de la caméra
float x;
float y;
float z;
float alp = 0;
float tet = PI/2;
float ray = 2000;

//Positions des images
float[] xim = new float[imax];
float[] yim = new float[imax];
float[] zim = new float[imax];


void setup()
{
  size(500,500,P3D);
  background(0);
  smooth();
  imageMode(CENTER);

  //Attribution des images à leur position du tableau
  for (int i = 0; i < Image.length; i++)
  {Image[i] = loadImage("Image0" + i + ".jpg");} //Ligne définissant le nom des photos

  genere_positions();   //Attribution de leur position aléatoire
}

void draw()
{
  gestion_clavier();
  gestion_souris();
  
  actualise_camera();
  affiche_images();
}

void keyPressed()
{
  if (keyCode == ENTER) {saveFrame();}
  if (keyCode == BACKSPACE) {genere_positions();}  //Recalcul aléatoire des positions qd cette touche est pressée
}

void genere_positions()
{
  for (int i = 0; i < imax; i ++)
  {
    xim[i] = random(-500, 500);
    yim[i] = random(-500, 500);
    zim[i] = random(-500, 500);
  }
}

void gestion_clavier()
{
  //Fonctions de déplacement avec la caméra, à l'aide des flèches (coordonées sphériques)
  if ((keyPressed == true) && (keyCode == LEFT)) {tet += 0.1; println("p");}
  if ((keyPressed == true) && (keyCode == RIGHT)) {tet -= 0.1;}
  if ((keyPressed == true) && (keyCode == UP)) {alp -= 0.1;}
  if ((keyPressed == true) && (keyCode == DOWN)) {alp += 0.1;}
  if ((keyPressed == true) && (key == '+')) {ray -= 10;}
  if ((keyPressed == true) && (key == '-')) {ray += 10;}
}

void gestion_souris() //Deplacement par le decalage de la souris au centre de l'image
{
  float dplcmt_x = map(mouseX, 0, width,  -0.08, 0.08); //Vitesse proportionelle à l'écartement, valeurs extrêmes, 
  float dplcmt_y = map(mouseY, 0, height, 0.08, -0.08);
  //Bandes de non-action
  if (sq(dplcmt_x) < sq(0.01)) {dplcmt_x = 0;}  
  if (sq(dplcmt_y) < sq(0.01)) {dplcmt_y = 0;}  
  //Modification des angles
  alp += dplcmt_y;
  tet += dplcmt_x;
}

void affiche_images() //Fonction d'affichage des images
{
  lights();
  background(0);
  stroke(255);
  
  for (int i = 0; i < imax; i ++)
  {
    line(0, 0, 0, xim[i], yim[i], zim[i]);

    translate(xim[i], yim[i], zim[i]);
    image(Image[i], 0, 0);
    translate(-xim[i], -yim[i], -zim[i]);
  }
} 

void actualise_camera()
{
  //Calcul de la position de la caméra
  x = ray * cos(alp) * cos(tet);
  z = ray * cos(alp) * sin(tet);
  y = ray * sin(alp);
  camera(x, y, z,
        00, 00, 00,
        00, 01, 00);
}
  

