
int taille = 100;
Random rnd = new Random();
int x = 0;
int y = 0;
int hauteur = 800;
int largeur = 800;
int tailleCase = largeur / taille;
int r;
int g;
int b;
int diffX;
int diffY;

void setup(){

 this.size(largeur,hauteur);
 /*tabInit(plateau);*/
  
}

void draw(){

  if(mousePressed){
    rafraichir();  
  }
  
}

void rafraichir(){
  
  for(int i = 0; i < taille ; i ++){
   for(int j = 0; j < taille ; j++){
    
     diffX = Math.abs(mouseX - x);
     diffY = Math.abs(mouseY - y);
     
     if(diffX < 50 && diffY < 50){
       r = 50;
       g = 150;
       b = 200;
     }else{
       r = rnd.nextInt(255);
       g = rnd.nextInt(255);
       b = rnd.nextInt(255);
     }
     
     
     
     fill(r,g,b);
     rect(x,y,tailleCase,tailleCase);
     
     x += tailleCase;     
   }
   
    y += tailleCase;
    x = 0;    
  }
  
  x = 0;
  y = 0;
  
}


