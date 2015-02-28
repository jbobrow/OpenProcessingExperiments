
int n = 8;
int hauteur = 300;
int largeur = 300;
int pas=3;
int bordure=20;
float [][] coor = new float [n][2];

// fonction retourne le maximum d'un tableau d'entiers
float maximumAbscisse(float[][] tab){
  float max; 
  max = 0;
  for (int i = 0; i < n; i = i+1) {
    if (tab[i][0] > max){
      max = tab[i][0];
    }
      
  }
  return max ;
}

// fonction retourne le minimum d'un tableau d'entiers
float minimumAbscisse(float[][] tab){
  float min; 
  min = largeur;
  for (int i = 0; i < n; i = i+1) {
    if (tab[i][0] < min){
      min = tab[i][0];
    }
      
  }
  return min ;
}

// fonction retourne le minimum d'un tableau d'entiers
float minimumOrdonnee(float[][] tab){
  float min; 
  min = hauteur;
  for (int i = 0; i < n; i = i+1) {
    if (tab[i][1] < min){
      min = tab[i][1];
    }
      
  }
  return min ;
}
// fonction retourne le maximum d'un tableau d'entiers
float maximumOrdonnee(float[][] tab){
  float max; 
  max = 0;
  for (int i = 0; i < n; i = i+1) {
    if (tab[i][1] > max){
      max = tab[i][1];
    }
      
  }
  return max ;
}
  
void setup(){
size(300,300);  
// initialisation des points
 for (int i = 0; i < n; i++) {
       coor [i][0] = random (20,largeur-20);
       coor [i][1] = random (20,hauteur-20);    
  }
// affiche les coordonnées des  points dans la console
 for (int i = 0; i < n; i++) {    
       println("le point M"+i +" a pour coordonnées :" +  coor [i][0] +" ; "+ coor [i][1]);   
  }
 
}
 
 
void draw(){
stroke(0, 0, 0);


  background(153);
  for (int i = 0; i < n-1; i++) {    
        line( coor [i][0],  coor [i][1],  coor [i+1][0],  coor [i+1][1]);     
  }
// Relie le dernier point au premier 
 line( coor [0][0],  coor [0][1],  coor [n-1][0],  coor [n-1][1]);
 
 // Trace rectangle Cherche les coordonnées les plus grandes
stroke(204, 0, 0);
noFill();
quad(minimumAbscisse(coor ), minimumOrdonnee(coor ), minimumAbscisse(coor ),maximumOrdonnee (coor ),maximumAbscisse(coor ), maximumOrdonnee(coor ) ,maximumAbscisse(coor ), minimumOrdonnee(coor )   );

//déformation du quadrilatère
for (int k = 0; k < n; k++) { 
  if ( bordure< int(coor [k][0]) && (largeur-bordure)>int(coor [k][0])){coor [k][0] =  coor [k][0] +random(-pas,pas);} else { if (bordure> int(coor [k][0])) { coor [k][0] =  coor [k][0] +random(0,pas);}else { coor [k][0] =  coor [k][0] +random(-pas,0);} }      
  if ( bordure< int(coor [k][1]) && (hauteur-bordure)>int(coor [k][1])){coor [k][1] =  coor [k][1] +random(-pas,pas);} else { if (bordure> int(coor [k][1])) { coor [k][1] =  coor [k][1] +random(0,pas);}else { coor [k][1] =  coor [k][1] +random(-pas,0);} }  
    
}

}


