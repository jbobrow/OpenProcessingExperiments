
//Activa la composición que se desea ver.
int contador=0;


int PosX=250;
int PosY=300;

//ESCALA
float escala=1.0;

//IMAGEN ORIGINAL

PImage img;

void setup() {
  size(500, 600);
  // Images must be in the "data" directory to load correctly
  img = loadImage("scream.jpg");
}


void draw() {
  if (contador==0) {
    image(img, PosX-250*escala, PosY-300*escala, 500*escala, 600*escala);
  }
  //-------------------------------------------//

  if (contador==1) {

    background(#FF9A5F);

    //AGUA
    noStroke();
    fill(#296CC1);
    rect(PosX-250*escala, PosY-180*escala, 500*escala, 600*escala);

    //COLOR ROSA CLARO-DERECHA
    fill(#FFBB8E);
    bezier(PosX+30*escala, PosY+200*escala, PosX+70*escala, PosY+20*escala, PosX+130*escala, PosY-50*escala, PosX+251*escala, PosY-150*escala);
    quad(PosX+29*escala, PosY+200*escala, PosX+250*escala, PosY-150*escala, PosX+250*escala, PosY+300*escala, PosX+250*escala, PosY+300*escala);

    fill(#296CC1);
    ellipse(PosX+120*escala, PosY-100*escala, 160*escala, 100*escala);

    //LINEAS ARRIBA

    strokeWeight(30*escala);
    stroke(#F26100);
    bezier(PosX-250*escala, PosY-260*escala, PosX-125*escala, PosY-270*escala, PosX*escala, PosY-235*escala, PosX+250*escala, PosY-260*escala);

    strokeWeight(30*escala);
    stroke(#FA8100);
    bezier(PosX-250*escala, PosY-230*escala, PosX-125*escala, PosY-250*escala, PosX*escala, PosY-205*escala, PosX+250*escala, PosY-240*escala);

    strokeWeight(30*escala);
    stroke(#FFAE58);
    bezier(PosX-250*escala, PosY-210*escala, PosX-125*escala, PosY-240*escala, PosX*escala, PosY-195*escala, PosX+250*escala, PosY-230*escala);

    strokeWeight(30*escala);
    stroke(#FA8100);
    bezier(PosX-250*escala, PosY-180*escala, PosX-125*escala, PosY-210*escala, PosX*escala, PosY-170*escala, PosX+250*escala, PosY-200*escala);

    strokeWeight(30*escala);
    stroke(#FAC800);
    bezier(PosX-250*escala, PosY-150*escala, PosX-125*escala, PosY-180*escala, PosX*escala, PosY-140*escala, PosX+250*escala, PosY-170*escala);


    //PISO
    noStroke();
    fill(#BC9A87);
    quad(PosX-250*escala, PosY+300*escala, PosX-250*escala, PosY-100*escala, PosX-190*escala, PosY-100*escala, PosX+300*escala, PosY+320*escala);

    //LINEAS PISO
    strokeWeight(10*escala);
    stroke(#A07B55);
    line(PosX-280*escala, PosY-100*escala, PosX+70*escala, PosY+300*escala);

    strokeWeight(10*escala);
    stroke(#A07B55);
    line(PosX-290*escala, PosY-100*escala, PosX*escala, PosY+300*escala);

    strokeWeight(10*escala);
    stroke(#A07B55);
    line(PosX-290*escala, PosY-60*escala, PosX-70*escala, PosY+300*escala);

    strokeWeight(10*escala);
    stroke(#A07B55);
    line(PosX-290*escala, PosY-40*escala, PosX-140*escala, PosY+300*escala);

    strokeWeight(10*escala);
    stroke(#A07B55);
    line(PosX-260*escala, PosY-10*escala, PosX-240*escala, PosY+300*escala);

    //ISLA AMARILLA
    fill(#FAB832);
    noStroke();
    bezier(PosX-250*escala, PosY-100*escala, PosX-125*escala, PosY-20*escala, PosX+240*escala, PosY-50*escala, PosX+70*escala, PosY-120*escala);

    //BARANDAS
    //VERTICALES
    strokeWeight(4*escala);
    stroke(#673415);
    line(PosX-190*escala, PosY-55*escala, PosX-190*escala, PosY-5*escala);

    strokeWeight(6*escala);
    stroke(#673415);
    line(PosX-95*escala, PosY+10*escala, PosX-95*escala, PosY+110*escala);

    strokeWeight(8*escala);
    stroke(#673415);
    line(PosX+45*escala, PosY+110*escala, PosX+45*escala, PosY+270*escala);

    strokeWeight(10*escala);
    stroke(#673415);
    line(PosX+125*escala, PosY+162*escala, PosX+125*escala, PosY+310*escala);

    //TRAVESAÑOS
    strokeWeight(5*escala);
    stroke(#673415);
    line(PosX-250*escala, PosY-100*escala, PosX+350*escala, PosY+450*escala);

    strokeWeight(8*escala);
    stroke(#FCC254);
    line(PosX-250*escala, PosY-100*escala, PosX+300*escala, PosY+280*escala);



    //PERSONAJE PPAL
    //CUERPO
    noStroke();
    fill(#1C2331);
    ellipse(PosX+45*escala, PosY+150*escala, 75*escala, 150*escala);

    noStroke();
    fill(#1C2331);
    ellipse(PosX+15*escala, PosY+250*escala, 75*escala, 150*escala); 

    noStroke();
    fill(#1C2331);
    ellipse(PosX+10*escala, PosY+100*escala, 20*escala, 70*escala); 

    noStroke();
    fill(#1C2331);
    ellipse(PosX+85*escala, PosY+100*escala, 20*escala, 70*escala); 

    //CARA
    noStroke();
    fill(#FFCA74);
    ellipse(PosX+50*escala, PosY+25*escala, 65*escala, 65*escala); 

    noStroke();
    fill(#FFCA74);
    ellipse(PosX+52*escala, PosY+55*escala, 30*escala, 60*escala); 

    //BOCA
    stroke(#8B6F42);
    strokeWeight(3*escala);
    noFill();
    ellipse(PosX+52*escala, PosY+58*escala, 10*escala, 23*escala); 

    //OJOS
    noStroke();
    fill(#8B6F42);
    ellipse(PosX+33*escala, PosY+28*escala, 10*escala, 10*escala); 

    noStroke();
    fill(#8B6F42);
    ellipse(PosX+63*escala, PosY+30*escala, 10*escala, 10*escala); 

    //MANOS
    noStroke();
    fill(#F2CA89);
    ellipse(PosX+88*escala, PosY+38*escala, 10*escala, 58*escala); 

    noStroke();
    fill(#F2CA89);
    ellipse(PosX+12*escala, PosY+36*escala, 10*escala, 58*escala); 

    //GENTE ATRAS
    fill(#0A386F);
    quad(PosX-222*escala, PosY-120*escala, PosX-195*escala, PosY-120*escala, PosX-202*escala, PosY+2*escala, PosX-222*escala, PosY+0*escala);
    ellipse(PosX-209*escala, PosY-135*escala, 14*escala, 24*escala);

    fill(#7D4581);
    quad(PosX-260*escala, PosY-120*escala, PosX-232*escala, PosY-120*escala, PosX-240*escala, PosY+0*escala, PosX-248*escala, PosY+0*escala);
    ellipse(PosX-243*escala, PosY-135*escala, 14*escala, 24*escala);

    //MARCO
    fill(#FF9A5F);
    rect(PosX-250*escala, PosY-400*escala, 500*escala, 100*escala);
    rect(PosX+250*escala, PosY-300*escala, 300*escala, 600*escala);
    rect(PosX-250*escala, PosY+300*escala, 600*escala, 300*escala);
    rect(PosX-500*escala, PosY-300*escala, 250*escala, 620*escala);
  }

  //--------------------------------------//

  if (contador==2) {

    background(#ebdebb);

    //BLANCO ARRIBA
    fill(255);
    stroke(255);
    noStroke();
    quad(PosX-250*escala, PosY-222*escala, PosX-250*escala, PosY-137*escala, PosX-88*escala, PosY-221*escala, PosX-77*escala, PosY-291*escala);
    quad(PosX-89*escala, PosY-221*escala, PosX-78*escala, PosY-291*escala, PosX+250*escala, PosY-163*escala, PosX+250*escala, PosY-75*escala);

    //CUADRO AMARILLO
    fill(#f2b600);
    quad(PosX-156*escala, PosY-261*escala, PosX-78*escala, PosY-297*escala, PosX-23*escala, PosY-269*escala, PosX-89*escala, PosY-222*escala);

    //CIRCULO AZUL
    fill(#458ccc);
    ellipse(PosX+82*escala, PosY-203*escala, 150*escala, 140*escala);
    //CIRCULO ROJO
    fill(#cb4343);
    ellipse(PosX+73*escala, PosY-198*escala, 100*escala, 95*escala);

    //SECCION CUADROS NEGROS CENTRALES
    fill(255);
    noStroke();
    quad(PosX-260*escala, PosY+20*escala, PosX+250*escala, PosY+231*escala, PosX+250*escala, PosY+300*escala, PosX-168*escala, PosY+300*escala);

    fill(0);
    quad(PosX-260*escala, PosY+20*escala, PosX-134*escala, PosY+177*escala, PosX-23*escala, PosY+181*escala, PosX-65*escala, PosY+102*escala);
    quad(PosX-134*escala, PosY+177*escala, PosX-42*escala, PosY+285*escala, PosX-150*escala, PosY+280*escala, PosX-210*escala, PosY+174*escala);
    quad(PosX+169*escala, PosY+196*escala, PosX+169*escala, PosY+290*escala, PosX+250*escala, PosY+293*escala, PosX+250*escala, PosY+250*escala);

    //CUADROS A LOS LADOS
    noStroke();
    fill(#c22d03);
    quad(PosX+177*escala, PosY+52*escala, PosX+227*escala, PosY+5*escala, PosX+276*escala, PosY+82*escala, PosX+222*escala, PosY+97*escala);

    fill(#46809c);
    quad(PosX-250*escala, PosY+119*escala, PosX-250*escala, PosY+136*escala, PosX-232*escala, PosY+162*escala, PosX-222*escala, PosY+132*escala);

    //LINEAS
    stroke(0);
    strokeWeight(4);
    line(PosX+250*escala, PosY+211*escala, PosX+124*escala, PosY+130*escala);
    line(PosX+124*escala, PosY+130*escala, PosX+250*escala, PosY+90*escala);
    line(PosX+250*escala, PosY+126*escala, PosX+177*escala, PosY+52*escala);
    line(PosX+177*escala, PosY+52*escala, PosX+250*escala, PosY-15*escala);

    line(PosX-138*escala, PosY+300*escala, PosX-250*escala, PosY+138*escala);
    line(PosX-182*escala, PosY+300*escala, PosX-250*escala, PosY+146*escala);
    line(PosX-250*escala, PosY+222*escala, PosX-221*escala, PosY+132*escala);
    line(PosX-221*escala, PosY+132*escala, PosX-250*escala, PosY+119*escala);

    //ROMBO VIOLETA
    fill(#5a345d);
    noStroke();
    quad(PosX-250*escala, PosY-114*escala, PosX+261*escala, PosY-90*escala, PosX+76*escala, PosY+160*escala, PosX-250*escala, PosY+27*escala);

    //CUADROS DENTRO
    fill(255);
    quad(PosX+15*escala, PosY-101*escala, PosX+130*escala, PosY-95*escala, PosX+75*escala, PosY-19*escala, PosX-40*escala, PosY-32*escala);
    quad(PosX+77*escala, PosY-16*escala, PosX+193*escala, PosY+1*escala, PosX+145*escala, PosY+70*escala, PosX+33*escala, PosY+55*escala);
    quad(PosX-250*escala, PosY-43*escala, PosX-145*escala, PosY-10*escala, PosX-204*escala, PosY+50*escala, PosX-250*escala, PosY+29*escala);

    stroke(0);
    strokeWeight(1);
    line(PosX+250*escala, PosY+293*escala, PosX-250*escala, PosY+276*escala);
    line(PosX-42*escala, PosY+178*escala, PosX+139*escala, PosY+187*escala);
    line(PosX-219*escala, PosY+111*escala, PosX-194*escala, PosY+104*escala);

    //BARANDA
    stroke(0);
    strokeWeight(4);
    line(PosX-250*escala, PosY-83*escala, PosX+250*escala, PosY+250*escala);

    line(PosX-182*escala, PosY-60*escala, PosX-182*escala, PosY+50*escala);
    line(PosX-182*escala, PosY-60*escala, PosX-201*escala, PosY-56*escala);

    line(PosX-82*escala, PosY+4*escala, PosX-82*escala, PosY+96*escala);
    line(PosX-82*escala, PosY+4*escala, PosX-103*escala, PosY+11*escala);

    line(PosX+169*escala, PosY+152*escala, PosX+169*escala, PosY+300*escala);
    line(PosX+169*escala, PosY+152*escala, PosX+122*escala, PosY+168*escala);

    //PERSONAJE
    //CUERPO
    noStroke();
    fill(#28241b);
    quad(PosX-46*escala, PosY+108*escala, PosX+88*escala, PosY+118*escala, PosX+7*escala, PosY+300*escala, PosX-42*escala, PosY+300*escala);

    //CARA
    fill(#b12121, 255);
    quad(PosX-25*escala, PosY+33*escala, PosX+52*escala, PosY+20*escala, PosX+81*escala, PosY+88*escala, PosX+3*escala, PosY+130*escala);

    //BOCA
    fill(#83c0d2);
    triangle(PosX+23*escala, PosY+83*escala, PosX+31*escala, PosY+91*escala, PosX+18*escala, PosY+103*escala);

    //MANOS
    fill(#37b415, 180);
    triangle(PosX-44*escala, PosY+122*escala, PosX-9*escala, PosY+131*escala, PosX-9*escala, PosY+49*escala);

    fill(#37b415, 180);
    triangle(PosX+50*escala, PosY+131*escala, PosX+76*escala, PosY+141*escala, PosX+94*escala, PosY+69*escala);

    fill(#ebdebb);

    //MARCO
    rect(PosX-250*escala, PosY-400*escala, 500*escala, 100*escala);
    rect(PosX+250*escala, PosY-300*escala, 300*escala, 600*escala);
    rect(PosX-250*escala, PosY+300*escala, 600*escala, 300*escala);
    rect(PosX-500*escala, PosY-300*escala, 250*escala, 620*escala);
  }
  textSize(14);
  fill(255);
  text("Presiona ENTER para cambiar de imagen",120,185);
}

void keyPressed() {
  if (keyCode==ENTER) {
    contador++;
  }

  if (contador==3) {
    contador=0;
  }
}



