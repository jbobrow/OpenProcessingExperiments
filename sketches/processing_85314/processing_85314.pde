
void setup ()
{ //taille du sketch
  size (500,500);
  //couleur du fond : blanc
background(255);
smooth();
}

void draw ()
{ 
  //je dessine mon premier plus, au centre
  //ligne verticale
//for(int i=0; i<500;i+=30){
strokeCap(SQUARE);
stroke(#FFF303,100);
strokeWeight(50);
line(250,125,250,375);//}

// ligne horizontale
//for(int i=0; i<500;i+=30){
  strokeCap(SQUARE);
  stroke(#FFF303,100);
  strokeWeight(50);
  line(125,250,375,250);//}
  
  
  
  //je dessine mon deuxième plus
  //ligne verticale
 
//for(int i=0; i<500;i+=30){
  strokeCap(SQUARE);
  stroke(255,243,3,80);
  strokeWeight(150);
  line(250,125,250,375);//}
  
  //ligne horizontale
 // for(int i=0; i<500;i+=30){
    stroke(255,243,3,80);
    strokeCap(SQUARE);
    strokeWeight(140);
    line(125,250,375,250);//}
  
  
  
  
  //je dessine mon troisième plus
//ligne verticale  
    strokeCap(SQUARE);
   stroke(255,243,3,60);
  strokeWeight(180);
  line(250,145,250,355);
  
  //ligne horizontale
   stroke(255,243,3,60);
    strokeCap(SQUARE);
    strokeWeight(180);
    line(145,250,355,250);//}
noLoop();
}


