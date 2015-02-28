
int xPos;
int yPos;
int seite; 
int trans;  
int sca; 
int lum;
int r; 
int g; 
int b;

void setup() {
size(500, 500) ;

xPos= width/4; 
yPos = height/4;
seite = 250;
trans = 0 ; 
sca = 1 ;
lum = 235; 

r = 30;
g = 100;
b = 100; 

}

void draw(){

//background (255);
 
 for ( int i= 0; i< width; i = i+1) {

 fill (r, g, b ); 
 
 rect(xPos + trans, yPos + trans, seite/ sca , seite/sca);
 trans = trans + 6; 
  lum = lum - 5;  
  sca ++ ;  
  
  r = r - 15 ; 
  g = g - 19; 
  b = b + 11 ; 
 
 }

}


