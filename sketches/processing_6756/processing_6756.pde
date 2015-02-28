
int valeur;
int x = 690;
int y = 580;
int impulsion = 0;
int compteur = 1;

void setup(){
  size(800,600);

  noStroke();
  smooth();
  background(255);
  frameRate(25);
  PFont font;
 font = loadFont("ArialMT-48.vlw"); 
 textFont(font,20); 

 
}

void draw(){
  background(255);
  
  
  text("pour avancer.",x-30,y);
 
  fill(valeur,valeur,valeur);
  
  
  if((mouseX-pmouseX > 100)||(mouseX-pmouseX < -100)||(mouseY-pmouseY > 100)||(mouseY-pmouseY < -100)){
     //rect(mouseX,mouseY,20,20);
     text("Arrêter", mouseX,mouseY);
   valeur=0;
    
  }
  
  float distance = dist(x,y,mouseX,mouseY);
  
  if (distance < 50){ impulsion = 50;
  compteur = int(random(1,5));
    
  }
  
  if(impulsion > 5){ impulsion = int(impulsion/1.1);}
    else{impulsion = 0;}
  
  if(compteur == 1){  
    x += impulsion;  
    y += impulsion;
   }
    if(compteur == 2){  
    x -= impulsion;  
    y += impulsion;
   }
    if(compteur == 3){  
    x += impulsion;  
    y -= impulsion;
   }
    if(compteur == 4){  
    x -= impulsion;  
    y -= impulsion;
   }
   
   if(x <= 30){ x += impulsion;}
   if(y <= 10){ y += impulsion;}
   if(x >= 710){ x -= impulsion;}
   if(y >= 590){ y -= impulsion;}
  
  
}

