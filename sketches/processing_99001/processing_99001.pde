

String texto = "la creatividad va de la mano con la naturaleza y la observacion sin razon a ser justa y recta  y entonces el mundo da vueltas y  no podemos ahcer nada  pues obvio, la vuelta y da y da y da da,,......";
float x, y, x2=width/2, y2=height/2, r=20;
PFont font;
int cont = 0;
float arclength = 1, angulo, w;


void setup() {
  size(700, 700);
  font = createFont("Symphony_demo.ttf",60); 
  noLoop();
}
void draw() {
  background(255); 
  fill(0);

  for (float i=0 ; cont<texto.length() ; i+=0.1) {
    println(texto.charAt(cont));
    w = textWidth(texto.charAt(cont)+"");
    arclength += w/2;
    angulo = PI + (arclength / (r*i/1.35));

    x = width/2 + (r*i/1.35) * cos(i);
    y = height/2 + (r*i/1.35) * sin(i); 

    textFont(font, 2.5*i);

    pushMatrix();
    //translate(width/2 +x, height/2 +y);
    //rotate(angulo );
    text(texto.charAt(cont), x, y);
    popMatrix();
    //line(x2,y2,x,y);


    x2 = x;
    y2 = y;
    cont++;
    //r += 2;
  }
}



