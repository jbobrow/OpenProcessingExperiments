
import processing.pdf.*;

boolean record;

void setup() {
  size (200, 200);
  background (65, 201, 70);
}
int xgrama=0;
int ygrama=0;
int fonte=0;
int passaro=0;
float vento=0;
float vento1=0;
float vento2=0;


void draw() {

  if (record) {
    beginRecord(PDF, "frame-####.pdf");
  }

  noSmooth();


  background (65, 201, 70);



  //Grama
  stroke (39, 129, 4);
  for (xgrama=0; xgrama<1000; xgrama=xgrama+3) {
    for (ygrama=0; ygrama<1000; ygrama=ygrama+3) {
      line (xgrama, ygrama, xgrama+1, ygrama+2);
    }
  }


  rectMode(CENTER ); //Pátio Lateral 1
  noStroke ();

  fill (110, 111, 91);
  rect (50, 50, 90, 90);

  stroke (0);
  fill (150, 157, 135);
  rect (50, 50, 80, 80);


  rectMode(CENTER ); // Pátio Lateral 2
  noStroke ();

  fill (110, 111, 91);
  rect (150, 150, 90, 90);

  stroke (0);
  fill (150, 157, 135);
  rect (150, 150, 80, 80);


  rectMode(CENTER ); //Pátio Central
  stroke (0);

  fill (150, 157, 135);
  rect (90, 90, 90, 90);

  //Árvores
  float vento = random (-1, 1);
  float vento1 = random (-1, 1);
  float vento2 = random (-1, 1);
  stroke (0);
  smooth();

  fill (70, 139, 56);
  ellipse(20+vento1, 178+vento, 36, 36);

  fill (70, 139, 56);
  ellipse(20+vento, 158+vento1, 36, 36);

  fill (70, 139, 56);
  ellipse(20+vento, 138+vento2, 36, 36);

  fill (70, 139, 56);
  ellipse(20+vento, 118+vento1, 36, 36);

  fill (70, 139, 56);
  ellipse(40+vento2, 178+vento, 36, 36);

  fill (70, 139, 56);
  ellipse(60+vento, 178+vento2, 36, 36);

  fill (70, 139, 56);
  ellipse(80+vento1, 178+vento2, 36, 36);

  fill (55, 95, 47);

  ellipse(45+vento, 158+vento1, 26, 26);

  fill (55, 95, 47);
  
  ellipse(65+vento, 148+vento1, 26, 26);

  fill (55, 95, 47);

  ellipse(45+vento2, 138+vento1, 26, 26);




  fill (70, 139, 56);
  ellipse(180+vento, 78+vento, 36, 36);

  fill (70, 139, 56);
  ellipse(180+vento1, 58+vento2, 36, 36);

  fill (70, 139, 56);
  ellipse(180+vento, 38+vento2, 36, 36);

  fill (70, 139, 56);
  ellipse(180+vento, 18+vento1, 36, 36);

  fill (70, 139, 56);
  ellipse(170+vento1, 18+vento1, 36, 36);

  fill (70, 139, 56);
  ellipse(150+vento2, 18+vento1, 36, 36);

  fill (70, 139, 56);
  ellipse(130+vento1, 18+vento, 36, 36);

  fill (55, 95, 47);

  ellipse(155+vento, 58, 26, 26);

  fill (55, 95, 47);

  ellipse(150, 48+vento, 26, 26);

  fill (55, 95, 47);

  ellipse(155+vento2, 38, 26, 26);


  //Fonte
  fill (255);
  ellipse(90, 90, 86, 86);

  fill (90, 198, 216);
  ellipse(90, 90, 80, 80);

  fill (255);
  ellipse(90, 90, 26, 26);

  fill (255);
  ellipse(90, 90, 16, 16);

  fill (90, 198, 216);

  if (mouseX>47&&mouseX;<133&&mouseY;>47&&mouseY;<133) {
    fonte=fonte+1;
    stroke (0);
    ellipse (90, 90, fonte, fonte);
    if (fonte>30) {
      fonte=30;
    }
  } 
  else {
    fonte=fonte-1;
    ellipse (90, 90, fonte, fonte);
  }
  if (fonte<0) {
    fonte=0;
  }



  //Nome

  PFont font;
  font = loadFont("Bauhaus93-15.vlw");
  textFont(font, 13);
  text("Maíra - 2012", 112, 185);

  //Passaros
  noFill();
  arc(50, passaro, 20, 20, 0, HALF_PI);
  arc(70, passaro, 20, 20, HALF_PI, PI);

  arc(20, 10+passaro, 20, 20, 0, HALF_PI);
  arc(40, 10+passaro, 20, 20, HALF_PI, PI);

  arc(160, passaro+40, 20, 20, 0, HALF_PI);
  arc(180, passaro+40, 20, 20, HALF_PI, PI);

  arc(100, passaro+70, 20, 20, 0, HALF_PI);
  arc(120, passaro+70, 20, 20, HALF_PI, PI);

  passaro = passaro+1;

  if (record) {
    endRecord();
    record = false;
  }
}
void mousePressed() {
  record = true;
}
