
void setup (){
  size (1000,600);
  
}


void draw (){
  
  background(0);
 
 rojo();
 
 verde ();
  
}

void verde (){
 
  strokeWeight( 0.5);
  
 for ( float a=0 ; a<height; a+=20){
   for (float b=0; b< width ; b+=5){
  
   noFill();
   stroke (0,255,0,70);
 
   ellipse (b, a, 10*(a/b) , 5*(a/b));
  
}
 }
}




void rojo(){
 
    strokeWeight( 1);
  
 for ( float a=-50 ; a<height; a+=30){
   for (float b=-50; b< width ; b+=2){
  
   noFill();
   stroke (255,0,0);
 
   ellipse (b, a, 10*(a/b) , 5*(a/b));

   }
 }
 
  
}

