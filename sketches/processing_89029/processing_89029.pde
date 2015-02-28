
int couleur = 0 ;
float dim ;
int aux=0;
 
void setup() {
  size(600,600) ;
  background(0) ;
  frameRate(45);
  stroke(100);
  colorMode(HSB,100) ;
  smooth();
}
 
void draw() {

  aux++;
  if(aux >=100){
  
    aux=0;
    background(0);
  
  }
  
  if (couleur <= 100) {
  couleur++ ;
  }
  else { couleur = 0 ; }
  fill(40,100,400);
  ellipse (300,400,400,400);
  fill(0);
  ellipse (250,300,30,30);
  ellipse (400,300,30,30);
  fill(#FFFFFF);
  ellipse (250,300,10,10);
  ellipse (400,300,10,10);
  fill(0);
  ellipse (350,450,40,40);

  fill (couleur, 50, 100, 25) ;
   
  dim = dist (random(0,250),random(0,250),random(0,250),random(0,250)) ;
  
  ellipse (random(0,600),random(0,600),dim,dim) ;
   
}



