
int i = 1;
int vitesse = 1 ;
int niveau = int(random(500/4,500/2));
boolean inverse = false ;
int numero = 0 ;


void setup() {
  size(500,500);
  smooth();
  
  // Make Mover object
}

void draw() {
  noStroke();
  background(0);
  translate(width/2,height/2);
 
if(numero ==0){
  
 triangle(0,-i,-i,i,i,i);
}

if(numero ==1){
 rectMode(CENTER); 
 rect(0,0,2*i,2*i);
}

if(numero ==2){
 ellipse(0,0,2*i,2*i);
}

 
  if(i>niveau){
    inverse = true ;
    niveau = int(random(height/2));
   
   }
  if(-i>niveau){
    inverse = false ;
    niveau = int(random(height/2));
  } 
 
  if(inverse == false){
   i = i + vitesse ;
  }
  
 if(inverse== true){
   i = i-vitesse ; 
  }
  
 if(keyCode==38){
   vitesse = vitesse + 1 ;
   keyCode = 0 ;
  }
  
  if(keyCode ==40){
    vitesse = vitesse - 1 ; 
     keyCode = 0 ;
     if(vitesse<1){
       vitesse = 1;
     }
  }
  if(keyCode ==39){
    numero = numero + 1 ;
    if (numero > 2){
      numero = 0 ;
    }
    keyCode =0;
      background(0);

    
  }
    
   
}
