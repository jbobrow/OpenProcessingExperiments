
String texto = "T a m b i é n  e s  t e x t o  u n a  c o m p o s i c i ó n   d e   c a r a c t e r e s   i m p r i m i b l e s   ( c o n   g r a f e m a )   g e n e r a d o s   p o r   u n   a l g o r i t m o   d e   c i f r a d o   q u e ,   a u n q u e   n o   t i e n e n   s e n t i d o   p a r a   c u a l q u i e r   p e r s o n a ,   s í   p u e d e   s e r   d e s c i f r a d o   p o r   s u   d e s t i n a t a r i o   o r i g i n a l .";
float x, y, x2=width/2, y2=height/2, r=6;
PFont font;
int cont = 0;
float arclength, angulo, w;

void setup() {
  size(1200, 700);
  font = loadFont("fuente.vlw"); 
  noLoop();
}
void draw() {
  background(255); 
  fill(0);
  arclength = 1;
  translate(width/2,height/2);
  for (float i=0 ; cont<texto.length() ; i+=0.1) {
    w = textWidth(texto.charAt(cont)+" ");
    arclength += w/2;
    angulo = PI + (arclength / (r*i));
    x = (r*i) * cos(angulo);
    y = (r*i) * sin(angulo); 
    textFont(font, 1*i);
    pushMatrix();
    scale();
    translate(x,y);
    rotate(angulo  + PI/2);
    text(texto.charAt(cont), 0, 0);
    popMatrix();
    arclength += w/2;
    x2 = x;
    y2 = y;
    cont++;
  }
}



