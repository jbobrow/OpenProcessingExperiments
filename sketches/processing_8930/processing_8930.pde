
class Balle_rebond 
{ 
  PVector pos; 
  PVector vit; 
  PVector acc; 
  PVector Forces; 
  float mass; 
  float ray; 
  color rgb; 
  color surb; 
   
  float dt = 0.6; 
   
  //Constructeurs 
  Balle_rebond(PVector pos_i, 
               PVector vit_i, 
               PVector acc_i, 
               float mass_i, 
               float ray_i, 
               color rgb_i) 
  { 
    pos = pos_i; 
    vit = vit_i; 
    acc = acc_i; 
    Forces = new PVector(0, 0); 
    mass = mass_i; 
    ray = ray_i; 
    rgb = rgb_i; 
    surb = color(red(rgb)+30, green(rgb)+30, blue(rgb)+30); 
  } 
   
  Balle_rebond(PVector pos_i, 
               PVector vit_i, 
               PVector acc_i, 
               float mass_i) 
    //{this (pos_i, vit_i, acc_i, mass_i, mass_i*100, color(palette.get((int)random(0, palette.width), 0)));} 
    {this (pos_i, vit_i, acc_i, mass_i, mass_i*100, palette[(int)random(0, palette.length)]);} 
   
  Balle_rebond(PVector pos_i, 
               PVector vit_i, 
               float mass_i) 
    {this (pos_i, vit_i, new PVector(0, 100), mass_i);} 
   
                
  Balle_rebond() 
    {this (new PVector(100, 100), new PVector(10, 10), 50);} 
   
  //Fonctions de la classe 
  boolean estSelect() 
  { 
    return (sq(pos.x - mouseX) + sq(pos.y - mouseY) <= sq(ray)); 
  } 
   
  void parame() 
  { 
    if (estSelect()) 
    { 
      if ((keyPressed) && (keyCode == UP))    {ray += 10; mass = ray/100;} 
      if ((keyPressed) && (keyCode == DOWN))  {ray -= 10; mass = ray/100;} 
      if ((keyPressed) && (keyCode == LEFT))  {vit.mult(1/1.1);} 
      if ((keyPressed) && (keyCode == RIGHT)) {vit.mult(1.1);} 
    } 
  } 
  void actu() //Integration Newton 
  { 
    Forces = new PVector(0, 2*mass); //Poids --- possibilité frottements, interaction particules 
    acc = PVector.mult(Forces, 1/mass); 
    vit = PVector.add(vit, PVector.mult(acc, dt)); 
    pos = PVector.add(pos, PVector.mult(vit, dt)); 
  } 
   
  void aff() //Affichage 
  { 
    ellipseMode(RADIUS); 
    fill(rgb); if (estSelect()) {fill(surb);} 
    ellipse(pos.x, pos.y, ray, ray); 
  } 
} 
 
color backg = #A4ABF2; 
//PImage palette; 
color[] palette = {#6FCCDB, #67CDDB, #5cc8d5, #13464a, #041c1e, #071b1c, #051719, #031112}; 
int Nballes = 20; 
Balle_rebond[] balles; 
int i_cour; 
PVector pos_clic; 
 
void setup() 
{ 
  size(950, 720); 
  smooth(); 
  background(backg); 
  //palette = loadImage("palette.jpg"); 
   
  balles = new Balle_rebond[Nballes]; 
  for (int i = 0; i < 3; i++) {balles[i] = new Balle_rebond(new PVector(random(100, width-100), random(100, height/2)), new PVector(random(-width/50, width/50), random(-height/50, height/50)), random(0.2, 1.0)); i_cour = i;} 
   
} 
 
void mousePressed() 
{ 
  if (mouseButton == LEFT) 
    {pos_clic = new PVector(mouseX, mouseY);} 
  if (mouseButton == RIGHT) //Reinitialisation 
    {i_cour = 0;} 
} 
 
void mouseReleased() 
{ 
  if (mouseButton == LEFT) //Creation de la balle 
    //{if (i_cour < Nballes) {balles[i_cour] = new Balle_rebond(new PVector(mouseX, mouseY), new PVector(random(-10, 10), random(-10, 10)), random(50, 75)); i_cour++;}}  aléa 
    {if (i_cour < Nballes) {balles[i_cour] = new Balle_rebond(pos_clic, new PVector((mouseX - pos_clic.x)/10, (mouseY - pos_clic.y)/10), random(0.2, 1.0)); i_cour++;}} 
} 
 
void draw() 
{ 
  background(backg); 
  for (int i = 0; i < i_cour; i++) 
  { 
    //Verif Chocs parois 
    if ((balles[i].pos.x <= balles[i].ray+balles[i].ray/10)|(balles[i].pos.x >= width-(balles[i].ray+balles[i].ray/10)))  {balles[i].vit.x *= -1;} 
    if ((balles[i].pos.y <= balles[i].ray)|(balles[i].pos.y >= height-balles[i].ray)) {balles[i].vit.y *= -1;} 
     
    //Collision autres balles. 
    for (int j = 0; j < i_cour; j++) 
    { 
      if ((j != i)&&(sq(balles[i].pos.x - balles[j].pos.x) + sq(balles[i].pos.y - balles[j].pos.y) < sq(balles[i].ray + balles[j].ray)))  
      { 
        /* Conservation quantité de mouvement 
        PVector Vi = PVector.add(PVector.mult(balles[i].vit, balles[i].mass/(balles[i].mass+balles[j].mass)), PVector.mult(balles[j].vit, balles[j].mass/(balles[i].mass+balles[j].mass))); 
        balles[i].vit = PVector.add(PVector.mult(balles[i].vit, -1), PVector.mult(Vi, 2)); 
        balles[j].vit = PVector.add(PVector.mult(balles[j].vit, -1), PVector.mult(Vi, 2)); 
        */  
        //Changement de base, conservation composante tangentielle, Permutation comp. normale au choc 
        PVector ur = new PVector(balles[j].pos.x - balles[i].pos.x, balles[j].pos.y - balles[i].pos.y); ur.normalize(); 
        PVector ut = new PVector(-ur.y, ur.x); 
         
        float Pi_av = (balles[i].mass * balles[i].vit.mag()); 
        float Pj_av = (balles[j].mass * balles[j].vit.mag()); 
         
        PVector vit_i_inter = new PVector( (ur.x*balles[i].vit.x + ur.y*balles[i].vit.y), (ut.x*balles[i].vit.x + ut.y*balles[i].vit.y) ); 
        PVector vit_j_inter = new PVector( (ur.x*balles[j].vit.x + ur.y*balles[j].vit.y), (ut.x*balles[j].vit.x + ut.y*balles[j].vit.y) ); 
         
        balles[i].vit = new PVector(ur.x*vit_j_inter.x + ut.x*vit_i_inter.y, ur.y*vit_j_inter.x + ut.y*vit_i_inter.y); 
        balles[j].vit = new PVector(ur.x*vit_i_inter.x + ut.x*vit_j_inter.y, ur.y*vit_i_inter.x + ut.y*vit_j_inter.y); 
         
        //balles[i].vit = PVector.mult(balles[i].vit, Pj_av/Pi_av); 
        //balles[j].vit = PVector.mult(balles[j].vit, Pi_av/Pj_av); 
      } 
    } 
    balles[i].parame(); 
    balles[i].actu(); 
    balles[i].aff(); 
  } 
  if ((mousePressed)&&(mouseButton == LEFT)) {line(pos_clic.x, pos_clic.y, mouseX, mouseY);} //Affiche pos_i + vit_i de la balle en cours de creation par une ligne 
} 


