
import processing.pdf.*;
boolean savePDF = false;

Agent [] agents = new Agent [23];
float rebond = 0.05;
float gravity = 0.012;
float friction = -0.9;


void setup(){
  size(700, 700);
  cursor(CROSS);
  background(0);
  noStroke();
  smooth();
 
  for (int i = 0; i < agents.length; i++) { // pour (initialisation; condition; incrémentation)
    agents[i] = new Agent(random(width), random(height), random(30, 70), i, agents);
  }
}//fin de setup

void draw(){
   background(0,10);
  if (savePDF) beginRecord(PDF, timestamp()+".pdf");
      for (int i = 0; i <agents.length; i++) {  // pour (initialisation; condition; incrémentation)
        agents[i].collision();
        agents[i].mouvement();
        agents[i].affichage();  
      }
   if (savePDF) {savePDF = false;endRecord();}
}//fin de draw


void keyReleased() {
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_####.png");
  if (key == 'p' || key == 'P') savePDF = true;
  }
  
String timestamp() {
Calendar now = Calendar.getInstance();
return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}  
class Agent {
  float x, y;
  float diameter; // on parle ici du diamètre de agent "boule"
  float vx = 0; // vitesse x
  float vy = 0; // vitesse y, initialement = 0
  int id;
  Agent[] others;  
  Agent(float xin, float yin, float din, int idin, Agent[] oin) {
  x = xin; //  x initial par agent
  y = yin; //  y initial par agent
  diameter = din; // diamètre initial
  id = idin;
  others = oin; 
}

void collision() {
  for (int i = id + 1; i < agents.length; i++) {
    float dx = others[i].x - x; //  dx = x[des autre agents("2")] - x[pour un agent("1"])
    float dy = others[i].y - y;
    float distance = sqrt(dx*dx + dy*dy); // distance = racine carré (dx[agent"1"]*dx[agent"2"] + dy[agent"1"]*dy[agent"2"]) 
    // utilisation du théorème de Pythagore, pour calculer la distance entre les centres de deux agents
    // ça s'applique à tout les agents pour chaque agents.
    
    float minDist = others[i].diameter/2 + diameter/2; // distance minimum entre deux agents = diametre[agent"2"]/2 + diametre[agent"1"]/2
    // calcul les rayons de deux agents et les additionnes, s'applique à tous.
    
    if (distance < minDist) { // si (la distance entre les centres < distance mininum "addition des rayons" ) 
      float angle = atan2(dy, dx);
      // Calcule l'angle (en radians) 
      // Il faut se représenté un triangle rectangle interne à l'agent dont les trois sommets sont
      //       - le centre O de l'agent (l'origine donc l'angle droit) 
      //       - un point h issu d'un rayon [Oh]
      //       - un point i le point d'impact de l'autre agent
      // Remarque: La coordonnée y du point est le premier paramètre, et l'abscisse est le second paramètre,
      //  en raison de la structure du calcul de la tangente.
      
      float targetX = x + cos(angle) * minDist; // le cosinus permet d'obtenir des valeurs inverse en y
      float targetY = y + sin(angle) * minDist; // le sinus permet d'obtenir des inverse en x 
      float ax = (targetX - others[i].x) * rebond;    
      float ay = (targetY - others[i].y) * rebond; 
      // Cela permet le changement de sens et de vitesse
      vx -= ax; 
      vy -= ay; 
      others[i].vx += ax;
      others[i].vy += ay;
      // Permet le transfert de vitesse entre les agents
    }
  }
}

void mouvement() {
  vy += gravity;
  x += vx;
  y += vy;
  if (x + diameter/2 > width) {
    x = width - diameter/2;
    vx *= friction;
  }
  // quand ça touche le bord droit de la fenêtre, ça repart dans l'autre inverse
  // légérement ralenti vu que friction=-0.9
  else if (x - diameter/2 < 0) {
    x = diameter/2;
    vx *= friction;
  }
  // quand ça touche le bord gauche, ça repart dans l'autre inverse
  if (y + diameter/2 > height) {
    y = height - diameter/2;
    vy *= friction;
  }
  // quand ça touche le haut, ça repart dans l'autre inverse
  else if (y - diameter/2 < 0) {
    y = diameter/2;
    vy *= friction;
  }
  // quand ça touche le bord droit, ça repart dans l'autre inverse
}

   
void affichage() {
     
     float R; // on détermine des variables, ici pour la couleur
     float G;
     float B;  
     R = random(180,255); // les valeurs sont choisies aléatoirement entre 0 et 255
     G = random(80,100);
     B = random(200,255);
     fill(R,G,B); // trois valeurs de teintes sont peintes aléatoirement
     ellipse(x, y, diameter, diameter);
     if (mousePressed){  
         R = random(80,100); // quand on clique ça change de couleur
         G = random(200,255);
         B = random(80,100);
       
       fill(R,G,B);
        ellipse(x, y, diameter, diameter);
     }
  }
}



