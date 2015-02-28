
/*  



        _
       | |    ¤
  ,_   | |        __   __   _  _  _    _
 /  |  |/ \   |  / / _/  \_/ |/ |/ |  |/
    |_/|   |_/|_/ /_/ \__/   |  |  |_/|__/
                   /|
                   \|
                   
                   
                   
// // / /// / /  //  / / / / / /  ///// / / //
// / // // // //// /// / ///  ///    ///  // /  
//  26 mai 2009           ~emoc 
// // // / // / / /// // / /// / // / ///// */ 



int basex = 300, basey = 500; // coordonnées de la racine
int maxNuages = 10;
Nuage[] nu = new Nuage[maxNuages];
int w = 600; // sketch width
int h = 500; // sketch height
PFont font;

void setup() {
  size(600,500); // <- export applet // size(w,h);
  font = createFont("Arial", 24); 
  textFont(font); 
  for (int i=0; i<maxNuages; i++) {
    nu[i] = new Nuage(random(50,w-50), random(50,h-50));
  }
}

void draw() {
  background(#E5E5D3); smooth();
  rhizome();
  for (int i=0; i<maxNuages; i++) {
    nu[i].draw(i);
  }
}

class Nuage {
  float x, y;
  
  Nuage(float _x, float _y) {
    this.x = _x;
    this.y = _y;
  }
  void draw(int i) {
    //stroke(0); strokeWeight(5); point(this.x, this.y);
    fill(0x55980003);
    text(i, this.x, this.y);
  }
  void set(float _x, float _y) {
    this.x = _x;
    this.y = _y;
  }
}


void rhizome() {
  int nb = nu.length;
  float tour = nb;
  HashMap d = new HashMap(); // tableau associatif point / distance
  float x0 = basex; // racine / point de départ du rhizome
  float y0 = basey;
  float xxx; // une valeur fictive maximum de distance
  float epmini = 1.3; // epaisseur minimum des traits
  
  // on progresse dans le tableau de points nu, 3 par 3 points
  // pour chacun on cherche le centre de gravité qui forme la tige
  int pa = 0, pb = 0, pc = 0; // 3 pointeurs vers les points du tableau nu 


  // *********************************************************************
  // chercher les points les plus proches de la racine
  for (int i=0; i<nb; i++) { // remplissage initial de la hashmap avec les valeurs de distance
    float dis = dist(x0, y0, nu[i].x, nu[i].y);
    d.put(i, (Float) dis);
  }
  
  xxx = 999999;
  pa = -1; // le numéro du point dans la tableau nu
  for (int i=0; i<nb; i++) { // parcourir la hashmap pour trouver la valeur la plus proche
    if (d.get(i) != null) { // si la clé existe
      String vvv = d.get(i).toString();
      if (Float.parseFloat(vvv) < xxx) { // inférieure à la plus petite valeur enregistrée ?
        xxx = Float.parseFloat(vvv);
        pa = i;
      }
    }
  } // on connait maintenant le point d'origine, on peut l'enlever
  d.remove(pa);
  
  xxx = 999999;
  pb = -1;  // le numéro du point dans le tableau nu
  for (int i=0; i<nb; i++) { // parcourir la hashmap pour trouver la 2nde valeur
    if (d.get(i) != null) { // si la clé existe
      String vvv = d.get(i).toString();
      if (Float.parseFloat(vvv) < xxx) {
        xxx = Float.parseFloat(vvv);
        pb = i;
      }
    }
  } 
  // on connait les 3 points on peut chercher le centre de gravité
  float xg = grav(x0, nu[pa].x, nu[pb].x);
  float yg = grav(y0, nu[pa].y, nu[pb].y);

  segment(x0, y0, xg, yg, tour*2, tour*2-1, epmini);
  segment(xg, yg, nu[pa].x, nu[pa].y, tour, tour/2, epmini);
  segment(xg, yg, nu[pb].x, nu[pb].y, tour, tour/2, epmini);
  
  x0 = xg; y0 = yg; // point de départ de la tige pour le prochain segment
  d.remove(pb); // on enlève ce point de la hashmap
  tour--;
  
  // **********************************************************************
  // boucle pour trouver tous les autres points 
  while(tour > 1) {
    // mettre à jour la hashmap avec les nouvelles valeurs de distance
    Set entrees = d.entrySet();
    Iterator iter = entrees.iterator();
    while (iter.hasNext()) {
      Map.Entry entree = (Map.Entry)iter.next();
      Object cle = entree.getKey();
      int i = Integer.parseInt(cle.toString());
      float dis; // maintenant on cherchera le point le plus proche des deux premiers
      if ((i != pa) & (i != pb)) { 
        dis = (dist(nu[pa].x, nu[pa].y, nu[i].x, nu[i].y) + dist(nu[pb].x, nu[pb].y, nu[i].x, nu[i].y)) /2;
      } else dis = 999999;
      d.put(cle, (Float) dis);
    }
  
    xxx = 999999;
    pc = -1;  // le numéro du point dans la tableau nu

    Set entrees2 = d.entrySet();
    Iterator iter2 = entrees2.iterator();
    while (iter2.hasNext()) {
      Map.Entry entree2 = (Map.Entry)iter2.next();
      Object cle2 = entree2.getKey();
      int i = Integer.parseInt(cle2.toString());
      String vvv = d.get(i).toString();
      if (Float.parseFloat(vvv) < xxx) {
        xxx = Float.parseFloat(vvv);
        pc = i; 
      } 
    }

    // on connait les 3 points, on peut chercher le centre de gravité
    xg = grav(nu[pa].x, nu[pb].x, nu[pc].x);
    yg = grav(nu[pa].y, nu[pb].y, nu[pc].y);

    segment(x0, y0, xg, yg, tour*2, tour*2-2, epmini);
    segment(xg, yg, nu[pc].x, nu[pc].y, tour, tour/2, epmini);
    
    x0 = xg; y0 = yg;
    d.remove(pa);
    pa = pb; pb = pc; // décalage des points pour le prochain triangle
    tour--;
  }
}  
  
    
float grav(float c1, float c2, float c3) { // calcul du centre de gravité sur un axe
  return (c1+c2+c3)/3;
}


void segment (float x0, float y0, float xg, float yg, float ep1, float ep2, float epmini){
  stroke(0,125,0); fill(0,125,0);
  /* line(x0, y0, xg, yg); */ // version minimum
  
  if (ep1 < epmini) ep1 = epmini;
  if (ep2 < epmini) ep2 = epmini;
  float ang = atan2(x0 - xg, y0 - yg);
  beginShape();
  vertex(x0 + (ep1 * cos(-ang+PI)), y0 + (ep1 * sin(-ang+PI)));
  vertex(x0 + (ep1 * cos(-ang))   , y0 + (ep1 * sin(-ang)));
  vertex(xg + (ep2 * cos(-ang))   , yg + (ep2 * sin(-ang)));
  vertex(xg + (ep2 * cos(-ang+PI)), yg + (ep2 * sin(-ang+PI)));
  endShape(CLOSE);
}


void mousePressed() {
  basex = mouseX;
  basey = mouseY;
}


void keyPressed() {
  if (key == ' ') {
    for (int i=0; i<maxNuages; i++) {
      nu[i].set( random(20,w-20), random(20,h-20));
    }
  }
}



