

//Gabriel Papa Fernandes, 11 de MarÃ§o de 2014
//UTFPR - Universidade Tecnologica Federal do ParanÃ¡
//<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="LicenÃ§a Creative Commons" style="border-width:0" src="http://i.creativecommons.org/l/by/4.0/88x31.png" /></a><br /><span xmlns:dct="http://purl.org/dc/terms/" property="dct:title">Casa JapÃ´nesa</span> de <span xmlns:cc="http://creativecommons.org/ns#" property="cc:attributionName">Gabriel Papa</span> estÃ¡ licenciado com uma LicenÃ§a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons - AtribuiÃ§Ã£o 4.0 Internacional</a>.

//Lua
float u = 600;

//porta
char letter= 'a';

//Neve*/
int pingos=200;
float [] chuvax;
float [] chuvay;
void setup() {
  size(500, 500);
  frameRate(50);
  background(#011276);
  strokeWeight(3);
  stroke(150);
  chuvax = new float[pingos];
  chuvay = new float[pingos];
  for (int i=0; i<pingos; i++)
  {
    chuvax[i] = floor(random(-600, 500));
    chuvay[i] = floor(random(height));
  }
}

void keyPressed() 
{
  letter= key;
}

void cabana () 
{
  
  //Telhado
  fill(#B43535);
  triangle(50, 180, 250, 60, 450, 180);
  
  //Telhado e casa
  fill(#982020);
  triangle(75, 180, 250, 70, 425, 180);
  rect(100, 175, 300, 200);
  
  //Pilares
  fill(#B43535);
  rect(120, 140, 20, 240);
  rect(360, 140, 20, 240);
 
  //Porta
  fill(0);
  rect(220, 250, 80, 120);
  
  //Guarda corpo
  fill(#6F1515);
  rect(90, 300, 320, 2);
  rect(90, 340, 320, 2);
  rect(90, 370, 320, 2);
  rect(90, 300, 2, 80);
  rect(410, 300, 2, 80);
  rect(180, 300, 2, 80);
  rect(320, 300, 2, 80);
  rect(228, 300, 2, 80);
  rect(290, 300, 2, 80);
  
  //porta2
  fill(0);
  rect(230, 250, 60, 120);
}

void draw() {
  background(#011276);
  
  //Solo*/
  noStroke();
  fill(#BFBFBF);
  rect(-30, 300, 600, 200);
 
 //Casa Japonesa
  cabana ();
  
  //Keys
  switch (letter) {
  case 'l':
  case 'L':
    u = u - 1;
    if (u < -100) {
      u = 600;
 }
    fill(255);
    ellipse(u, 30, 50, 50);
  case 'b': 
  case 'B':
    fill(0);
    rect(230, 250, 60, 120);
    break;
  case 'w':
  case 'W':
    fill(255);
    rect(230, 250, 60, 120);
    break;
  case 'r':
  case 'R':
    fill(random(0, 255), random(0, 255), random(0, 255));
    rect(230, 250, 60, 120);
    break;
  }
  
  //Neve*/
  stroke(200);
  for (int i=0; i<pingos; i++)
  {
    point(chuvax[i], chuvay[i]);
    chuvay[i]=chuvay[i]+1;
    chuvax[i]=chuvax[i]+1;
    if (chuvay[i]>height)
    {
      chuvax[i] =floor(random(-600, 500));
      chuvay[i] = 0;//floor(random(height));
    }
  }
}



