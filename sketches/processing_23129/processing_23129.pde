

void setup (){
  size (900,800,P3D);
  background (0);
  smooth ();
}
void draw (){
  crucesita (75,45,100, 100, 700);
 crucesita (0, 20, 350, 230, 400);
}
void crucesita (int gris, int grosor, int x, int y, int largo){
  for ( int c =0 ; c<=width; c=c+80) {
  
stroke (c,c,y);
strokeWeight (grosor);

line (x,y, x +largo,y + largo);
line (x + largo, y,x,y+largo);
ellipse (x-600,y-600, x +largo-600,y + largo-600);
//line (x + largo-100, y-100,x-100,y+largo-100);
noLoop();

fill (100,100,c);
strokeWeight(2);
translate(300,c+100,c/2);
//rotateY(0.5);
box(50);
triangle (c,100,c,200,300,c);
noLoop();
}}



