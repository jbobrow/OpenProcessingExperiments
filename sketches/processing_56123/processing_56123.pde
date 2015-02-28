
PImage skogstad;
PImage djurhuvud;
PImage personhuvud;
PImage kropp;
PFont skrivstil;

int level; 

void setup(){ 
  size(364, 400); 
  skogstad = loadImage ("skogstad.gif"); //laddar upp bakgrundsbilden slog och stad
  djurhuvud = loadImage ("djurhuvud.gif"); //laddar upp rådjuret
  personhuvud = loadImage ("huvud.png"); //laddar upp människohuvudet
  kropp = loadImage ("kropp.png"); //laddar upp människokroppen
  level = 100; //värdet på variabeln level
  skrivstil = loadFont("DawningofaNewDay-20.vlw");
}

void draw(){
background(skogstad); //ritar bakgrundsbilden

image(kropp, level,110); //ritar kroppen
image(personhuvud, 70 ,85); //ritar rådjurshuvudet
image(djurhuvud, 250 ,50); //ritar människohuvudet

noStroke();
fill(237,234,203); //crääm färg
rect(7,7,210,15);//bakrundsruta för översta textraden
rect(25,28,280,15);//bakrundsruta för mellersta textraden
rect(18,48,100,15);//bakrundsruta för nedre textraden



fill(49,32,32); //mörkbrun färg
textFont(skrivstil);
text("tryck på plus eller minus",10,20);//översta textraden
text("för att se om du trivs i skogen",30,40);//mellan textrad
text("eller staden",23,60);//undre textraden


}

void keyPressed(){ //gör att råddjurshuvudet rör sig i sidled
if(key == '-'){  //om man trycke på minus så åker men vänster
level = level - 5;
}else if(key == '+'){//om man trycker plus far man åt höger
level = level + 5;
}
}

