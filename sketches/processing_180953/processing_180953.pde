
PFont matypo;
String monTexte; //chaine de caracteres
float x=0;

void setup(){
  monTexte="";
  //matypo=createFont("Times", 24, false);
  matypo=loadFont("Grmd.vlw");
  textFont(matypo, 48);
  size(500, 500);
  background(0);
  fill(250,0, 0);
  textAlign(CENTER);
  noStroke();
  frameRate(30);
  
}
void draw(){
  for (int a=0;a<5;a++){
  char lettre= char((int)random(65,200));//converti un chiffre au hasard en caractere
  fill(random(100,255),random(100,255),random(100));
  text(lettre, random(width), x+random(-10,10)); //text("texte", abcisse, ordonnee)
  fill(0,5);rect(0,0,width, height);
  }
  x+=5;
  if(x>height) {
  x=0;
  }
  //text("ceci est un texte", mouseX, mouseY);
}

/*void mouseReleased(){
  //text(monTexte, mouseX, mouseY);
}*/

/*
void keyReleased(){
 // monTexte= monTexte + key;
for(int a=0; a<20;a++){ 
 //fill(random(100,255), random(100,255), random(100));
 //text("ceci est un texte",random(width), random(height));
 
}
}*/

