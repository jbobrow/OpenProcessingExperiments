
/*******************************************
I am interested in making things that have a hand made feeling, things that don't look digital. 
I wish I had more time
it might feel a little heavy, sorry

commands 
click and drag to draw
a = clears the draw
s = saves
up = draws longer lines
down = draws shorter lines
left = undo last 100 points
**********************************************/


int qualponto;
int quantos;
int linhaMax, voltaMax;
int lx, ly;

Ponto P[];

void setup() {
  size(1000, 350);
  quantos=100000;
  P= new Ponto[quantos];
  linhaMax=60;
  background(255);
}

void draw() {
  strokeWeight(.02);
  if (mousePressed) {
      if (dist(mouseX, mouseY,pmouseX,pmouseY)>linhaMax/60){
        lx=mouseX;
        ly=mouseY;
      P[qualponto]=new Ponto(qualponto);
      P[qualponto].desenhaLigacoes();// desenha as linhas do ponto que acabou de ser criado
      qualponto=(qualponto+1)%quantos;
    }
  }
}


void keyPressed() {
  if (key=='a') {
    background(255); 
    voltaMax=qualponto=0;
  }
  else if (keyCode==UP)  linhaMax+=5;
  else if (keyCode==DOWN && linhaMax>10 && linhaMax>(voltaMax+5))  linhaMax-=5;
  else if (key=='s') {
    save("desenho_" + hour() + minute() + second() + ".png");
  }
  else if (keyCode==LEFT) {
    qualponto=max((qualponto-100), voltaMax);
    background(255);
    for (int i=0; i<qualponto; i++) {
      P[i].desenhaLigacoes();
    }
  }
  else if (keyCode==ENTER) voltaMax=qualponto;
}


class Ponto {

  int id;
  int px, py;
  int[] ligacoes;
  int QLigacoes;

  Ponto(int qualponto) {
    id=qualponto;
    px=mouseX;
    py=mouseY;
    ligacoes=new int[id];

    for (int i=0; i<id; i++) {
      float tdist = dist(P[i].px, P[i].py, px, py);
        if (tdist<linhaMax && tdist>5) {
        ligacoes[QLigacoes]=i;
        QLigacoes++;
      }
    }
  }
  void desenhaLigacoes() {
    for (int i=0; i<QLigacoes; i++) {
      line(px, py, P[ligacoes[i]].px, P[ligacoes[i]].py);
    }
  }
}

