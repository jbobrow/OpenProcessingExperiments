
//Maisa Barbosa
//Farol de MaÃ­sa Barbosa estÃ¡ licenciado com uma LicenÃ§a Creative Commons - AtribuiÃ§Ã£o 4.0 Internacional.

void setup () {
  size (500, 600);
 //CEU
  noStroke();
  fill(0);
  for (int i = 0; i<width; i+=3)
  {
    for (int j = 0; j<height; j+=3)
    {
      fill(0 +j/20, 0 +i/10, 55);
      rect(i, j, 20, 20);
    }
  }

}
  int value = 0;
  
void draw () {
   shootingStar ();
   
   pushStyle();
  // variaveis do loop das estrelas
  int x = 0;
  float randomX;
  float randomY;
  

  // cor e preenchimento

  stroke(value);
  strokeWeight(2);

  // criaÃ�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â§Ã�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â£o do loop de estrelas
  for (int i=0;i<0.01;i++) {
    randomX = random(0, 500);
    randomY = random(0, 600);
    point(randomX, randomY);
  }
  popStyle();
  
  pushStyle();
//montanhas
fill (0);
  stroke(2);
  strokeWeight(1);
   

    beginShape (); // montanha 1
    curveVertex (166, 600);
    curveVertex (166, 600);

    curveVertex (250, 500);
    curveVertex (400, 450);

    curveVertex (556, 600);
    curveVertex (556, 600);

    endShape ();

    beginShape (); // mountain 2
    curveVertex (0, 600);
    curveVertex (0, 600);

    curveVertex (83, 480);
    curveVertex (183, 405);
    curveVertex (283, 525);

    curveVertex (250, 600);
    curveVertex (250, 600);
    endShape ();

    smooth ();
   popStyle();
   luz();
    
    
  }
  void mouseMoved() {
    value = value +1;
    if (value > 255) {
      value = 100;
    }
}
//FAROL
float a;
float c;

void luz() {
  a = 320 + 200*sin (c);
  c = c + 0.01;
  strokeWeight (6);
  stroke (55);
  fill (55);
  smooth (8);
  ellipse (360, 450, 10, 10);
  line (350, 480, 370, 480);
  rect (355, 450, 10, 30, 7);
  noStroke();
  fill (255, 251, 116, 150);
  smooth (8);
  triangle (360, 450, a+40, 600, a-40, 600);
}
//ESTRELA
int d = 0;
int b = 0;
 
void shootingStar () {
  d++;
b= d-15;
 
  stroke (242, 231, 0, value/3);
  strokeWeight (3);
  point (d,d);
}

//<a rel="license" href="http://creativecommons.org/licenses/by/4.0/deed.pt_BR"><img alt="LicenÃ§a Creative Commons" style="border-width:0" src="http://i.creativecommons.org/l/by/4.0/88x31.png" /></a><br /><span xmlns:dct="http://purl.org/dc/terms/" property="dct:title">Farol</span> de <a xmlns:cc="http://creativecommons.org/ns#" href="http://www.openprocessing.org/sketch/134627" property="cc:attributionName" rel="cc:attributionURL">MaÃ­sa Barbosa</a> estÃ¡ licenciado com uma LicenÃ§a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/deed.pt_BR">Creative Commons - AtribuiÃ§Ã£o 4.0 Internacional</a>.
