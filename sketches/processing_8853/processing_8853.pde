
//Robot est un environnement permettant de tester les comportements
//d'un robot en fonction du programme qu'il abrite/

//Written By Jonathan Chemla
//Please Contact-me for non-private use
//jos.chemla@gmail.com

class Robot
{
  //Données relatives au robot : position, orientation, largeur
  PVector pos;
  float dir;
  float taille;
  
  //Données relatives aux capteurs : position des captreurs de contact, de luminosité
  PVector capt_cont_g;
  PVector capt_cont_d;
  PVector capt_lum_g;
  PVector capt_lum_d;
  
  //Données relatives à son environnement
  Sol sol;
  
  Robot(PVector position,
        float orientation,
        float largeur,
        Sol environnement)
  {
    pos = position;
    dir = orientation;
    taille = largeur;
    
    //Modifier la position des capteurs de contact, les micro-switch
    capt_cont_g = new PVector(pos.x - taille*sqrt(2)*cos(dir-PI-(PI/4.0)), pos.y + taille*sqrt(2)*sin(dir-PI-(PI/4.0)));
    capt_cont_d = new PVector(pos.x - taille*sqrt(2)*cos(dir-3*PI/2-(PI/4.0)), pos.y + taille*sqrt(2)*sin(dir-3*PI/2-(PI/4.0)));
    capt_lum_g = new PVector(pos.x + taille*cos(dir), pos.y - taille*sin(dir)); //En fait, capt_lum_g.x = pos.x - taille*cos(PI-dir) et capt_lum_g.y = pos.x - taille*sin(PI-dir); cos(PI-x) = -cos(x); 
    capt_lum_d = new PVector(pos.x - taille*cos(dir), pos.y + taille*sin(dir)); //En fait, capt_lum_d.x = pos.x + taille*cos(PI-dir) et capt_lum_d.y = pos.x + taille*sin(PI-dir); sin(PI-x) = +sin(x)
    
    sol = environnement;
  }
  
  //Dessin du robot
  void dessine_corps()
  {
    fill(0); stroke(255);
    rectMode(RADIUS);
    translate(pos.x, pos.y);
    rotate(-dir);
    rect(0, 0, taille, taille);
    rotate(dir);
    translate(-pos.x, -pos.y);
  }
  void dessine_capteurs()
  {
    ellipseMode(RADIUS);
    stroke(0); fill(255);
    //Capteurs de lumière
    actualise_capteurs();
    ellipse(capt_lum_g.x, capt_lum_g.y, taille/6, taille/6);
    ellipse(capt_lum_d.x, capt_lum_d.y, taille/6, taille/6);
    stroke(255, 0, 0); 
    ellipse(capt_cont_g.x, capt_cont_g.y, taille/5, taille/5);
    ellipse(capt_cont_d.x, capt_cont_d.y, taille/5, taille/5);
  }
  
  void dessine()
  {
    dessine_corps();
    dessine_capteurs();
  }
  
  //Fonctions de déplacement
  void avance (float dplcmt, int duree)
  {
    for (int i = 0; i < duree; i++)
    {
      //sol.dessine();
      //dessine();
      pos.x += dplcmt * sin(dir)/duree;  //p1 = p0 + v0*dt et v0x = v0*sin(dir)
      pos.y += dplcmt * cos(dir)/duree;  //                et v0y = v0*cos(dir)
      //delay(10);
    }
  }
  void tourne_g (float dalp, int dt)
  {
    for (int i = 0; i < dt; i++)
    {
      //sol.dessine();
      //dessine();
      dir += dalp/dt;
      //delay(10); //C'est mauvais, il ne calcule plus pdt ce temps
    }
  }
  void tourne_d (float dalp, int dt)
  {
    for (int i = 0; i < dt; i++)
    {
      //sol.dessine();
      //dessine();
      dir -= dalp/dt;
      //delay(10); //C'est mauvais, il ne calcule plus pdt ce temps
    }
  }
  void recule (float dplcmt, int duree)
  {
    for (int i = 0; i < duree; i++)
    {
      //sol.dessine();
      //dessine();
      pos.x -= dplcmt * sin(dir)/duree;  //p1 = p0 + v0*dt et v0x = v0*sin(dir)
      pos.y -= dplcmt * cos(dir)/duree;  //                et v0y = v0*cos(dir)
      //delay(10);
    }
  }
  void recule_obst(float dplcmt, int duree) //Pour simplifier, on pourrait faire une fonction de recul spéciale a la detection d'obstacles
  {
    for (int i = 0; i < duree; i++)
    {
      //sol.dessine();
      //dessine();
      pos.x -= dplcmt * sin(dir)/duree;  //p1 = p0 + v0*dt et v0x = v0*sin(dir)
      pos.y -= dplcmt * cos(dir)/duree;  //                et v0y = v0*cos(dir)
      //delay(10);
    }
  }
  
