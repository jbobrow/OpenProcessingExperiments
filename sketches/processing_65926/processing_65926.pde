
float angulo= 0.0;
PImage imagen;



void setup(){
  size (800,800);
  smooth();
  noStroke();
  imagen= loadImage ("images.jpg");
  
}

 void draw(){

    fill(0,12);
    rect(0,0,width, height);
    angulo = angulo + 900;
    translate(400,400);
    rotate(angulo);
  
    image( imagen,10,10,15,15);
    
     image( imagen,70,70,15,15);
     image( imagen,100,100,15,15);
      image( imagen,130,130,15,15);
      
      
    image( imagen,300,20,20,20);
 
   
 }

 

