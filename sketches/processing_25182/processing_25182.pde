
/*
================================================================
TP3 - simulation
par Simon Desjardins
merci encore à Dan Rousseau
--
ATTENTION! Un nombre bien défini (mais bientôt exponentiel) de voleurs
tentent de s'introduire chez toi pour voler ton laptop et tes disques
durs avec tous tes backups, Il faut te défendre! À vrai dire c'est
ce que tu devras faire quand le projet sera terminé. En attendant,
souffre et contemple impuissament avec horreur ces centaines de voleurs
pénétrer ta maison.

note: je cherche encore à trouver un moyen pour que mes voleurs ne
se dessine pas les uns par dessus les autres de manière perspectivement
irréelle. Je cherche a faire fonctionner le paramettre Z en relation avec
la position Y (plus il est bas, plus il est en avant).

Grandement inspiré de Defend your Castle de Xgen Studios
http://www.xgenstudios.com/play/castle/

================================================================
*/

//Variables statiques: nuages//

int pelouse, sunx, suny;
int nuages = 5;
  float[] nx;
  float[] ny;
  float[] ns;
  float[] nh;
  
//Variables Thieves//

ArrayList thieves;
int nbThieves;
int timeNB, timeSP, time;
float tx, ty, minimumspeed;
float[] tspeed;

/////////////
//  Setup  //
/////////////

void setup() {
  size(400, 400);
  smooth();
  frameRate(60);
  
  //le temps//
  
  timeNB = millis();
  timeSP = millis();
  time = 20000;
  
  //Le Static Background + nuages//
  
  pelouse = 3*(height/4);
  sunx = 5*(width/6);
  suny = height/6;
  
  nx = new float[nuages];
  ny = new float[nuages];
  ns = new float[nuages];
  nh = new float[nuages];
  
  for( int i =0; i < nuages; i++) {
    nx[i] = random(width);
    ny[i] = random(height/5);
    ns[i] = random(0.1,0.5);
    nh[i] = random(20,50);
  }
  
  
  //Thieves//
  
  minimumspeed = 0.1;
  nbThieves = 10;
  thieves = new ArrayList();
  
  tspeed = new float[nbThieves];
  
  for(int i = 0; i < nbThieves; i++){
    tx = random(450, 800);
    ty = random(pelouse, height-20);
    tspeed[i] = random(minimumspeed, minimumspeed + 1.4);
    
    Thief thief = new Thief(tx, ty, tspeed[i]);
    thieves.add(thief);
  }
  
}

////////////
//  DRAW  //
////////////

void draw() {
  scene();
  
  for( int i =0; i < nuages; i++ ) {
    nx[i] = nx[i] + ns[i];
    if (nx[i] > width+200) {
      nx[i] = -100;
      ny[i] = random(height/6);
    }
    nuage(nx[i], ny[i], ns[i], nh[i]);
 }
 
 //Thieves//
 
 for(int i = 0; i < thieves.size(); i++){
   Thief thief = (Thief) thieves.get(i);
   thief.draw();
   
   //**CETTE COMMANDE SERA A ETRE MODIFIEE POUR FAIRE PERDRE LE JOUEUR**//
   //en atendant, elle renvoit les voleurs a lexterieur de lecran a droite
   if(thief.tx < 40){
     thief.tx = random(450, 800);
     thief.ty = random(pelouse, height-20);
   }else{
     float angle = atan2(290 - thief.ty,38 -  thief.tx);
     //float posX = cos(angle);
     float posY = sin(angle)/2;
     thief.tx = thief.tx - tspeed[i];
     thief.ty = thief.ty + (posY);
 

   }
 }
 
   
 
}

/////////////////////////////////////////
//  La scene qui represente le decors  //
/////////////////////////////////////////

void scene() {
 //ciel//
 background(129, 201, 255);

 //soleil//
 fill(249, 250, 9);
 ellipse(sunx, suny, 75, 75);
 fill(0);
 ellipse(sunx+10, suny-10, 10, 10);
 ellipse(sunx-10, suny-10, 10, 10);
 ellipse(sunx, suny+20, 5, 5);
 
 //pelouse//
 rectMode(CORNER);
 fill(19, 234, 17);
 rect(0, pelouse, width, height/4);
 
 //maison//
 fill(240);
 rect(-50, pelouse-100, width/3, height/3);
 
 //toit//
 fill(242, 97, 0);
 triangle(106, 210, -10, 100, -10, 210);
 
 //porte//
 rectMode(CENTER);
 fill(0);
 rect(40, pelouse, 25, 50);
}

///////////////////////////
//  Fonction des nuages  //
///////////////////////////

void nuage(float nx, float ny, float ns, float nh) {
  
  fill(255);
  ellipse(nx+ns, ny, 2*nh, nh);
  
}



void mousePressed() {
  println("Clique x"+mouseX+" y "+mouseY); 
}

