
//import processing.video.*;

//MovieMaker mm;

void setup (){
  size (1000,600);
//  mm= new MovieMaker (this,width,height, "composicionAnimadaVideo.mov");
  
}


void draw (){
  
  background(0);
  frameRate (15);
 
rojo();
 
 blanco();
 
amarillo ();
  
  
//  mm.addFrame ();
}



void rojo(){
 
    strokeWeight( 1);
  
 for ( float a=0 ; a<height; a+=20){
   for (float b=0; b< width ; b+=5){
  
   noFill();
   stroke (255,0,0,random (200));
 
   ellipse (b, a, 10*(a/b) , 5*(a/b));

   }
 }
}

void blanco(){

  strokeWeight (1);

for ( float c=0; c<height ; c+=20){
  for (float d=0; d<width ; d+=10+c){
    
 noFill();
 stroke (255,random (150));
 
 ellipse (d , c, c/2, d/2);
  }
}
  
}


void amarillo(){
  
  strokeWeight (1);
  
  for (float e=0 ; e< height ; e+= 20){
    for (float f=0 ; f< width ; f+=20){
      
      noFill();
      stroke (255,255,0,random(50));
      ellipse (f,e, f-e,50);
    }
  }
}

void keyPressed (){
  
  if( key == ' '){
//    mm.finish();
  exit();
}
}

