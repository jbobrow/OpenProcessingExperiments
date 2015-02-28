
//Wictor Hugo - Fachada Interativa
//import processing.pdf.*;
int yc=0;
PFont fonte;
void setup() 
{
  size(200, 200);
  fonte = createFont("georgia", 12);
 //beginRecord(PDF, "Wictor Hugo Trabalho final.pdf"); 
  textFont (fonte);
}
void draw () {
  background(width-mouseX);
  // estrelas
  for ( int i=0; i<200; i=i+10)
    for ( int j=0; j<120; j= j+10) {
      fill(#F7F00A);
      point(i+random(-2.5, 2.5), j);
    }
  // edificação
  //Prédio 1
  fill(145, 65, 62);
  rect(150, 25, 75, 200);
  fill(255, 255, 0);
  rect(180, 35, 30, 200);//Janela
  fill(255);
  //Prédio 2
  rect(100, 125, 100, 125);
  fill(#99D5F5);
  rect(100, 140, 90, 20);
  rect(100, 170, 90, 20);
  rect(100, 200, 90, 20);
  rect(100, 200, 90, 20);
  //Prédio 3
  fill(200, 150, 36);
  rect(50, 50, 50, 200);
  //fill(#99D5F5);
  fill(100+mouseX*155/width, 100, 100);
  rect(60, 60, 30, 50);// Janela
  rect(60, 120, 30, 50);//Janela
  rect(60, 180, 30, 50);//Janela

  // pessoa andando
  fill(#CBC9C9);
  ellipse(yc/8, 190, 4, 23);
  stroke(155);
  fill(0);
  ellipse(yc/8, 185, 8, 8);
  if (yc<2000)
    yc++;
  else
    yc=0;
  textAlign(RIGHT);
  fill (255); 
  text(" Wictor Hugo 2s 2012", width-10, 20);
//if (yc==540)
//endRecord();
}

