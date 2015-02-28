
int x_balle, y_balle;

int x_direction, y_direction;

int x_plateau, y_plateau;

boolean bStop;

int score, score1, score2;

int vies, mode;

int bonus;

int continuer;

int r,v,b;

void setup()
{
  size(400,435);
  background(0);

  x_plateau = 60;
  y_plateau = width-25;

  x_direction = -3;
  y_direction = -6;

  x_balle = 200;
  y_balle = 200;

  score = 0;
  score1 = 0;
  score2 = 0;

  mode = 0;
  vies = 3;

  bonus = 0;

  continuer = 10;

  r = 0;
  v = 128;
  b = 255;

  PFont pong = loadFont("pong_2.vlw"); // choix de la typo
  textFont(pong, 20);  // Definition de la taille de la typo
}

void draw() 
{
  tout();
}
void tout() {
  if (continuer==10) {
    choix();
  }
  if (continuer==20) {
    text("Cliquer avec votre souris pour recommencer", 50, 200);
    if(mousePressed) {
      reset();
    }
  }
}


void reset() {
  background(0);
  x_direction = -3;
  y_direction = -6;
  x_balle = 200;
  y_balle = 200;
  score = 0;
  bonus = 0;
  vies = 3;
  continuer = 10;
}

void choix() {
  if (key == 'c')
  {
    mode = 2;
  }
  if(key == 's')
  {
    mode = 3;
  }
  if(mode == 0) {
    fill(r, v, b);
    stats();
    text("S pour le mode souris  / C pour le mode clavier",27,200);
  }
  if (mode == 2) {
    jeu();
  }
  if (mode ==3) {
    jeu_1();
  }
}
void nettoyer()
{
  background(0);
}

void dessiner()
{
  smooth();
  fill(228,27,241);
  stroke(228,27,241);

  rect(x_plateau,y_plateau,85,5);

  ellipse(x_balle,y_balle,10,10);
}

void bouger()
{
  x_balle = x_balle + x_direction;
  y_balle = y_balle + y_direction;

  if(keyPressed) {
    if(keyCode == LEFT && x_plateau > 0) {
      x_plateau -= 5;
    }

    if(keyCode == RIGHT && x_plateau < 315) {
      x_plateau+= 5;
    }
    else
    {
      x_plateau = x_plateau;
    }
  }
}

void bouger_1()
{
  x_balle = x_balle + x_direction;
  y_balle = y_balle + y_direction;

  x_plateau = mouseX-40;

  if(x_plateau < 0) {
    x_plateau = 0;
  }

  if(x_plateau > width-80) {
    x_plateau = width-86;
  }
}


void rebondir()
{
  // rebondit droite
  if (x_balle > width-5 && x_direction > 0) 
  {
    x_direction = -x_direction;
  }

  //rebondit gauche
  if (x_balle < 5) 
  {
    x_direction = -x_direction ;
  }
  //rebondit plateau haut
  if (y_balle>y_plateau-5 && x_balle > x_plateau && x_balle<x_plateau+85)
  {
    y_direction = -y_direction; 
    score++;
    bonus++;
  }
  // rebondit plateau bas
  if (y_balle>y_plateau+10 && x_balle > x_plateau && x_balle<x_plateau+85)
  {
    y_direction = -y_direction; 
    score++;
    bonus++;
  }


  //rebondit haut
  if (y_balle < 50)
  {
    y_direction = -y_direction;
  }

  //rebondit bas
  if (y_balle > width - 10) 
  {
    if(vies > 0) //si il reste des vies balle rebondit
    {
      y_direction = -y_direction;
      vies--;
      bonus = 0;
      print("il vous reste : ");
      print(vies);
      println(" vies");
    }
    if(vies == 0) // sinon fin de partie
    {
      println("GAME OVER"); 
      println("Score : ");
      println(score);
      continuer = 20;
    }
  }
}

void jeu()
{

  nettoyer();
  bouger();
  rebondir();
  dessiner();

  if(score>score1)
  {
    print("Score : ");
    println(score);
    score1++;
  }

  if(score > score2+19 && bonus == 20) {
    vies++;
    bonus = 0;
    score2 = score;
  }
  fill(r, v, b);
  text("Tapez S pour passer en mode souris",55,425);
  stats();
}

void jeu_1()
{

  nettoyer();
  bouger_1();
  rebondir();
  dessiner();

  if(score>score1)
  {
    print("Score : ");
    println(score);

    score1++;
  }
  if(score > score2+19 && bonus == 20) {
    vies++;
    bonus = 0;
    score2 = score;
  }
  fill(r, v, b);
  text("Tapez C pour passer en mode clavier",55,425);
  stats();
}

void stats() {
  stroke(r,v,b);
  line(0,40,400,40);
  line(0,405,400,405);
  text("Bonus :  ",50,20);
  text(bonus,110,20);
  text("PONG", 175,20);
  text("Score : ", 160, 35);
  text(score, 225, 35);
  text("Vies : ", 300,20);
  text(vies,350,20);
}

void keyPressed()
{
  if(keyCode == ENTER && continuer == 10 && mode != 0) 
  {
    bStop = !bStop;
    if (bStop) {
      text("PAUSE", 150,200);
      noLoop();
    }
    else {
      loop();
    }
  }
}


