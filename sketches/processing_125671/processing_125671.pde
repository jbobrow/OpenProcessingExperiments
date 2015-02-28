
//Nome:João Guilherme
//O ponto alto do ano foi a sair de baixo da asa dos meus pais e começar minha propria vida morando sozinho (Mesmo ainda sustentado por eles =P)
//Esse desenho foi uma tentativa de representação do prédio onde estou morando.


void setup() {
  size (600, 650);
  for (int x=100 ; x<=400 ; x+=100){
    for (int y=0 ; y<=300 ; y+=100){
       fill (113);
      fachada (x,y);
    }
  }

fill (153);
rectMode (CORNERS);
  rect (250,250,350,300);
rectMode (CORNERS);
  rect (200,400,400,600);
rectMode (CORNERS);
  rect (440,460,460,480);
desenharInterfone (440,460,450,470);
  strokeWeight(4);
  line (280,470,280,520);
  line (320,470,320,520);
  
   strokeWeight(1);
line(100,600,50,650);
line(500,600,550,650);

  fill(255, 0, 0); 
arc (300, 300, 600, 50, 0, PI);
line (0,300,600,300);
   
}

void fachada (int x, int y){
  rect (x,y,100,300);
}

void desenharInterfone (int linha, int coluna, int centro_x, int centro_y){
    ellipseMode(CENTER);
    ellipse(centro_x,centro_y,20,20);  
  
  line (linha, coluna+4, linha+20, coluna+4);
  line (linha, coluna+8, linha+20, coluna+8);
  line (linha, coluna+12, linha+20, coluna+12);
  line (linha, coluna+16, linha+20, coluna+16);
  
  line (linha+4, coluna, linha+4, coluna+20);
  line (linha+8, coluna, linha+8, coluna+20);
  line (linha+12, coluna, linha+12, coluna+20);
  line (linha+16, coluna, linha+16, coluna+20);
  
}


