
ArrayList<Boule> boules; // Liste des petites boules 
float max_boules = 20;
ArrayList<Icones> icones;  // Liste des Icones secondaires
float max_icones = 10;
PShape facebook;          // Ici charge les logos 
PShape twitter;
PShape instagram;
PShape flickr;
PShape mail;
PShape youtube;
PShape googleplus;
PShape vine;

void setup() {
  size(1000, 900);
  boules = new ArrayList<Boule>();
  icones = new ArrayList<Icones>();
  frameRate(25);
  facebook = loadShape("facebook.svg");        // On charge les image des logos
  twitter = loadShape("twitter.svg");
  instagram = loadShape("instagram.svg");
  flickr = loadShape("flickr.svg");
  mail = loadShape("mail.svg");
  youtube = loadShape("youtube.svg");
  googleplus = loadShape("googleplus.svg");
  vine = loadShape("vine.svg");
}

void keyPressed() {
  if (key == 's') {           // On créer un bouton de sauvegarde
    saveFrame("Me on the web" + millis() + ".png");
  }
  if (key == 'z') {            // On créer un bouton de reset
    setup();
  }
}
void draw() {
  background(0);
  noStroke();
  // On donne les instructions pour les boutons
  textSize(12);
  fill(255);
  text("dark= intense use", 870, 20);
  text("bright= little use", 870, 40);
  text("press: s to save your result", 10, 20);
  fill(255);
  text("press: z to reset", 10, 40);

  // On créer les boutons des réseaux sociaux 
  fill(59, 89, 152);
  ellipse(500, 125, 60, 60); // Facebook    
  shape(facebook, 480, 105, 40, 40);
  fill(153, 0, 0);
  ellipse(240, 250, 60, 60); // Google+
  shape(googleplus, 220, 230, 40, 40);
  fill(64, 153, 255);
  ellipse(750, 250, 60, 60);// Twitter
  shape(twitter, 730, 230, 40, 40);
  fill(187, 0, 0);
  ellipse(240, 650, 60, 60); // Youtube
  shape(youtube, 220, 630, 40, 40);
  fill(255, 0, 132);
  ellipse(750, 650, 60, 60);// flickr
  shape(flickr, 730, 630, 40, 40);
  fill(255);
  ellipse(500, 775, 60, 60);// MAIL
  shape(mail, 480, 755, 40, 40);
  fill(212, 205, 192, 200);
  ellipse(825, 450, 60, 60);//Instagram
  shape(instagram, 805, 430, 40, 40);
  fill(0, 164, 120);
  ellipse(175, 450, 60, 60);//Vine
  shape(vine, 160, 435, 60, 80);

  for (int i=0; i< icones.size(); i++ ) {
    Icones ic= icones.get(i);
    ic.sauter();
    ic.update();
  }


  for (int i = 0; i < boules.size(); i++) {    
    for (int j=i; j<boules.size(); j++) {
      Boule b = boules.get(i);     // On fait bouger les boules à chaque image
      b.deplacer();
      b.dessiner();
      Boule bb = boules.get(j);     // On lies les boules entre elles 
      if (dist(b.x, b.y, bb.x, bb.y) < 70) {  // Les liaisons ne s'activent que lorsque les billes sont à une certaines distance 
        stroke(255);
        line(b.x, b.y, bb.x, bb.y);
      }
    }
  }
}

