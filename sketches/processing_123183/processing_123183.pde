
ArrayList<Boule>boules;
Boule boule_rouge;


import ddf.minim.*;          //MUSIQUE
AudioPlayer player;          //MUSIQUE
Minim minim;                //MUSIQUE

float cs = 3;
color c = color(0, 0, 0, 100);
color b= color(255,0,0,100);
float t;
Par[][] p = new Par[200][200];        //classe de particules + Nombre 200+200



void setup() {
  size(800, 800, P2D);
  background(0);
  fill(0, 0, 0, 10);
  minim=new Minim(this);                                    //MUSIQUE
  player=minim.loadFile("Carmina Burana- O Fortuna.mp3");          //trouver fichier MUSIQUE
  player.play();                                            //play when open file
  stroke(0);
  for (int i = 0; i < p.length*p.length; i++) {
  p[i/p.length][i%p.length] = new Par(i/p.length*4, i%p.length*4, color(255, 255, 255, 100));
  }
  
  boule_rouge = new Boule(color(random(0,255),0,0,100)); //création d'une nouvelle boule
  
}
void draw() {
  stroke(0);   //couleur contour
  fill(0,0,0,10); //opacité
  rect(0, 0, width, height); //rectangle transparence
  for (Par[] d:p)for (Par q:d) {
    if (dist(q.x, q.y, boule_rouge.x, boule_rouge.y) < 20) q.couleur = color(random(0,255),0,0,100);
    q.update(); //contamination
  }
  t += 10110.01;
 
  boule_rouge.deplacer();
  boule_rouge.dessiner();
 
 
 
  }




class Par {
  float x;
  float y;
  float xv;
  float yv;
  float w;
  float ww;
  float gu;
  float hu;
  color couleur;
  
  Par(int x2, int y2, color c) {
    x = random(width);
    y = random(height);
    w = random(0.3, 1.5);       //VITESSE REPOUSSANTE
    ww = random(-1, 2.5);       //VITESSE ATTIRANTE
    gu = x2;
    hu = y2;
    couleur = c;   //atribution de la couleur
  }
  void update() {
    stroke(couleur);         //COULEUR
    float m = 1000;          //rapidité des particules
    float d = dist(x/m, y/m, width/2/m, height/2/m);      //SUIVRE LA SOURIS
    xv += 0.001*(width/2-x)*pow(d, ww)*w;            //SUIVRE LA SOURIS
    yv += 0.001*(height/2-y)*pow(d, ww)*w;            //SUIVRE LA SOURIS
    float drg = (noise(x/20+492, y/20+490, t*2.2)-0.5)/300 + 1.25;         //bruit provoqué par particules
    xv /= drg;  
    yv /= drg;
    xv += noise(x/20, y/20, t)-0.5;
    yv += noise(x/20, y/20+424, t)-0.5;
    x += xv;
    y += yv;
    //line(x, y, x-xv/3, y-yv/3);
    line(x, y, x-xv*10, y-yv*10);          //ligne produite par le bruit
  }
}

class Boule {
  //déclarer les propriétés
  float x, y;        // coordonnées
  float vx, vy;      // vitesse
  float diametre;    //diamètre
  color couleur;     //couleur
  //definir le constructeur
  Boule( color c) {
    x=random(width);
    y=random(height);
    vx=random(-2, 2) * 10;         //multiplication de la vitesse par 10 sur l'axe horizontal
    vy=random(-2, 2) * 10;         //multiplication de la vitesse par 10 sur l'axe vertical
    diametre=random(3, 15);        //diamètre aléatoire entre x et y (ici 3 et 15)
    couleur=c; 
    //couleur=color(random(255),random(255),0);
  }
  void deplacer() {
  x = x + random(-(50-4*(x/width)),50-4*(x/width));     //débatement x de la boule rouge
  if (x > width) x = width;
  if (x < 0) x = 0;
  y = y + random(-(50-4*(y/height)),50-4*(y/height));   //débatement y de la boule rouge
  if (y > height) y = height;
  if (y < 0) y = 0;
  }
  void dessiner() {
    noStroke();                          //sans contour
    fill(couleur);                       //couleur boule 
    //ellipse(x, y, diametre, diametre);      
  }
}



