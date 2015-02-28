
float a;
int k;
int luz = #CBBA2F;
float x;
float y;
int b;
int l=0;
float w;
int z = 0;
float h;
void setup() {
  size(500, 650);
  frameRate(4);
}


void draw () {
  background(#03021F);

  for (int a = 0; a <= 500; a = a+100) {//céu com estrelas
    for (int b = 0; b <+ 500; b = b+50) {
      strokeWeight(2);
      stroke (random(0, 255));
      point(random(a), random(b));
    }
  }
  fill(100);
  noStroke();
  beginShape();//rua
  { 
    vertex(0, 500);
    vertex(0, 650);
    vertex(500, 650);
    vertex(500, 500);
  }
  endShape();
  fill(#5A424E);
  rect(80, 40, 160, 520);//torre marrom


  fill(luz);//mouseclicked para acender as luzes
  for (int j = 120; j<400; j = j+30) {
    rect(100, j, 100, 20);//janelas da torre
  }


  fill(#C7C7C9);

  for (int a=130; a<370; a = a+110) {
    rect(a, 420, 20, 150);//pilares da base
  }
  rect(0, 560, 500, 100); //calçada

  fill(10);
  beginShape();
  {//tronco de pirâmide do prédio

    vertex(400, 450);
    vertex(100, 450);
    vertex(200, 100);
    vertex(300, 100);
  }
  endShape();

  fill(#C7C7C9);
  beginShape();
  {//trapézio da base
    vertex(400, 450);
    vertex(100, 450);
    vertex(130, 480);
    vertex(370, 480);
  }
  endShape();

  for (int c=0; c<100; c = c+1) {//controladores das linhas coloridas

    a=a-30;
    if (a<100) 
    {
      a=450;
    }
    if (a<100) {
      noLoop();
    }  



    strokeWeight(2);

    stroke(random(z), random(z), random(z));

    line(200-c, c*3.5+100, 300+c, c*3.5+100);//linhas coloridas

    for (float g=1; g<1.5; g=g+0.02) {

      stroke(random(y), random(y), random(y));//pontos coloridos
      // point (300+c, c*3.5+100);
      point (302/g+c, c*3.5+100);

      // point (200-c, c*3.5+100);
      point (g*200-c, c*3.5+100);
    }
  }

  for (float j = 0; j<100; j=j+15) {//controladores das formas coloridas
    for (float m = 170; m<=350; m=m+50) {
      stroke(w, random(w), random(w));
      strokeWeight(h);
      noFill();
      ellipseMode(CENTER);//elipses coloridas
      ellipse(m, 400, j, j);
      ellipse(0.8*m+55, 300, j-15, j-15);
      ellipse(0.6*m+105, 200, j-25, j-25);
    }
  }
  fill(0);
  PFont font; //texto
  font = loadFont("Fiesp.vlw");
  textFont(font, 28);
  text("Utilize as setas do teclado...", 100, 620);
}



void mouseClicked() {//controle das luzes por clique
  if (luz== 0) {
    luz=#CBBA2F;
  } 
  else {
    luz=0;
  }
}
void keyPressed() {//controle e alternência dos efeitos na fachada com as setas do teclado
  if (keyCode == LEFT) {
    z = 255;
    h = 0;
    w=0;
    y=180;
  } 
  else if (keyCode == RIGHT) {
    z = 0;
    w=255;
    h=2;
  } 
  else if (keyCode == UP) {
    y = 255;
    h=0;
    w=0;
    z=0;
  } 
  else if (keyCode == DOWN) {
    y = 0;
    h=0;
    w=0;
    z=0;
  }
}
