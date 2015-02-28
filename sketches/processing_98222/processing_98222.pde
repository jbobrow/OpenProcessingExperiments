
//Victoria Yumi Shimakawa

PFont fonte;
void setup () {
  size (200, 200);
  background (0);

  {
    stroke (64, 160, 63);
    fill(51, 232, 49, 190);
    for (int e= 140; e<=205; e=e+20) {   //arvores
      ellipse (e, 140, 25, 25);

      {
        fill(51, 196, 49, 190);
        for (int f= 150; f<=205; f=f+15) {   //arvores
          ellipse (f, 150, 20, 20);
        }
      }
    }
  }
  stroke (0);

  fill(245, 15, 69);
  beginShape ();//profundidade primeira parede
  vertex (90, 60);
  vertex (72, 75);
  vertex (90, 80);
  endShape (CLOSE);

  fill(250, 230, 234);
  beginShape();//quinta parede
  vertex (42, 72);
  vertex (25, 90);
  vertex (25, 160);
  vertex (42, 160);
  endShape (CLOSE);

  beginShape ();//quarta parede
  vertex (47, 75);
  vertex (42, 72);
  vertex (42, 160);
  vertex (47, 160);
  endShape (CLOSE);

  beginShape ();//terceira parede
  vertex (50, 70);
  vertex (50, 160);
  vertex (47, 160);
  vertex (47, 75);
  endShape (CLOSE);

  fill(250, 230, 234);
  beginShape ();//segunda parede
  vertex (50, 70);
  vertex (90, 80);
  vertex (90, 160);
  vertex (50, 160);
  endShape (CLOSE);

  fill(245, 15, 69);
  beginShape();//primeira parede
  vertex (90, 60);
  vertex (120, 65);
  vertex (120, 160);
  vertex (90, 160);
  endShape (CLOSE); 

  fill(247, 235, 238);
  beginShape();//muro
  vertex (0, 157);
  vertex (200, 160);
  vertex (200, 186);
  vertex (0, 200);
  endShape(CLOSE);


  fill(216, 215, 210);
  beginShape ();//portao
  vertex (45, 154);
  vertex (45, 196);
  vertex (88, 193);
  vertex (88, 155);
  endShape (CLOSE);

  fill(95, 94, 89);
  beginShape ();// portao 2 menor
  vertex (52, 169);
  vertex (52, 196);
  vertex (80, 193);
  vertex (80, 170);
  endShape (CLOSE);

  frameRate (10);
}


void draw() {
  stroke (255);//estrelas
  point (random (0, 200), random (0, 70));


  stroke (0);
  line (133, 200, 200, 193);

  //linhas primeira parede
  int x=90;
  int y=120;


  line (x, x-20, y, y-45); 
  line (x, x+2, y, y-25);
  line (x, x+23, y, y-5);
  line (x, x+44, y, y+15);
  line (x, x+64, y, y+35);



  //janelas pequenas
  fill(255);
  int a=104;
  {
    for (int b=70; b<160; b=b+20)
      rect(a, b, 6, 4);
  }

  //linhas parede dois
  int c= 100;

  for (int d=50; d<90; d+=5) {
    line(d, c-17, d, 154);
    c+=1;
  }

  line (50, 83, 90, 91);//linha horizontal parede dois

  fill(227, 232, 227);
  noStroke();
  ellipse (6, 6, 60, 60);
  fill(240, 247, 240);
  ellipse (6, 6, 40, 40);//lua



  {

    int r= mouseX;// mudar cor da lua
    int s= mouseY;
    {
      if ( r>0 && r<=60 && s>0 && s<=60)
        fill(142, 165, 159);
    }
    ellipse(6, 6, 60, 60);
  }
  
  
  
  fonte = createFont("Victória", 15); //assinatura
  textAlign(RIGHT);
  fill (0); 
  text(" Victória Yumi 2013", width-25, height-10);
  
  
}
