
float angulo= 0.0;
PImage imagen;



void setup(){
  size (800,800);
  smooth();
  noStroke();
  imagen= loadImage ("h.jpg");
  
}

 void draw(){

    fill(0,12);
    rect(0,0,width, height);
    angulo = angulo + 0.10;
    translate(400,400);
    rotate(angulo);
  
    image( imagen,10,10,15,15);
    image( imagen,30,30,15,15);
    image( imagen,50,50,15,15);
     image( imagen,70,70,15,15);
     image( imagen,100,100,15,15);
      image( imagen,130,130,15,15);
      
      
    image( imagen,300,20,20,20);
 
   
 }