  //Positions des capteurs
  void actualise_capteurs()
  {
    capt_cont_g = new PVector(pos.x - taille*sqrt(2)*cos(dir-PI-(PI/4.0)), pos.y + taille*sqrt(2)*sin(dir-PI-(PI/4.0)));
    capt_cont_d = new PVector(pos.x - taille*sqrt(2)*cos(dir-3*PI/2-(PI/4.0)), pos.y + taille*sqrt(2)*sin(dir-3*PI/2-(PI/4.0)));
    capt_lum_g = new PVector(pos.x + taille*cos(dir), pos.y - taille*sin(dir));
    capt_lum_d = new PVector(pos.x - taille*cos(dir), pos.y + taille*sin(dir));
  }
  //Grandeurs relatives aux Capteurs et à l'environnement du robot
  int lum_g()
  {
    actualise_capteurs();
    color c_lum_g = sol.get((int)(capt_lum_g.x), (int)(capt_lum_g.y));
    return (int)brightness(c_lum_g);
  }
  int lum_d()
  {
    actualise_capteurs();
    color c_lum_d = sol.get((int)(capt_lum_d.x), (int)(capt_lum_d.y));
    return (int)brightness(c_lum_d);
  }
  int cont_g()
  {
    actualise_capteurs();
    color c_cont_g = sol.get((int)(capt_cont_g.x), (int)(capt_cont_g.y));
    if ((int)brightness(c_cont_g) == 0) {return 1;}
                                   else {return 0;}
  }
  int cont_d()
  {
    actualise_capteurs();
    color c_cont_d = sol.get((int)(capt_cont_d.x), (int)(capt_cont_d.y));
    if ((int)brightness(c_cont_d) == 0) {return 1;}
                                   else {return 0;}
  }
  
  int dt = 1;  //Variables de référence,
  
  //Detections et decisions en fonctions des différentes grandeurs physiques
  /*void evite_obstable_g(){recule(50, 200);
                          tourne_d(random(PI/2, PI), dt);}
  void evite_obstable_d(){recule(50, 200);
                          tourne_g(random(PI/2, PI), dt);}*/
  void detecte_obstacle()
  {
    avance(2, dt);
    if (cont_g() == 1) {recule_obst(10, dt);
                        tourne_d(PI/8, dt);}
    if (cont_d() == 1) {recule_obst(10, dt);
                        tourne_g(PI/64, dt);}
  }
  
  void decide_lum()
  {
    float seuil_tolerance = 0; //Pour l'acceptabilité de l'erreur de précision des capteurs
    float seuil = 200;         //Seuil pour lequel le robot estime avoir atteint le point le plus lumineux
    if ((lum_g() == lum_d()) && (lum_g() < seuil)) {avance(2, dt);}
    if (lum_g() > lum_d() + seuil_tolerance) {tourne_g(PI/32, dt);}
    if (lum_d() > lum_g() + seuil_tolerance) {tourne_d(PI/32, dt);}
    avance(1, 1); //Pour que le robot continue de cherche indéfiniment la lumière. Ou bien changer le suil à 256 par ex.
    println(((lum_g() == lum_d())));
  }
  
