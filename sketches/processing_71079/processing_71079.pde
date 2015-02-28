
float angulo= 0.0;
PImage img; 


void setup (){
    size (800,800);
    
 img= loadImage ("Fondito (25).jpg");} 
 
void draw () {
  fill (0,3);
  rect (0,0, width, height); 
 for (int c=1; c<800; c+=100){
  
   angulo= angulo -0.5;
   translate (400,400);
   rotate (angulo);
   image (img, 30,c,40,c);
   

  
   
    
}   
}

