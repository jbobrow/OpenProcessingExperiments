
float a,b,c;
{
  a=200;
  b=350;
}

/*********************************************
 Oi Kabum! BH
 Computaçao Grafica
 2o Rodizio - Audio x Imagem
 Frequencias do som como parametro
 *********************************************/

/*********************************************/
void setup() {

  //-- use um dos dois comandos abaixo, dependendo do que quer fazer
 setupFrequencias("01.mp3"); // 1: para usar mp3
//setupMic();                 // 2: para usar microfone
  //-----------------------

  size(1000,700);
  background(100);
  smooth();
  
}

/*********************************************/
void draw() {

  //-- esse comando calcula as frequencias do som
  calculaFrequencias();  
  //------------------------
  
  fill(47,75,90*freq(10), 5*freq(15));
  rect(0,0, width, height);
  background(10*freq(5),10*freq(10),10*freq(15));
/*
  smooth();
  stroke(0);
  fill(100,100,100);
  //noFill();
  rect (450,200,a,b);
  rect (200,200,a,b);
  strokeWeight(10);
  fill(0,0,0);
  ellipse (300,300,150,150);
  ellipse (550,300,150,150);
  ellipse (550,450,70,70);
  ellipse (300,450,70,70);
  stroke (150);
  
  noFill();
  ellipse(550,450,8*freq(2),8*freq(2));
  ellipse(300,450,8*freq(2),8*freq(2));
  ellipse(300,300,8*freq(3),8*freq(3));
  ellipse(550,300,8*freq(3),8*freq(3));
  //fill(150,150,150);
  ellipse(300,300,3*freq(2),3*freq(2));
  ellipse(550,300,3*freq(2),3*freq(2));
 // fill(200,200,200);
  ellipse (300,300,5*freq(5),5*freq(5));
  ellipse (550,300,5*freq(5),5*freq(5));
  stroke(50,50,50);
  //fill(100,100,100);
  ellipse (550,450,3*freq(1),3*freq(1));
  ellipse (300,450,3*freq(1),3*freq(1));
*/
translate(-200,0);

  translate(-100,0);
  caixaDeSom();
  
  translate(200,0);
  caixaDeSom();

  translate(200,0);
  caixaDeSom(); 
  translate(200,0);
  caixaDeSom();
    translate(200,0);
  caixaDeSom();
    translate(200,0);
  caixaDeSom();



   
  
}

void caixaDeSom() {
  

  stroke(0);
  fill(100,100,100);
  //noFill();
  //rect (450,200,a,b);
  rect (200,200,a,b);
  strokeWeight(10);
  fill(0,0,0);
  ellipse (300,300,150,150);
  //ellipse (550,300,150,150);
  //ellipse (550,450,70,70);
  ellipse (300,450,70,70);
  stroke (150);
  
  noFill();
  //ellipse(550,450,8*freq(2),8*freq(2));
  ellipse(300,450,8*freq(2),8*freq(2));
  ellipse(300,300,8*freq(3),8*freq(3));
  //ellipse(550,300,8*freq(3),8*freq(3));
  //fill(150,150,150);
  ellipse(300,300,3*freq(4),3*freq(4));
  //ellipse(550,300,3*freq(2),3*freq(2));
 // fill(200,200,200);
  ellipse (300,300,5*freq(5),5*freq(5));
  //ellipse (550,300,5*freq(5),5*freq(5));
  stroke(50,50,50);
  //fill(100,100,100);
  //ellipse (550,450,3*freq(1),3*freq(1));
  ellipse (300,450,3*freq(6),3*freq(6));

}


