

String str = "Ernesto Cabrera Solis - Aplicaciones Multimedia - Benemerita Univerdidad Autonoma de Puebla - Practica 5a ";
float x, y, x2=width/2, y2=height/2, r=4;
PFont font;
int cont = 0;
float arclength, angulo, w;
void setup() {
  size(700, 700);
  font = loadFont("CourierNew-12.vlw"); 
  noLoop();
}
void draw() {
  background(0); 
  fill(255);
  arclength = 1;
  
  translate(width/2,height/2);

  for (float i=0 ; cont<str.length() ; i+=0.6) {
    w = textWidth(str.charAt(cont)+"");
    arclength += w/1.3;
    angulo = PI + (arclength / (r*i));
    x = (r*i) * cos(angulo);
    y = (r*i) * sin(angulo); 
    textFont(font, 2*i);
    pushMatrix();
    translate(x,y);
    rotate(angulo  + PI/2);
    text(str.charAt(cont), 0, 0);
    popMatrix();

    arclength += w/1.3;

    x2 = x;
    y2 = y;
    cont++;
    //r += 2;
  }
}



