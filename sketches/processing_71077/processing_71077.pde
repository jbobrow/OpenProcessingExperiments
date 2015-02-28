
float angulo= 0.0;
PImage img; 
int x=30;
int direccion = 5;

void setup (){
    size (800,800);
    
    img= loadImage ("Fondito (25).jpg");} 
   
void draw () {
  fill (0,10);
  rect (0,0, width, height); 
   
   angulo= angulo +0.20;
   translate (400,400);
   rotate (angulo);
   image (img, x, x, 30, 30);
   
    translate (200,200);
   rotate (angulo);
   image (img, 80, x, 30, 30);
   
  
   angulo= angulo +0.9;
   translate (300,300);
   rotate (angulo);
   image (img, 100, 100, 30, 30);
   
     translate (250,250);
   rotate (angulo);
   image (img, 320, 320, 60, 60);
   
  
   angulo= angulo +0.5;
   translate (700,700);
   rotate (angulo);
   image (img, 550, 550, 80, 80);
   
   translate (700,700);
   rotate (angulo);
   image (img, 850, 850, x, x);
   
   
   direccion=direccion -5;
   translate (70,70);
   rotate (direccion);
   image (img, 150, 150, 90, 90);
   
   translate (200,200);
   rotate (direccion);
   image (img, 40, 40, 50, 50);
   
    translate (900,900);
   rotate (direccion);
   image (img, 30, 30, x, x);
   
   
}