  //Fonction princiale
  void mise_en_marche(String Mode)
  {
    sol.dessine();
    dessine();
    if (Mode.equals("Evitement_obstacles") == true)
    {
      detecte_obstacle();
    }
    if (Mode.equals("Recherche_lumiere") == true) //Combinaison des 2 modes.
    {
      decide_lum();
    }
    if (Mode.equals("Controle_clavier") == true) //Combinaison des 2 modes.
    {
      if (keyCode != DOWN) avance(2, 1);
      //Pour le controle clavier : 
      if ((keyPressed) && (keyCode == UP))    {avance(2, dt);}
      if ((keyPressed) && (keyCode == DOWN))  {recule(4, dt);}
      if ((keyPressed) && (keyCode == LEFT))  {tourne_g(PI/32, dt);}
      if ((keyPressed) && (keyCode == RIGHT)) {tourne_d(PI/32, dt);}
    }
  }
  
  void actualise_sol(Sol tapis)
  {sol = tapis;}
}

class Sol
{
  color obstacle = color(0); //Couleur interdite par les capteurs de contact au robot. Il vaudrait mieux utiliser une autre couleur.
  color[] fond = {color(100)};
  color lumiere = color(255, 100);
  PImage leSol;
  String mode;
  
  Sol(String Mode)
  {mode = Mode;}
  
  void calcule()
  {
    if (mode.equals("aire de jeu") == true)
    {
      rectMode(RADIUS);
      background(0);
      fill(fond[0]); stroke(obstacle);
      rect(width/2, height/2, width/2-100, height/2-100);
    }
    if (mode.equals("Dohyo") == true)
    {
      ellipseMode(RADIUS);
      background(obstacle);
      fill(fond[0]); stroke(obstacle);
      ellipse(width/2, height/2, width/2-50, height/2-50);      
    }
    if (mode.equals("labyrinthe") == true)
    {
      ellipseMode(RADIUS);
      background(0);
      fill(fond[0]); stroke(obstacle);
      ellipse(width/2, height/2, width/2-50, height/2-50);
      rectMode(CORNER);
      fill(obstacle);
      rect(width/2, 0, 50, 150);
    }
    //ellipseMode(CENTER);
    //fill(lumiere); noStroke();//stroke(lumiere);
    //ellipse(300, 400, 100, 100);
  }
  
  void enregistre() //A appeler tout de suite après dessine
    {saveFrame("leSol.png");
     leSol = loadImage("leSol.png");}
     
  void dessine() //A toujours appeler apreès enregistre;
  {image(leSol, 0, 0, width, height);}
  
  color get(int x, int y)
  {return (leSol.get(x, y));}
  
  void actualise(int f_rafraichissement)
  {
    //if (frameCount % f_rafraichissement == 0) 
    {}
  }

  void peint(String pinceau)
  {
    dessine();
    ellipseMode(CENTER);
    noStroke();
    if (pinceau.equals("lumiere") == true)  {fill(lumiere);}
    if (pinceau.equals("fond") == true)     {fill(fond[0]);}
    if (pinceau.equals("interdit") == true) {fill(obstacle);}
    
    
    float ray = 60;
    ellipse(mouseX, mouseY, ray, ray);
    enregistre();
  }
  void rafraichis()
  {
    calcule();
    enregistre();
    dessine();
    ellipseMode(CENTER);
    fill(lumiere); noStroke();//stroke(lumiere);
    float ray = 100;
    ellipse(mouseX, mouseY, ray, ray);
    enregistre();
  }
  void cercle_interdit(int x, int y, float ray)
  {
    ellipseMode(CENTER);
    fill(obstacle); noStroke();//stroke(lumiere);
    ellipse(x, y, ray, ray);
  }
}

