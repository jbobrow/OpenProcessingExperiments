

void setup (){
  size (400,400);
  background (255);
frameRate(2);
}
  
  
  int pet=8;
 float angolo =360/pet;
  int i= 0;
  void draw (){
    smooth(2);
    translate(200,200);
     for (i=0; i<pet; i++){
rotate(radians(angolo)); 
ellipse(0,-20,20,20); 
     }   
     for (i=0; i<pet; i++){
rotate(radians(angolo)); //ruota il canvas dell'angolo
 fill( random(255), random (125 ), random (160));
ellipse(20,-40,20,20); 
    
   }
   
    for (i=0; i<pet; i++){
rotate(radians(angolo)); //ruota il canvas dell'angolo
ellipse(40,-60,20,20); //disegna il petalo 
    }
for (i=0; i<pet; i++){
rotate(radians(angolo)); //ruota il canvas dell'angolo
ellipse(60,-80,20,20) ;    
 }
for (i=0; i<pet; i++){
rotate(radians(angolo)); //ruota il canvas dell'angolo
ellipse(80,-80,20,20) ;  
}
for (i=0; i<pet; i++){
rotate(radians(angolo)); //ruota il canvas dell'angolo
ellipse(100,-80,20,20) ;
}
  }
  


