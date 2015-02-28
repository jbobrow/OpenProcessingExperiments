
//Arquitetura e Urbanismo - UTFPR
//Maria Victória de Oliveira Penteado
//1505734
//Computação 1
//S53
//1 período
//2013 - 1o. Semestre
//Torre de Pisa

float a; // ângulo inicial de rotação
float m; // variável de tempo
color bg1; // azul de fundo mais escuro
color bg2; // azul de fundo mais claro
color r; // vermelho do fim
color b; // preto do fim
 
void setup() {
  size(710,700);
  float a = PI*3/4 - m/9999;
  smooth();
  bg1 = color(9,129,183);
  bg2 = color(91,192,237);
  r = color(255,0,0);
  b = color(0);
}
 
void draw() {
  rectMode(CORNER);
  float m = millis();
  float s = second();
  noStroke();
  
  //até o canto da torre encostar no chão
  if(m < 12250) { 
    
    //fundo com gradiente de azul
    {color bg1bg2;
   strokeWeight(1);
   for( int w = 0; w < height; w++ )
     {
      bg1bg2 = lerpColor( bg1, bg2 , map(w, 1, height-60, 0, 1));
      stroke(bg1bg2);
      line(0,w,width,w);
    }
    
    
    noStroke();
    pushMatrix();
    
    //cidade crescendo no fundo de acordo com o tempo
    for( int u = 0; u < 75; u++) {
      colorMode(HSB);
      fill(43,random(99),random(20,99), random(255));
      rect(random(width),640,random(50,100), -m/125 * random(0,5));
    }
    
    //translação e rotação da torre
    translate(50,640);
    rotate( a + m/10000 );
    
    //torre
    colorMode(RGB);
    fill(252,230,201);
    rect(33,-524,129,-66);
    rect(0,0,195,-525);
    
    //arcos do topo
    for( float k= 54.5; k < 162; k+=43) {
      rectMode(CENTER);
      fill(206,181,127);
      rect(k,-546,29,44);
      ellipse(k,-568,29,22);
    }
    
    //linhas entre os pisos
    for( int y = -119; y >= -525; y-= 58) {
      strokeWeight(3);
      stroke(237,218,177);
      line(0,y,195,y);
    }
    
    //arcos do corpo
    for( float x= 7.5; x < 195; x+= 15) {
      noStroke();
      fill(206,181,127);
      rect(x,-140,10,40);
      rect(x,-198,10,40);
      rect(x,-256,10,40);
      rect(x,-314,10,40);
      rect(x,-372,10,40);
      rect(x,-430,10,40);
      rect(x,-488,10,40);
      ellipse(x,-160,10,18);
      ellipse(x,-218,10,18);
      ellipse(x,-276,10,18);
      ellipse(x,-334,10,18);
      ellipse(x,-392,10,18);
      ellipse(x,-450,10,18);
      ellipse(x,-508,10,18);
    }
    
    //arcos da base
    for( float z= 16.25; z < 195; z+=32.5) {
      rect(z,-45,22,90);
      ellipse(z,-90,22,26);
    }
    
    //grama
    rectMode(CORNER);
    noStroke();
    popMatrix();
    fill(142,214,60);
    rect(0,640,710,700);
  }
  }
  
  //depois de a torre cair
  else {
    noLoop();
    for( int r = 0; r < 100; r++) {
      colorMode(HSB);
      fill(2,99 -m/1000, 99 -m/1000);
      rect(0,0,width,height);
      redraw();
      }
    color br;
    strokeWeight(1);
    for( int q = 0; q < height; q++ ) {
      br= lerpColor( b, r , map(q, 1, height-1, 0, 1));
      stroke(br);
      line(0,q,width,q);
    }
  }
}

//para salvar a torre
void mouseClicked() {
  noLoop();
}
