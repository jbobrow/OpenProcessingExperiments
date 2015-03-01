


void setup(){
  size (500,500);
  background (171,205,239);
  frameRate (100);
}

int a = 0;
int circ = 15;
float angolo=360/circ;

void draw (){
 
translate(250,250);
for ( a=a; a< circ ; a++){
rotate (radians(angolo));
 fill (random (229), random(43), random(80)); 
 ellipse (50,50, 25,80);
ellipse (150,150, 15,30);
ellipse (100,100, 35,10);
}
 }
