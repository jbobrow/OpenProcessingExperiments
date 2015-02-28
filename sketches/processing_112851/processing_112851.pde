
int S;
int R=0;
int G=0;
int B=6;

 void setup()
 {
  size(600, 500);
 // frameRate(60);
}

void draw() {
   }
  background(R, G, B); rect (10,10,10,10); // céu
 // frameRate (80);
  if (G<90)G++;
  if (B<190)B+=2;
//  frameRate (80);
  S++;

  noStroke();
  fill (#F7F7F5, 100);
  ellipse (260, 90, 170, 70);
  ellipse (380, 70, 220, 80); // nuvens

  fill(#F6FA28, 240);
  ellipse (S, 80, 60, 60); //sol


  stroke(0);
  fill(#FFFFFF);
  rect(100, 80+mouseY/7, 420, 70);


  fill(mouseX/10+60, mouseY/5+30, mouseX+80); // cor janelas paramétricas

  rect( 110, 105+mouseY/7, 90, 30); // definindo janelas paramétricas
  rect(205, 105+mouseY/7, 310, 30);
  fill (#000000); //linhas janelas paramétricas
  line (140, 105+mouseY/7, 140, 135+mouseY/7);
  line (170, 105+mouseY/7, 170, 135+mouseY/7);
  line (230, 105+mouseY/7, 230, 135+mouseY/7);
  line (260, 105+mouseY/7, 260, 135+mouseY/7);
  line (290, 105+mouseY/7, 290, 135+mouseY/7);
  line (320, 105+mouseY/7, 320, 135+mouseY/7);
  line (350, 105+mouseY/7, 350, 135+mouseY/7);
  line (380, 105+mouseY/7, 380, 135+mouseY/7);
  line (410, 105+mouseY/7, 410, 135+mouseY/7);
  line (440, 105+mouseY/7, 440, 135+mouseY/7);
  line (470, 105+mouseY/7, 470, 135+mouseY/7);
  line (500, 105+mouseY/7, 500, 135+mouseY/7);

 
  fill(255);
  rect(100, 150, 420, 70); //reta maior
  rect(200, 220, 220, 60); //base
  fill(#1D616A);
  rect(170, 220, 30, 60); //laterais
  rect(420, 220, 30, 60);
  fill(#C7CBCB);
  rect(205, 220, 210, 40); ///retan interior
  fill (#000000);
  for (int y=220; y<260; y=y+5) {
    line (210, y, 410, y);
  }

  fill(#C7CBCB);
  rect(175, 230, 25, 30); //retan menor -janelas
  rect(420, 230, 25, 30);


//  fill (#000000);
 // for (int y=230; y<260; y=y+4) {
 //   line (175, y, 200, y);
 // }
//  for (int y=230; y<260; y=y+4) {
 //   line (445, y, 420, y);
 // }

  fill(mouseX/10+60, mouseY/5+30, mouseX+80);
  rect( 110, 175, 90, 30);
  rect(205, 175, 310, 30);
  fill (#000000); //linhas janelas originais
  line (140, 175, 140, 205);
  line (170, 175, 170, 205);
  line (230, 175, 230, 205);
  line (260, 175, 260, 205);
  line (290, 175, 290, 205);
  line (320, 175, 320, 205);
  line (350, 175, 350, 205);
  line (380, 175, 380, 205);
  line (410, 175, 410, 205);
  line (440, 175, 440, 205);
  line (470, 175, 470, 205);
  line (500, 175, 500, 205);



  fill(#D9DBDB);
  triangle (100, 220, 170, 220, 170, 230); //linha de fundo
  triangle (520, 220, 450, 220, 450, 230);

  fill (#FCF7F7);
  rect(110, 220, 7, 65); // colunas
  rect (130, 224, 6, 58);
  rect (150, 228, 5, 52);
  rect (505, 220, 7, 65);
  rect (480, 224, 6, 58);
  rect (460, 228, 5, 52);

  fill (49, 147, 56); //grama
  rect (0, 280, 600, 250);
  }