void mouseReleased() { 

  // Mise ne place Icones

  /////FACEBOOK icones
  for ( int i=0; i<3; i++) {
    if (dist(500, 125, mouseX, mouseY) < 40) { 
      icones.add(new Icones(400, 70, color(153, 204, 255)));
      icones.add(new Icones(500, 50, color(59, 89, 160)));
      icones.add(new Icones(600, 70, color(59, 89, 160, 50)));  //59 89 160 50
    }
  }
  /////TWITTER icones

  if (dist(750, 250, mouseX, mouseY) < 40) { 
    icones.add(new Icones(730, 150, color(148, 231, 255)));
    icones.add(new Icones(810, 210, color(64, 160, 255)));
    icones.add(new Icones(860, 280, color(64, 153, 255, 60)));
  }
  /// INSTAGRAM icones

  if (dist(825, 450, mouseX, mouseY) < 40) { 
    icones.add(new Icones(890, 380, color(230, 224, 210)));
    icones.add(new Icones(900, 450, color(212, 205, 192)));
    icones.add(new Icones(890, 520, color(212, 205, 192, 100)));
  }
  /// Flickr icones

  if (dist(750, 650, mouseX, mouseY) < 40) { 
    icones.add(new Icones(860, 620, color(255, 148, 202)));
    icones.add(new Icones(810, 690, color(255, 0, 132)));
    icones.add(new Icones(730, 750, color(255, 0, 132, 50)));
  }
  ///Mail icones

  if (dist(500, 775, mouseX, mouseY) < 40) { 
    icones.add(new Icones(400, 810, color(255, 20)));
    icones.add(new Icones(500, 830, color(255)));
    icones.add(new Icones(600, 810, color(212, 205, 192)));
  }
  /// YOUTUBE icones

  if (dist(240, 650, mouseX, mouseY) < 40) { 
    icones.add(new Icones(140, 620, color(187, 0, 0, 100)));
    icones.add(new Icones(190, 690, color(187, 0, 0)));
    icones.add(new Icones(270, 750, color(255, 94, 94)));
  }
  //// VINE icones

  if (dist(175, 450, mouseX, mouseY) < 40) { 
    icones.add(new Icones(100, 450, color(0, 164, 120)));
    icones.add(new Icones(110, 380, color(0, 164, 120, 100)));
    icones.add(new Icones(110, 520, color(0, 228, 167)));
  }
  /// GOOGLE+ icones

  if (dist(240, 250, mouseX, mouseY) < 40) { 
    icones.add(new Icones(270, 150, color(153, 0, 0, 100)));
    icones.add(new Icones(190, 210, color(153, 0, 0)));
    icones.add(new Icones(140, 280, color(255, 132, 112)));
  }

  // Apparition des boules


  // FACEBOOK BOULES
  // LITTLE
  if ((dist(400, 70, mouseX, mouseY) < 25)) {
    for (int i=0; i<8;i++) {
      boules.add(new Boule(
      color(59, 89, 152), 
      random(5, 10)));
    }
  }
  //MIDDLE
  if ((dist(500, 50, mouseX, mouseY) < 25)) {
    for (int i=0; i<16;i++) {
      boules.add(new Boule(
      color(59, 89, 152), 
      random(5, 10)));
    }
  }
  //BIG
  if ((dist(600, 70, mouseX, mouseY) < 25)) {
    for (int i=0; i<25;i++) {
      boules.add(new Boule(
      color(59, 89, 152), 
      random(5, 10)));
    }
  }

  // TWITTER BOULES
  // LITTLE
  if ((dist(730, 150, mouseX, mouseY) < 25)) {
    for (int i=0; i<8;i++) {
      boules.add(new Boule(
      color(64, 153, 255), 
      random(5, 10)));
    }
  }
  //MIDDLE
  if ((dist(810, 210, mouseX, mouseY) < 25)) {
    for (int i=0; i<16;i++) {
      boules.add(new Boule(
      color(64, 153, 255), 
      random(5, 10)));
    }
  }
  //BIG
  if ((dist(860, 280, mouseX, mouseY) < 25)) {
    for (int i=0; i<25;i++) {
      boules.add(new Boule(
      color(64, 153, 255), 
      random(5, 10)));
    }
  }

  // INSTAGRAM BOULES
  // LITTLE
  if ((dist(890, 380, mouseX, mouseY) < 25)) {
    for (int i=0; i<8;i++) {
      boules.add(new Boule(
      color(212, 205, 192), 
      random(5, 10)));
    }
  }
  //MIDDLE
  if ((dist(900, 450, mouseX, mouseY) < 25)) {
    for (int i=0; i<16;i++) {
      boules.add(new Boule(
      color(212, 205, 192), 
      random(5, 10)));
    }
  }
  //BIG
  if ((dist(890, 520, mouseX, mouseY) < 25)) {
    for (int i=0; i<25;i++) {
      boules.add(new Boule(
      color(212, 205, 192), 
      random(5, 10)));
    }
  }
  // FLICKR BOULES
  // LITTLE
  if ((dist(860, 620, mouseX, mouseY) < 25)) {
    for (int i=0; i<8;i++) {
      boules.add(new Boule(
      color(255, 0, 132), 
      random(5, 10)));
    }
  }
  //MIDDLE
  if ((dist(810, 690, mouseX, mouseY) < 25)) {
    for (int i=0; i<16;i++) {
      boules.add(new Boule(
      color(255, 0, 132), 
      random(5, 10)));
    }
  }
  //BIG
  if ((dist(730, 750, mouseX, mouseY) < 25)) {
    for (int i=0; i<25;i++) {
      boules.add(new Boule(
      color(255, 0, 132), 
      random(5, 10)));
    }
  }
  // MAIL BOULES
  // LITTLE
  if ((dist(600, 810, mouseX, mouseY) < 25)) {
    for (int i=0; i<8;i++) {
      boules.add(new Boule(
      color(255), 
      random(5, 10)));
    }
  }
  //MIDDLE
  if ((dist(500, 830, mouseX, mouseY) < 25)) {
    for (int i=0; i<16;i++) {
      boules.add(new Boule(
      color(255), 
      random(5, 10)));
    }
  }
  //BIG
  if ((dist(400, 810, mouseX, mouseY) < 25)) {
    for (int i=0; i<25;i++) {
      boules.add(new Boule(
      color(255), 
      random(5, 10)));
    }
  }
  // YOUTUBE BOULES
  // LITTLE
  if ((dist(270, 750, mouseX, mouseY) < 25)) {
    for (int i=0; i<8;i++) {
      boules.add(new Boule(
      color(187, 0, 0), 
      random(5, 10)));
    }
  }
  //MIDDLE
  if ((dist(190, 690, mouseX, mouseY) < 25)) {
    for (int i=0; i<16;i++) {
      boules.add(new Boule(
      color(187, 0, 0), 
      random(5, 10)));
    }
  }
  //BIG
  if ((dist(140, 620, mouseX, mouseY) < 25)) {
    for (int i=0; i<25;i++) {
      boules.add(new Boule(
      color(187, 0, 0), 
      random(5, 10)));
    }
  }

  // VINE BOULES
  // LITTLE
  if ((dist(110, 520, mouseX, mouseY) < 25)) {
    for (int i=0; i<8;i++) {
      boules.add(new Boule(
      color(0, 164, 120), 
      random(5, 10)));
    }
  }
  //MIDDLE
  if ((dist(100, 450, mouseX, mouseY) < 25)) {
    for (int i=0; i<16;i++) {
      boules.add(new Boule(
      color(0, 164, 120), 
      random(5, 10)));
    }
  }
  //BIG
  if ((dist(110, 380, mouseX, mouseY) < 25)) {
    for (int i=0; i<25;i++) {
      boules.add(new Boule(
      color(0, 164, 120), 
      random(5, 10)));
    }
  }
  // GOOGLE+ BOULES
  // LITTLE
  if ((dist(140, 280, mouseX, mouseY) < 25)) {
    for (int i=0; i<8;i++) {
      boules.add(new Boule(
      color(153, 0, 0), 
      random(5, 10)));
    }
  }
  //MIDDLE
  if ((dist(190, 210, mouseX, mouseY) < 25)) {
    for (int i=0; i<16;i++) {
      boules.add(new Boule(
      color(153, 0, 0), 
      random(5, 10)));
    }
  }
  //BIG
  if ((dist(270, 150, mouseX, mouseY) < 25)) {
    for (int i=0; i<25;i++) {
      boules.add(new Boule(
      color(153, 0, 0), 
      random(5, 10)));
    }
  }
}

