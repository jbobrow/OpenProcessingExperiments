
// Código Fonte - Arquitetura Moderna à Noite
//Aluna: Stela Mara de Souza da Nóbrega 
//Curso - Arquitetura e Urbanismo P2

/* @pjs preload="noite.jpg"; */

void setup () {
  size (500, 600);

  //paisagem
  PImage img;
  img=loadImage("noite.jpg");
  background(img);//

  //poste
  fill(0);
  rect(450, 270, 6, 180);
  noFill();

  //arco do poste
  for (int x=415; x<422; x=x+1) {
    arc(x, 270, 70, 80, PI, TWO_PI);
  }

  line (380, 270, 386, 270);

  //lampada
  fill(0);
  quad (380, 270, 386, 270, 390, 275, 376, 275);

  //casa
  fill(173, 54, 21);
  int x=40; 
  int y=540;
  quad (x, y-200, x, y, x+150, y, x+150, y-200);

  //platibanda
  quad (x-10, y-205, x, y-200, x+150, y-200, x+160, y-205);

  //janela
  strokeWeight(2);
  fill(212, 247, 100);
  rect(70, 370, 55, 75);
  line (97, 370, 97, 445);
  line (70, 415, 125, 415);

  //porta
  fill(0);
  strokeWeight(2);
  stroke(1);
  rect(70, 470, 90, 70);

  //friso da porta
  strokeWeight(1);
  stroke(188, 179, 177); 
  for (int i=75; i<160; i+=5) {
    if (i<160) {
      line (i, 540, i, 470);
    }
  }
}



//estrela e animação
void draw ()
{
  fill(218, 219, 31);
  if (mousePressed == true) 
  {
    if ( mouseX >= 250 && mouseX <=500  && mouseY <=270)
      star(mouseX, mouseY, 8, 3, 7);
  }


  //traço de luz
  if ( mouseX >= 360 && mouseX <=400 && mouseY >= 275 && mouseY <= 470)
  {
    fill(255, 255, 30, 2);
    noStroke ();
    quad (375, 275, 340, 470, 420, 450, 390, 275);
  }
  else 
  {

    fill(75, 104, 206, 10);
   noStroke (); 
    quad (375, 275, 340, 470, 420, 450, 390, 275);
  }
}


//função estrela 
void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}



