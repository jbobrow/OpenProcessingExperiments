
int a = 20;
int b = 20;
int nm = 5; //numero mafaldas
int i;
int MafaldaVaria;

float midax = 445;
float miday = 250;



// MATRIZ DE POSICIONES DE LOS ELEMENTOS.

float [] px = new float[nm];
float [] py = new float[nm];

float [] vpx =new float[nm];
float [] vpy =new float[nm];


void setup() {

  size(1000, 1000);

  for (int i=0; i<nm ; i++) {
    px[i]=(px[i]+width/2);
    py[i]=(py[i]+height/2);

    vpx[i]= random (-a, b);
    vpy[i]= random (-a, b);
  }
}

void draw() {

  background (250-mouseY/5, 5-mouseY/5, 55-mouseY/5);

  for (int i=0; i<nm; i++) {

    px[i] += vpx [i];
    py[i] += vpy [i];


    //Comprabar el rebote de las mafaldes.

    if ( px[i]+midax/2 > width||px[i]-midax/2 < 0) {
      vpx[i]= -vpx[i];
    }

    else {
      vpx[i]= random(-a, b);
    }


    if (py[i]+miday/2 > height||py[i]-420/2 < 0) {
      vpy[i] = -vpy[i];
    }

    else {
      vpy[i]= random(-a, b);
    }



    //DIBUJO DE LA MAFALDA:

    fill(0); //PELO
    ellipse(px[i], py[i]-30, 450, 300);

    fill(240, 196, 160); //CARA
    stroke(240, 196, 160);
    ellipse(px[i], py[i]+20, 270, 170);

    fill(240, 196, 160); //CARA
    stroke(240, 196, 160);
    quad(px[i]-100, py[i]-135, px[i]+100, py[i]-135, px[i]+70, py[i], px[i]-70, py[i]);

    fill(0); //FLEQUILLO
    stroke(0);
    arc(px[i], py[i]-139, 220, 90, 0, PI+QUARTER_PI, OPEN);

    fill(0); //OJO IZQ
    stroke(0);
    ellipse(px[i]-20, py[i]-50, 10, 27);

    fill(0); //OJO DERECHO
    stroke(0);
    ellipse(px[i]+20, py[i]-50, 10, 27);

    fill(0); //BOCA
    ellipse(px[i], py[i]+30, 150, 60);

    fill(240, 196, 160); //BOCA
    stroke(240, 196, 160);
    rect(px[i]-100, py[i]-5, 200, 35);

    fill(245, 171, 114); //NARIZ
    stroke(0);
    strokeWeight(2);
    ellipse(px[i], py[i]-10, 40, 40);

    // El tamaño de los mofletes varian según su posición respecto al fondo.

    fill(255, 0, 0);   //MOFLETE IZQ
    stroke(255, 0, 0);
    ellipse(px[i]-80, py[i]+5, px[i]/10+30, px[i]/20+20);

    fill(255, 0, 0); //MOFLETE DERECHO
    stroke(255, 0, 0);
    ellipse(px[i] + 82, py[i]+5, px[i]/10+30, px[i]/20+20);



    fill(255, 0, 0);   //LAZO IZQ
    stroke(0, 0, 0);
    quad(px[i]-100, py[i]-210, px[i], py[i]-180, px[i], py[i]-180, px[i]-100, py[i]-140);

    fill(255, 0, 0);   //LAZO DERECHO
    stroke(0, 0, 0);
    quad(px[i]+100, py[i]-210, px[i], py[i]-180, px[i], py[i]-180, px[i]+100, py[i]-140);

    stroke(0);   //LINEA LAZO
    line(px[i]-70, py[i]-180, px[i]+75, py[i]-180);

    fill(255, 0, 0);   //ELIPSE LAZO
    stroke(0);
    ellipse(px[i], py[i]-180, 70, 40);
  }
}

void mousePressed() {

  px[MafaldaVaria]=(mouseX);
  py[MafaldaVaria]=(mouseY);

  if (mouseX < 100) {
    px[MafaldaVaria] = mouseX +70;
  }

  if (mouseY < 50) {
    py[MafaldaVaria] = mouseY +30;
  }

  if (mouseX > width - 10) {
    px[MafaldaVaria] = mouseX -70;
  }

  if (mouseY > height - 50) {
    py[MafaldaVaria] = mouseY -30;
  }

  if (mousePressed) {
    background(136, 201, 124);
    px[i] = mouseX;
    py[i] = mouseY;

    textSize (100);
    fill (255);
    text("HOLA!", px[i]-145, 250+py[i]);
  }
}








