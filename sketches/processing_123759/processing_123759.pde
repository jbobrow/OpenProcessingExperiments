
/* Comportament Emergent v1.1 - Sergi Garcia - 1r ASIX

El programa consisteix en dues classes: la clase Jugador, que identifica als jugadors dels dos equips, i la classe Pilota, que identifica l'objecte pilota amb el que es juga
S'han utilitzat classes i arrays, tal i com s'especifica a l'enunciat. Especificament, s'utilitzen:
-2 Classes: Jugador i Pilota
-2 Arrays de jugadors: Local i Visitant


*/

/*
1.0: Release. Corregit l'error que feia que la pilota sortÃ­s disparada sense motiu
1.1: Afegides les porteries. Corregit un error pel qual la pilota es podia quedar encallada.
Pla 1.2: Afegir Porters. Afegir calcul de pilota-x-futura i pilota-y-futura per fer una especie de previsiÃ³ d'on estara la pilota.
*/

//Declarem Objectes
Futbolista[] loc = new Futbolista[10];
Futbolista[] vis = new Futbolista[10];
Pilota p = new Pilota();
boolean local = true;

//Dimensionem el camp de futbol i declarem jugadors: 
//Tindran una forÃ§a aleatoria entre 1 i 5, que sera l'impuls al xutar, i una velocitat de 0.75 a 3, que indica com de rapid es mouran pel camp. Aixo simbolitza els jugadors bons i els dolents
void setup(){
  size (800, 400);
  for (int i = 0; i < loc.length; ++i){
    loc[i] = new Futbolista(random(0.75, 3), random (1,5), local);
  }
  local = false;
  for (int j = 0; j < vis.length; ++j){
    vis[j] = new Futbolista(random(0.75, 3), random (1,5), local);
  }
  Pilota p = new Pilota();
}
void draw(){
  //Dibuixem el camp, aixi com les linies del mig i les porteries 
  background(10, 150, 10);
  stroke(255);
  strokeWeight(5);
  line(width/2, 0, width/2, height);
  noFill();
  ellipse(width/2, height/2, 100, 100);
  rect(0, height/2 - 50, 5, 100); 
  rect(width-5, height/2 - 50, 5, 100); 
  noStroke();
  //Procediment: Es dibuixen els dos equips, la pilota, i es calcula si hi ha algÃº disponible per al xut. De ser aixi, xuta!
  //Cal mencionar que en igualtat de condicions, guanyaria el equip visitant ja que el seu xut es calcula l'ultim, pel que tindra prioritat
  //AixÃ³ es corregira en un futur
  for (int i = 0; i < loc.length;i++){
    loc[i].dibuixa();
    vis[i].dibuixa();  
    p.mostra();
    if (abs(loc[i].xPos - p.xpil) < 2 && abs(loc[i].yPos - p.ypil) < 2){
     p.xut(loc[i].yPos, loc[i].potencia, true);
  }
    if (abs(vis[i].xPos - p.xpil) < 2 && abs(vis[i].yPos - p.ypil) < 2){
     p.xut(vis[i].yPos, vis[i].potencia, false);
    }
    loc[i].mou(p.xpil, p.ypil);
    vis[i].mou(p.xpil, p.ypil);
   
  }
  //Independentment del que fagin els jugadors, la pilota seguira rodant
  p.roda();
  
  //Si es marca un gol, reiniciem el camp, i es reassignen nous valors a cada jugador.
  if ((p.ypil > height/2 - 50  && p.ypil< height/2 + 50) && (p.xpil<5 || p.xpil > width-5)){
    p.reset();
    local=true;
    for (int i = 0; i < loc.length; ++i){
    loc[i] = new Futbolista(random(0.75, 3), random (1,5), local);
  }
  local = false;
  for (int j = 0; j < vis.length; ++j){
    vis[j] = new Futbolista(random(0.75, 3), random (1,5), local);
  }
  }
}
//Clase Pilota: Nomes hi haura un objecte pilota al camp, que representa l'esferic amb el que es juga
class Pilota {
  
  //xpil i ypil son les coordenades de la pilota
  //xvel i yvel Ã©s la velocitat de la pilota. El modul de ambdues determina la seva velocitat final
  float xpil;
  float ypil;
  float xvel;
  float yvel;
  Pilota(){
    xpil=500;
    ypil=250;
    xvel=0;
    yvel=0;
  }
  
  void mostra(){
    fill(102,51,153);
    ellipse(xpil, ypil, 10, 10);
    //noFill();
  }
  
  /*RODA
  Post: La pilota ha "rodat" en la direcciÃ³ cap on es movia, i la seva velocitat es decrementa degut al fregament
  */
  void roda(){
    xpil+=xvel;
    ypil+=yvel;
    xvel*=0.97;
    yvel*=0.97;
    if (xpil >= width){
      xpil = width-1;
      xvel=-xvel;
    }
    if (ypil > height){
      ypil = height-1;
      yvel=-yvel;
    }
    if (xpil <= 0){
      xpil=1;
      xvel = -xvel;
    }
    if (ypil <=0){
      ypil=1;
      yvel = -yvel;
    }
    
     
  }
  
  /*Xut
  Post: La pilota ha agafat un impuls igual al doble de la forÃ§a del jugador 
  */
  void xut(float yjug, float forsa, boolean casa){
    if (casa){
      xvel+=forsa*2;
    }
    else xvel+=-forsa*2;
    if (yjug < height/2){
      yvel=random(forsa,forsa*2);
    }
    else if (yjug > height / 2) yvel=-random(forsa,forsa*2);
  }
  
  /*Reset
  Post: La pilota torna al centre del camp
  */  
  void reset(){
    xpil = width/2;
    ypil = height / 2;
    xvel=0;
    yvel=0;
  }
  
  
  
    
}


//Clase Futbolista: Els seus parametres sÃ³n, en aquest ordre:
//Coordenades, Velocitat del jugador, ForÃ§a al xutar, i el seu equip
class Futbolista {
  float xPos;
  float yPos;
  float velocitat;
  float potencia;
  boolean local;
  
  
  //Un futbolista s'inicialitza amb valors aleatoris, un equip marcat, i depenent d'aquest equip, "spawneja" a un o altre banda del camp
  Futbolista(float v, float p, boolean loc){
    velocitat = v;
    potencia = p;
    local = loc;
    if (local){
      xPos = random(0, width/2);
    }
    else xPos = random (width/2, width);
    yPos = random(height);
  }
  
  //Dibuix simple: un jugador es un cercle de radi 20, vermell en cas de ser local, blau en cas de ser visitant
  void dibuixa(){
   if (local){
    fill(255,0,0);
   }
   else fill(0,0,255);
    ellipse(xPos, yPos, 20,20);
  }
  
  /*Mou
  Post: El jugador persegueix la pilota a raÃ³ de x unitats, on x es la seva velocitat
  */
  void mou(float xpil, float ypil){
    if (xPos < xpil){
      xPos+=velocitat;
    }
    else xPos-=velocitat;
    if (yPos < ypil){
      yPos+=velocitat;
    }
    
    else yPos-=velocitat;
  }
  
  
  
}


