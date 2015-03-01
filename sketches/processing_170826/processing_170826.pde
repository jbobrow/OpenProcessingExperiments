
String texto = "_Conhecer profundamente o sistema jurídico e o estado Brasileiro, compreender a atividade empresarial, para prover segurança e conceber soluções eficazes atuando incansavelmente para sua implementação..";
float x, y, x2=width/2, y2=height/7, r=16;
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


