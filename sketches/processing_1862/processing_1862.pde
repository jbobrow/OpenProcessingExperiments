
void setup() {

size (800,600);

background (0);
smooth();
  
}


void draw() {
  
 // Degradado azul
float i=0;

while (i<height){
  
  stroke (33-i,0,255-i);
  line (0,i,width,i);
  i=i+1;
  
}
// defino que dibuje desde el centro
rectMode(CENTER);
translate (width/2,height/2);



//dibujo tallo
stroke(#1CA223);
fill (11,137,0);
rect(0,100,10,200);



// dibujo polen
fill(255,160,5);
stroke (255,255,255,100);
strokeWeight (18);
ellipse (0,0,100,100);




//dibujo los petalos
pushMatrix();

fill (255,90,209,80);
stroke(155,3,112,80);

for (int j=0; j<20;j++)
{
//rotate(PI/6);
//rotate(radians(360/15));
rotate(TWO_PI/20);
  ellipse (0,75,25,60);
  strokeWeight(2);
}

popMatrix ();
//dibujo tierra
fill(11,137,0);
stroke(#1CA223);
rect (0,300,800,200);
//saveFrame("flor.png");

}