class Boule {
  float x, y;
  float vx, vy;
  color couleur;
  float diametre;


  Boule(color c, float d) {
    x = random(275, 715);
    y = random(250, 620);
    vx = random(-0.21, 0.21);
    vy = random(-0.21, 0.21);
    couleur = c;
    diametre = d;
  }

  void deplacer() {
    x += vx;
    y += vy;
    if (x <275) vx = -vx;
    if (x > 715) vx = -vx;
    if (y < 250) vy = -vy;
    if (y > 620) vy = -vy;
  }

  /*void lier() {
    line(x, y, bouleVoisine.x, bouleVoisine.y);
  }*/

  void dessiner() {
    stroke(couleur);
    fill(couleur);
    ellipse(x, y, diametre, diametre);
  }
}
class Icones {
  int xPos;
  int yPos;
  float xx, yy;
 // float y;
  //float vy;
  color couleur;
   
  Icones(int x, int y, color c)  {
    xPos = x;
    yPos =y;
    //vy = random(-0.5, 0.5);
    couleur= c;
    xx = xPos; 
    yy = yPos;   
  }


  void sauter() {
    /*
    y += vy;
    if (y< y+20) vy = -vy;
    if (y > y-20) vy = -vy;
   */
   yy = yPos + sin(millis());
  }

  void update() {
      fill(couleur);
    ellipse(xx, yy, 50,50);
   
  }
}


