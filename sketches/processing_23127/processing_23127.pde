

void setup (){
  size (800,600,P3D);
  background (0);
  smooth ();
}
void draw (){
  crucesita (75,45,100, 100, 700);
 crucesita (0, 20, 350, 230, 400);
}
void crucesita (int gris, int grosor, int x, int y, int largo){
  for ( x = 0; x<=width; x=x+200) {
   
stroke (gris,x,y);
strokeWeight (grosor);
line (x,y, x +largo,y + largo);
line (x + largo, y,x,y+largo);

noLoop();
 for ( int c = 15; c>=600; c=c+50){
fill (100,100,x);
strokeWeight(2);
translate(c, x, y);
rotateY(1);
box(50);
noLoop();
}}}
/*void mousePressed (){
  saveFrame ("1.jpeg");}
*/

