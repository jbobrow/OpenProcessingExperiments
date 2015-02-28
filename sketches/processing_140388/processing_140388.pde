
//declara
bola []colecao= new bola[20];

void setup() {
  size(600, 600);
  smooth();
  
  
  //inicia
  for (int a=0; a<20; a++){
colecao[a]= new bola(random(0,width),random(0,200));
  }
}
void draw() {
  background(255);
  
//chama a "bola"
for(int a=0;a<20; a++) {
colecao[a].faz();
}
}

class bola {
  //variáveis da classe
  float x =0;
  float y=0;
  float velX =2;
  float velY =1;

  //construção
  bola(float _x, float _y) {

    x=_x;
    y=_y;
  }
  //funcões
  void faz() {
    display();
    mexe();
    bole();
    gravidade();
  }


  void mexe() {
    x+=velX;
    y+=velY;
  }

  void bole() {
    if (x > width)
    {
      velX =velX *-1;
    }
    if (y > height)
    {
      velY =velY *-1;
    }
    if (x<0)
    {
      velX =velX *-1;
    }
    if (y <0)
    {
      velY =velY *-1;
    }
  }


void gravidade(){ velY+= 0.2;
  
  
  
  
}


  void display() {
    ellipse(x, y, 20, 20);
  }
}



