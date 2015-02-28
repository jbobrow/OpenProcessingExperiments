
//Arquitetura e Urbanismo - UTFPR
//Geórgia Collete Rodrigues dos Santos Cadamuro
//Computação 1
//1 período

//constantes do céu
int Y_AXIS = 1;
int X_AXIS = 2;
color c1, c2;
//constantes
int a = 300;
int x = 100;
int y = 100;
int w = 280;
int z = 430;
int u;


void setup () {
  size (900, 500);
  c1 = color (107, 156, 211);
  c2 = color (237, 243, 250);
  frameRate(30);

}
color fillVal = color (252, 44, 8);
color Trem = color (97, 107, 118);

void draw () {
    //Céu
  setGradient(0, 0, width, height, c1, c2, Y_AXIS);
  //nuvens
   u++; // NUVENS
   noStroke();
  fill (255, 100);
  ellipse (u-500, 20,  110, 10);
  ellipse (u+175, 100, 89,  10);
  ellipse (u+150, 80, 150, 12);
  ellipse (u-100, 70,  130, 10);
  ellipse (u-175, 170, 100, 14);
  ellipse (u-120, 160, 90,  10);
  ellipse (u-400, 150, 70,  10);
 
   
  //predios fundo
  // claro no fundo
    fill(194, 250, 205, 80);
    rect (600, 50, 200, 400);
        //1 azul no fundo
     noStroke ();
    fill(102, 105, 137, 90);
    rect (0, 50, 180, 400);
    // comprido escuro no fundo
    noStroke ();
    fill(250, 203, 194, 90);
    rect (400, 30, 180, 400);
        //azul 2 fundo
    noStroke ();
    fill(102, 105, 137, 100);
    rect (300, 80, 140, 450);
    //1 baixo salmã0 no fundo
    noStroke ();
    fill(247, 218, 180, 100);
    rect (150, 130, 340, 400);
      //1 alto
  noStroke();
  fill (59, 73, 90, 80);
  rect (350+100, 0, 210, 400);
   // frente marrom escuro
    fill(147, 133, 116, 100);
    rect (500, 180, 250, 400);
    //fundo marrom comprido
    noStroke (); 
    fill(162, 71, 10, 50);
    rect (200, 60, 100, 400);
        //4 frente marrom fechado
    noStroke ();
    fill(147, 143, 129, 100);
    rect (280, 200, 250, 500);
      //5 bege claro
    noStroke ();
    fill(229, 227, 204, 100);
    rect (40, 80, 150, 400);
    //frente amarelo esverdeado
    noStroke ();
    fill(229, 222, 144, 100);
    rect (0, 100, 100, 400);
          noStroke ();//frente 2 azul no canto
    fill(103, 102, 142, 100);
    rect (700, 100, 290, 400);
  
  //rua
  noStroke ();
  fill(121);
  quad ( 0, height, 0, 400, width, 400, width, height);
  fill(193);
  quad ( 0, height, 300, z, 600, z, width, height);
  rect (0, 410, width, 50);

    //onibus
  noStroke();
  fill(fillVal);
  rect( 600-mouseX, 350, 300, 80);
  for (int i = 650-mouseX; i < 900-mouseX; i = i+65) {
    fill (188, 183, 245);
    rect ( i, 360, 50, 30);
    noStroke();
    rect (600 - mouseX, 360, 30, 40);
    fill(0);
    strokeWeight (2);
    stroke (0);
    line (600-mouseX, 410, 900-mouseX, 410);
    ellipse (650-mouseX, 420, 40, 40); 
    ellipse (850-mouseX, 420, 40, 40);
    noStroke();
  }

  //locomotiva
  fill(97,107,118);
  rect (mouseX - 100, 150, 150, 50);//vagão
  fill(Trem);
  rect (mouseX + 100, 150, 220, 47);
  rect (mouseX + 100, 100, 100, 100);
  fill(97,107,118);
  strokeWeight(2);
  stroke (229, 65, 65);
  fill (188, 183, 245);
  rect (mouseX + 110, 110, 75, 50);
  noFill();
  rect (mouseX + 150, 110, 30, 50);
  fill(255, 243, 111);//letras
    strokeWeight (1);
  stroke (255, 243, 111);
  noFill();
  rect ( mouseX - 90, 155, 130, 50);
  textSize(15);
  text ("R.F.F.S.A.", mouseX - 60, 175); 
  textSize (10);
  text ("Parana st Catarina", mouseX - 70, 190);

  //ponte
  noStroke();
  strokeWeight (5);
   stroke(14, 16, 26);//sustentação esquerda
    fill(14, 16, 26);
    triangle ( 60, w, 110, 380, 160, w);
     fill(c1+c2, 0);
    stroke(14, 16, 26);
    arc(10, 400, 200, y+75, TWO_PI - HALF_PI, TWO_PI);
    arc(210, 400, 200, y+75, PI, PI + HALF_PI);
    stroke(14, 16, 26);//sustentação direita
    fill(14, 16, 26);
    triangle( 750, w, 800, 380, 850, w);
    fill(c1+c2, 0);
    stroke(14, 16, 26);
    arc(700, 400, 200, y+75, TWO_PI - HALF_PI, TWO_PI);
    arc(900, 400, 200, y+75, PI, PI + HALF_PI);
    stroke(222, 218, 175);
    fill(222, 218, 175);//pilares
    rect ( 80, 380, 60, 80);
    rect ( 770, 380, 60, 80);
    triangle ( 0, 390, 140, 465, 0, 465);
    triangle ( 900, 390, 770, 465, 900, 465);
  noStroke();//corpo da ponte
  fill(14, 16, 26);
  rect ( 0, 200, width, x);  
  for (int i = 0; i <900; i = i + 70) {
    stroke (151, 154, 170);
    strokeWeight (5);
    line (i, x+199, i, 200);
  }
  line (0, x+198, width, x+198);
  stroke(27, 27, 28);
  line ( 0, 200, width, 200);
  noStroke();
  fill(12, 12, 13);
  rect (0, x+200, width, 15);


}
void keyPressed () {
  if (keyPressed) {
    if (key == 'g' || key == 'G') {//verde
      fillVal = #13FC08;
    } 
    if (key == 'y' || key == 'Y') {//amarelo
      fillVal = #FCAB08;
    } 
    if (key == 'r' || key == 'R') {//vermelho
      fillVal = #FC2C08 ;
    } 
    if (key == 'b' || key == 'B') {//azul
      fillVal = #082AFC;
    }
    if ( key== CODED) {
      if ( keyCode == CONTROL) {//original
       fillVal = #FC2C08;
     }
    } 
    
    if ( key== CODED) {
      if ( keyCode == DOWN) {//desce
        x = 100;
        y = 100;
        w = 280;
      } 
      else if (keyCode == UP) {//sobe
        x = 70;
        y = 160;
        w = 250;
      }
      if (keyCode == RIGHT) {//rua sobe
      z=430;
    }
      if (keyCode == LEFT) { //rua desce
      z=450;}
      if ( key== CODED) {
      if ( keyCode == CONTROL) { //original
       x = 100;
      y = 100;
      w = 280;
      z=430;
      }
    } 
    }
  } 
    if (keyPressed) {
      if (key == 'd' || key == 'D') {//verde
        Trem = #317622;
      }
      if (key == 'v' || key == 'V') {//vermelho
                Trem = #FA1937;
        } 
        if (key == 'a' || key == 'A') {//amarelo
          Trem = #4D19FA;
        }
        if ( key== CODED) {
      if ( keyCode == CONTROL) {//original
      Trem = #616B76;}
    } 
}
}
//continuação céu
void setGradient(int x, int y, float w, float h, color c1, color c2, int axis) {
  noFill();
  if (axis == Y_AXIS) {
    for (int i=y; i<=y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
}
}
}
//foto de inspiração http://www.google.com.br/imgres?imgurl=http://blogdomaizeh.files.wordpress.com/2012/01/ponte-preta-com-locomotiva-antiga-sobre-a-rua-joc3a3o-negrc3a3o.jpg&imgrefurl=http://blogdomaizeh.wordpress.com/2012/01/24/ponte-preta/&h=955&w=1476&sz=175&tbnid=3ThhYOIHbhQxSM:&tbnh=90&tbnw=139&zoom=1&usg=__dmA7g9D0Q3VY74cO0uRz3Qppqd4=&docid=_RRG6gzFMxiFIM&sa=X&ei=C-tAUu_vFtjb4AP10YCwCg&ved=0CDcQ9QEwAQ
