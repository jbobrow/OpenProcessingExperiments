

Rec[] marcheur = new Rec[50];

void setup() {
 
 size(400,400);
 colorMode(HSB);      // HSB simplifie les couleurs aléatoires
 noStroke();
 smooth();            // formes anti-aliasées
  background(255);

 // pour chaque objet, choisir une taille &position de départ

   for(int i=0; i < marcheur.length; i++) {
   float taille = random(5,20);
   int depart_x=int(random(taille,width-taille));
   int depart_y=int(random(taille,height-taille));
   int depart_z=int(random(255));
   float vx=int(random(1,5));
   float vy=int(random(1,5));
   float vz=random(-1,1); 
   float h=random(255);
   marcheur[i] = new Rec(depart_x, depart_y,depart_z, taille,vx,vy,vz,h);
 }
}

void draw() {

    fill(0,20);
    rect(0,0,width,height);

   for(int i=0; i < marcheur.length; i++) {

   marcheur[i].draw();
 }
 


}

