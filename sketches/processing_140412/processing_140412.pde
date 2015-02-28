
// Sol, chuva,neve, por: Marcus Scapin - 25/02/2014
// O trabalho Sol, chuva,neve de Marcus Scapin está licenciado com uma Licença Creative Commons - Atribuição-NãoComercial-CompartilhaIgual 4.0 Internacional.
 
//Interaja utilizando as teclas 'A', 'B' e 'C'
 
int pingos=600;
float [] chuvax;
float [] chuvay;
  
void setup() {
  size(500, 450);
    chuvax = new float[pingos];
  chuvay = new float[pingos];
  for (int i=0; i<pingos; i++)
  {
    chuvax[i] = floor(random(-350, 500));
    chuvay[i] = floor(random(height));
  }
}
 
 char letter='a';
  
void keyPressed(){
  letter=key;
}
  
void draw() {
switch(letter){
    case 'A':
    case 'a':
        background(0,191,255);
    fill(255,255,0);
    noStroke();
    ellipse(106, 106, 55, 55);
    fill(34,139,34);
    stroke(5);
rect(0,300,500, 150);
fill(185,122,87);
rect(120,250, 200,130);
quad(320,380,320,230,380,200,380,330);
fill(128,64,0);
quad(115,250,325,250,350,180,150,180);
triangle(325,250,350,180,385,200);
rect(160,300,70,80);
fill(176,255,255);
rect(260,310,40,40);
break;
case 'B':
    case 'b':
stroke(150);
 frameRate(4);
  background(0,0,128);
  for (int i=0; i<pingos; i++)
    line(chuvax[i], chuvay[i],chuvax[i]+3, chuvay[i]+10 );
    for (int i=0; i<pingos; i++)
  {
    chuvax[i] = floor(random(width));
    chuvay[i] = floor(random(height));
  }
stroke(5);
fill(80,200,80);
rect(0,300,500, 150);
fill(185,122,87);
rect(120,250, 200,130);
quad(320,380,320,230,380,200,380,330);
fill(128,64,0);
quad(115,250,325,250,350,180,150,180);
triangle(325,250,350,180,385,200);
rect(160,300,70,80);
fill(176,255,255);
rect(260,310,40,40);
break;
case 'c':
    case 'C':
background(100, 100, 255);
    strokeWeight(3);
    frameRate (50);
  stroke(200);
  for (int i=0; i<pingos; i++)
  {
    point(chuvax[i], chuvay[i]);
    chuvay[i]=chuvay[i]+ 0.2;
    chuvax[i]=chuvax[i]+0.2;
    if (chuvay[i]>height)
    {
      chuvax[i] = floor(random(-400, 500));
      chuvay[i] = 0;//floor(random(height));
    }
  }
   strokeWeight(1);
   stroke(5);
fill(143,188,143);
rect(0,300,500, 150);
fill(185,122,87);
rect(120,250, 200,130);
quad(320,380,320,230,380,200,380,330);
fill(128,64,0);
quad(115,250,325,250,350,180,150,180);
triangle(325,250,350,180,385,200);
rect(160,300,70,80);
fill(176,255,255);
rect(260,310,40,40);
break;
}
}

