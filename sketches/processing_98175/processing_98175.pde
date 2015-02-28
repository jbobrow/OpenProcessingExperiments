
// Felipe Camillo
int ysol=0;
int ylua=0;
int nuvemx=200;


void setup() {

  size(200, 200);
  background(90, 160, 210);
}
void draw() {




  //sol
 stroke(0);
  background (198-ysol, 226-ysol, 255-ysol);
  fill (255, 165, 0);
  stroke (255, 165, 0);
  ellipse (40, ysol, 20, 20);

  if (ylua>=250) {
    ysol=0;
    ylua=0;
  }

  if (ysol<=250) {
    ysol=ysol+1;
  }

  //lua
  if (ysol>250) {
    fill (227, 226, 195);
    stroke (227, 226, 195);
    ellipse (40, ylua, 20, 20);
    ylua=ylua+1;
  }


  //nuvens
  fill(255);
  stroke(255);
  ellipse(nuvemx, 60, 20, 20);
  ellipse(nuvemx+15, 60, 25, 25);
  ellipse(nuvemx+30, 60, 20, 20);

  ellipse(nuvemx+50, 30, 25, 20);
  ellipse(nuvemx+70, 30, 25, 20);
  ellipse(nuvemx+85, 30, 30, 25);
  nuvemx=nuvemx-1;
  if (nuvemx<-120) {
    nuvemx=200;
  }


  //antena
  stroke(119, 136, 153);
  strokeWeight(8);
  strokeCap(SQUARE);
  line(100, 20, 100, 200);
  //parte baixo prédio
  stroke(119, 136, 153);
  strokeWeight(2);
  fill (190, 190, 190);
  rect(70, 90, 60, 140);
  boolean janelas=false;
  //janelas
  //  if (mouseX>=74&&mouseX;<=126&&mouseY;>=94)
    if ((mouseX>=74)&&(mouseX<=126)&&(mouseY>=94)) { // modificado por merkle
    fill(255, 247, 3);
  } 
  else {
    janelas=true;
  }
  noStroke();
  strokeWeight(0);
  for (int i=74; i<126; i=i+5) {
    for (int j=94; j<200; j=j+5) {
      if (janelas==true)
        fill (random(0, 255));
      rect (i, j, 3, 3);
    }
  }
  //linha do meio
  stroke(0);
  stroke(119, 136, 153);
  strokeWeight(6);
  line(100, 90, 100, 200);
  //parte de cima
  stroke(119, 136, 153);
  strokeWeight(2);
  fill (190, 190, 190);
  rect(80, 40, 40, 50);
  //linhas
  stroke(119, 136, 153);
  strokeWeight(2);
  int k=0;
  for (k=40; k<90; k=k+4)
    line(79, k, 120, k);
  //porta
  stroke(99, 39, 19);
  strokeWeight(14);
  line(100, 183, 100, 200);

  //fonte

  fill(255);
  PFont font;
  font = loadFont("BodoniMTPosterCompressed-14.vlw");
  textFont(font, 14);
  text("Felipe", 155, 195);

}
