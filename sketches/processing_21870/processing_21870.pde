
int c= 14;
 int direccion= 14;
void setup () {

size (800,800);
background (128,20,50);

}
void draw () {
  //par for lo primero es el valos inicial, int, segundo el test boolean, si es verdadero o falso
// si x es mayor esto si es mayor esto orto, cuando llega al falso no lo cumpe,en este caso si s vrdadero le suma 10 (x=+10)

for (int x=000; x<=800; x=x+50) {
  
  for (int b=000; b<=800; b=b+50) {
   
  // noStroke();  fill ( b,x,b);
  
stroke (random (1,x),random (1,200),random (b,200));
strokeWeight  (random (0,c)); 
  fill ( random (1,b),random (1,x),random (1,b));
rect (b,x,random (1,50), random (1,50));
  ellipse (400,400, random (1, 400), random (1,400));

c=c+direccion;

if(c>=14  || c<=1) {
direccion = direccion *-1;}
}
  
}}
void mousePressed() {
  noLoop();
  //saveFrame("pisicodelic-####.png");
  
}
void mouseReleased() {
  loop();
}
/*void keyPressed() {
  saveFrame("pisicodelic-####.png");
}*/


