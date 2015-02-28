
//Gustavo Benato Justen 11/03/2014
/*Carandiru Final de Gustavo Justen estÃ¡ licenciado com uma LicenÃ§a Creative Commons - AtribuiÃ§Ã£o-NÃ£oComercial 4.0 Internacional.*/

int a;
int b;
float x;
float y;
int demo = 0;

int [][] janelas;

void setup() {
  size(1000, 400);
  stroke(255);
  janelas=new int[10][9];
  
  for (int i=0; i<10; i++)
    for (int j=0; j<9; j++)
      janelas[i][j]=floor(random(0, 255));
      
  a = height/2;
  b = height/2;
  //variÃ¡veis helicÃ³ptero
  x = width/2;
  y = height/2;
}
void draw() {

  //cÃ©u
  noStroke();
  fill(100);
  for (int i = 0; i<width; i+=3)
  {
    for (int j = 0; j<height; j+=3)
    {
      fill(155 +j/6, 200 +i/40, 210);
      rect(i, j, 20, 20);
    }
  }

  //prÃ©dios demolidos
  switch(demo) {
  case 0:
    if (demo==0) {
      a++;
    };

    fill (136, 139, 139);
    stroke (107, 108, 108);
    strokeWeight (2);
    rect (30, a+70, 250, a);
    rect (370, 270, 250, 130);
    a = a + 4;
    break;
  case 1:
    if (demo==1) {
      a++;
    };

    fill (136, 139, 139);
    stroke (107, 108, 108);
    strokeWeight (2);
    rect (30, a+70, 250, a);
    rect (370, b+70, 250, b);
    a = a + 4;
    b = b + 4;
    break;
  }
  //prÃ©dio intacto
  rect(690, 270, 250, 130);

  //Janelas
  switch(demo) {
  case 0:
    strokeWeight (3);
    for ( int j=0; j<9; j++)
      for ( int i=0; i<10; i++) {
        fill (janelas[i][j]);
        rect (35+j*29, a+80+i*30, 10, 25);
        rect (375+j*29, 275+i*30, 10, 25);
        rect (695+j*29, 275+i*30, 10, 25);
      }
    break;
  case 1:
    strokeWeight (3);
    for ( int j=0; j<9; j++)
      for ( int i=0; i<10; i++) {
        fill (random (100));
        rect (35+j*29, a+80+i*30, 10, 25);
        rect (375+j*29, b+80+i*30, 10, 25);
        rect (695+j*29, 275+i*30, 10, 25);
      }
    break;
  }
  //fumaÃ§a
  for (int b=0; b<60; b+=1) {
    noStroke ();
    fill(random(109, 0), random(111, 0), random(97, 0), random(200));
    ellipse(random(20, 680), random(380, 400), random(b, b), random(b, b));
  }
  heli();
}
void heli() {
  //helicÃ³ptero
  fill(0);
  ellipse (x, 100, 50, 35);
  triangle (x-60, 80, x-20, 100, x-60, 100);
  noStroke();
  fill(0, 0, 0, 100);
  if (floor(x)%2==0)
    ellipse (x+5, 80, 30, 5);
  else
    ellipse (x-5, 80, 30, 5);
  ellipse (x-60, 77, 10, 5);

  x = 320 + 200*sin (y);
  y = y + 0.1;
}

void mouseClicked() {
  if (mouseButton==LEFT) {
    demo = 0;
  }
  else {
    demo = 1;
  }
}

    


