
// MARTINS Julie

void setup()
{
  
  // j'agrandis la fenêtre
  size(1200,850);
  // je mets un fond blanc (pour faire ressortir couleurs)
  background(0,0,0);
  
  
  
  
  //fermeture accolade void setup ->
}

   
   
// a chaque instant les lignes se construisent la souris
void draw(){
  
  // je veux que les lignes se construisent que quand je clique sure la souris.
  if(mousePressed ==true){
  
  //couleur de la ligne: (ici blanche)
  //stroke(255,255,255,random(0,50));
  
  // ligne avec couleurs aléatoires
  stroke(random(10,201),random(100,201),random(50,241),random(0,65));
  
  //ligne dessinee au hasard (position de la souris X,Y, points au hasard, points au hasard)
  line(mouseX,mouseY,random(10,850),random(10,850));
  
  // j'ai voulu changer l'épaisseur des lignes autour des cercles de couleurs
  // j'ai copié code et obtenu un résultat au hasard qui comprend lignes+ cercles
  strokeWeight(random (1,8)); 
  strokeWeight(random (1,25)); 
  
  
  stroke(random (90,201),60,76,random(10,152));
  
  // remplir les cercles:
  fill (random(0,130),random(30,95),random(0,200),random(30,65));
  
  // faire des cercles selon la souris (en aléatoire) autour de celle -ci
  ellipse(mouseX+(random(-150,150)),mouseY+(random(-150,150)),20,20);
  
  
  //stroke= couleur de la ligne, radom= opacité (aléatoire de 0% a 152%)
  
  
  //ligne rose
  //line(random(0,850),random(0,850),mouseX,mouseY);
  
  
  //lignes orange
  stroke(random (100,201),random (20,90),20,random(20,90));
  line(random(mouseX,1200),random(mouseY,850),mouseX,mouseY);
  } else{
    //background(0,0,0);
    //balise de fin de else:
  }
  
  
  //balise fin void draw:
}
  
  
    
    
  
  
