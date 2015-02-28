


float a=0.0;
float speed = 10;
float grav=0.1;

PFont font;

void setup (){
  size (800,600);
  font = loadFont ("Bobcat-72.vlw");
  textFont (font);
}
void draw (){
background (0,0,0);
rectMode (CENTER);
 fill (255);
    text ("Todo y nada", a, 200, 500);
    
   movimiento ();
   rebote();
}
   void movimiento(){
     a=a+ speed;
     speed=speed + grav;
   }
   void rebote (){
     if (a>=600|| a<=0){
  speed = speed*-0.70;
}
}
     
void mousePressed(){
  noLoop();
}
void keyPressed(){
  loop();
}


  

