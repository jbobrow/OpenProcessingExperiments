
// Le coeur de la ville : espace organique en action, création d'un rythme, urbanisme en mouvement: sensation que la forme en bas à gauche "vit" comme une respiration
// illusion de perspective : de premier et second plan, graphisme emprunté à la bd avec des buildings dessinés par des contours droits, ciel orageux, dégradé des murs indique 
// le jour ou la nuit ...

float val_orage = 1; // pr le background
float t = 0; // pr le rythme 
color fondstandard, bleunuit; // pr le dégradé 

void setup() {
  size(400,200);
  colorMode(RGB);
  smooth(); 
  fondstandard = color (255);
  bleunuit = color (11,0,49);
}

void draw() {
  // Temps d'orage
  background(255*noise(val_orage));
  val_orage = val_orage + 0.2;
  // Point de démarrage
  float x = t;
  for (int i = 0; i < width; i++) {
    stroke(123,3,34);
    strokeWeight(2);
    // valeurs noise parti d'un ex sur un randomgraph
    float y1 = noise(x*2)*height;
    float y2 = noise(x+0.3)*height + 20;
    float y3 = noise(x*50)*height;
    // Ligne conductrice
    line(i,y1*50,i*5,y2);
    //Dégradé des immeubles
    float amount = map (mouseX, 0, width, 0,1);
    color melange = lerpColor (fondstandard, bleunuit,amount);
    //Dessin Tunnel & Buildings
    fill (melange);
    ellipse(i-300, i-100, y1,i);
    rect (i,y1,y2+2,i);
    // on incrémente x
    x -= 19;
 }
  // on incrémente le temps pour l'ensemble du graphisme
  t += 0.01; 
}



