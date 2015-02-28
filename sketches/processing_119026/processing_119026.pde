
int x=0;
int y=0;
int r=30;
int velx=8;
int vely=8;

void setup () {

  size (900, 600);
  background (255);
  smooth();
}

void draw () {

  background (255);
  x=x+velx;
  y=y+vely;
  
  //puc avançar?
  

  //si 

  noStroke();
  fill(0);
  ellipse (x, y, r, r);
  
 
 //rebota en x
 
   if ((x<0-r/2)||(x>width-r/2)){
    
    velx=-velx;
    
    //rebota en y
    
  }else{
    
     if((y<0-r/2)||(y>height-r/2)){
       
       vely=-vely;
     }
   }
}
