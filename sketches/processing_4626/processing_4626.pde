

/// This is basicaly a tetris like game, but you'll have to manually "kill" the adjascent objects (two minimum) by clicking on one
/// This game is very boring


PFont myFont;
int taille,t2,nh,nw,score,scoreProvisoire;
int[] compteurColonnes;
color[] colors;
emplacement[] points;
emplacement[] rang1;
int[] avider;
String state="wait";
boule[] boulesToKill;
boule[] boules;
int next, delai; 
int sens=1;
fallingscore[] fallingscores;

void setup(){
  textAlign(CENTER);
  stroke(255);
  size(240,480);
  myFont = createFont("arial",12,false);
  textFont(myFont,12);
  taille = 20;
  debut();
  background(0);
}

void draw(){
  background(0);
  if(state=="playing"){
    compteurColonnes  = new int[nw];
    if(millis()>next){
      next = millis()+delai;
      new boule();
    }
    for(int a=0;a<boules.length;a++){
      boules[a].dessine();
    }
    for(int a=0;a<points.length;a++){
      points[a].checkdisp();
    }
    for(int a=0;a<compteurColonnes.length;a++){
      if(compteurColonnes[a]>=nh){
        textAlign(CENTER,CENTER);
        state="start";
      }
    }  
    fill(255);
    textAlign(LEFT);
    text("Boretris",t2,14);
    textAlign(RIGHT);
    text(score,width-t2,14);
    stroke(255);
    line(0,18,width,18);
    fallingscore[] prov = new fallingscore[0];
    for(int a=0;a<fallingscores.length;a++){
      fallingscores[a].dessine();
      if(!fallingscores[a].dead){
        prov=(fallingscore[]) append(prov, fallingscores[a]);
      }
    }
    fallingscores = prov;
    noStroke();  
  } else {
    String message ="";
   if(state=="pause"){
      message = "Game paused\nclick to play";
   } else {
       message = "Click to start"; 
   }
   text(message, width/2, height/2);
  }
}

void debut(){
  fallingscores = new fallingscore[0];
  delai=300;
  score=0;
  t2=taille/2;
  pickColors(4); 
  nw = (width-6)/taille;
  nh = (height-36)/taille;
  compteurColonnes = new int[nw];
  int decx=(width-(nw*taille))/2+t2;
  int decy=(height-(nh*taille)); ///2+20;
  boules = new boule[0];
  points = new emplacement[0];
  rang1 = new emplacement[0];
  for(int a=0;a<nw;a++){
    for(int b=0;b<nh;b++){
      new emplacement(a,b, decx,decy);
    }
  }  
  next = millis()+delai;
}

void pickColors(int n){
  colors = new color[3];
  colors[0]=color(random(50),random(100,200),random(180,255));
  colors[1]=color(random(180,255),random(50),random(100,200));
  colors[2]=color(random(100,200),random(180,255),random(50));  
  if(n>3){
    colors =(color[]) append(colors ,color(random(180,255),random(180,255),0));  
  }
  if(n>4){
    colors =(color[]) append(colors ,color(random(180,255),0,random(180,255)));  
  }

  if(n>5){
    colors =(color[]) append(colors ,color(0,random(180,255),random(180,255)));   
  }
  if(n>6){
    for(int a=0;a<(n-6);a++){
      colors = (color[])append(colors, color(random(255),random(255),random(255)));
    }
  }
}






