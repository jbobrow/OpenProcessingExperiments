
import processing.opengl.*;

//julio33
//julio108@gmail.com

/* 
a

*/


 float i_x=0,a_x=1, ciclo_x=100;
  float i_y=0,a_y=1, ciclo_y=100;
   float i_z=0,a_z=1, ciclo_z=100;
   
   float rotation_speed=40.0;
int c=0; float extra;

boolean activar_rotacion_x=false;
boolean activar_rotacion_y=false;
boolean leer_pop=true;
boolean activar_cubo=false;
int prevent=0;

void setup () {
  size(500,500,P3D);       
 
  background(255,255,255);
translate (250,250,0);
pushMatrix();

}



void draw () {

  if (leer_pop){ popMatrix();}
  if (!leer_pop){translate (250,250,0); leer_pop=true;   background(255,255,255);  }

//Avance y retroceso 
if (i_x>100) a_x=-1;
if (i_x<-100) a_x=1;
i_x+=a_x;


//Giro
rotateZ((rotation_speed/2000.0)         ); //lo standard es la rotacion en Z


if(keyPressed) {
    if (key == 'x' && prevent ==0) {activar_rotacion_x=!activar_rotacion_x;leer_pop=false;}
    if (key == 'y' && prevent ==0) {activar_rotacion_y=!activar_rotacion_y;leer_pop=false;}
    if (key == 'c' && prevent ==0) {activar_cubo=!activar_cubo;leer_pop=false;}
    
    if (key == 'a' && prevent ==0) {rotation_speed+=3;leer_pop=false;}
    if (key == 's' && prevent ==0) {rotation_speed-=3;leer_pop=false;}
    
    
    if (key == 'q' && prevent ==0) {rotation_speed+=3;}
    if (key == 'w' && prevent ==0) {rotation_speed-=3;}
    
    
  prevent=5;
} else if (prevent!=0)prevent--;


//estas son agregadas
if (activar_rotacion_x) rotateX((40.0/2000.0)  );
if (activar_rotacion_y) rotateY((40.0/2000.0) );

 
 

 
stroke(204, 102, 0);


strokeWeight(2);   // Thicker




smooth();

if (activar_cubo){background(255,255,255);  box(90,90,90); }
else point(i_x, 0, 0);


  pushMatrix();
 
 
}

