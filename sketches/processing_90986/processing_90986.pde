
void setup ()
{ //taille du sketch
  size (500, 500,P3D);
  //couleur du fond : blanc
background(255);

smooth();
}

void draw ()
{ 
  //première boucle : profondeur

 for (int z = 0; z < 100; z = z + 10) {
translate(0, 0, z * -15); 

//On recule l'objet sur l'axe z
//Seconde boucle (hauteur)
for (int y = 0; y < 15; y = y + 5) {
  
//Troisième boucle (largeur)
for (int x = 0; x < 15; x = x + 5 ) {
  
  //je dessine mon premier plus, au centre
  //ligne verticale
for(int i=0; i < 500 ;i=i+30){
strokeCap(SQUARE);
stroke(#FFF303,50);
strokeWeight(20);
line(x * i+50,y * i+50,x*i+50,y*i+150);
//ligne horizontale
  strokeCap(SQUARE);
  stroke(#FFF303,50);
  strokeWeight(20);
  line(x * i, y * i+100,x*i+100,y*i+100);}
  
  
  
  //je dessine mon deuxième plus
  //ligne verticale
 
for(int i=0; i < 300 ;i=i+30){
  strokeCap(SQUARE);
  stroke(255,243,3,40);
  strokeWeight(80);
  line(x*i+50,y*i+50,x*i+50,y*i+150);
  
  //ligne horizontale

    stroke(255,243,3,40);
    strokeCap(SQUARE);
    strokeWeight(80);
    line(x*i,y*i+100,x*i+100,y*i+100);}
  
  
  
  
  //je dessine mon troisième plus
//ligne verticale  
for(int i=0; i < 300 ;i=i+30){
    strokeCap(SQUARE);
   stroke(255,243,3,20);
  strokeWeight(120);
  line(x*i+50,y*i+55,x*i+50,y*i+145);
  
  //ligne horizontale
   stroke(255,243,3,20);
    strokeCap(SQUARE);
    strokeWeight(120);
    line(x*i+5,y*i+100,x*i+95,y*i+100);}
    
    smooth();
noLoop();
println();
}
}
 }
}


