

//dibujo fijo, David Alvarez
float d = 1.5;
float n = 4.5;

void setup (){
  size (800,400);
background (0);

}
void draw(){
for (int b = 0; b<=width; b=b+15){
for (int x=0; x<=height ; x=x+30){
smooth ();
strokeWeight (1);
stroke (100,b,b,18);
fill (b,100,b,20);
triangle (b,b,b,100,100,b);
noLoop ();
fill (250,231,20); 
strokeWeight (40);
ellipse (b,x,5,5);
ellipseMode (CORNER);
ellipse (b,x+d,5,5);
fill (250,n,20);
rect (b+d,x+n,20,20);
rect (300+b+d,x,20,20);
ellipseMode (CENTER);
fill (128,128,d,x);
stroke (128,128,128,20);
strokeWeight (50);
ellipse (800,200,100,100);
ellipse (800,200,300,300);
d = d+1;
n = n+3;

noLoop();
}



//sphere (100);
}
}
/*void mousePressed (){
  saveFrame ("1.jpeg");}*/

