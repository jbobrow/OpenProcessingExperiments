
int[] bob = {5,29,50,10,5,700};//on initialise le tableau, on peut y insérer des chiffres, des caractère, ou des PImage et plain d'autre
int index=0;
String [] pat ={"wow","many code","such java","so processing","cool"};

PFont p;
PImage d;
void setup(){
  size(680,510);
  frameRate(2);
  p = loadFont("ComicSansMS-48.vlw");
   background(255);
   d = loadImage("c09.jpg");
}
  
  void draw(){
   image(d,0,0);
    textFont(p);
    //rect(bob[index],50,20,20);//on dit que la position x se base sur le premier chiffre du tableau...
    fill(random(255),random(255),random(255));
    text(pat[index],random(width),random(height));
    
    index+=1;//... et sur le suivant.
   // if(index>=bob.length){ //si tout les chiffres sont lu du tableau, on recommence au premier chiffre, si index est superieur au nombre présent dans le tableau, une erreur se produit.
     // index=0;
      
      if(index>=pat.length){ //si tout les chiffres sont lu du tableau, on recommence au premier chiffre, si index est superieur au nombre présent dans le tableau, une erreur se produit.
      index=0;
    }
    
  }


