
/*********************************************
 Oi Kabum! BH
 Computaçao Grafica
 2o Rodizio - Audio x Imagem
 Frequencias do som como parametro
 *********************************************/

/*********************************************/
float dado;
void setup() {
  frameRate(15);
  //-- use um dos dois comandos abaixo, dependendo do que quer fazer
  setupFrequencias("canon_rock_by_gustavo_guerra.mp3"); // 1: para usar mp3
  // setupMic();                 // 2: para usar microfone
  //-----------------------

  size(800,800);
  background(0);
  smooth ();
}

/*********************************************/
void draw() {

  //-- esse comando calcula as frequencias do som
  calculaFrequencias();  
  //------------------------
  dado= random(6);
  // if (dado>5.5) {
  //stroke (20* freq (10),50*freq (15), 200); 
 // strokeWeight (15*freq(1));

  if (second()%20>10) {
    noFill();
    stroke(100*freq(10),100*freq(10)/4,25*freq(5),25*freq(5));
  }
  else {
     fill (100*freq(10),100*freq(10)/4,25*freq(5),25*freq(5));
  }
//  fill (100*freq(10),100*freq(10)/4,25*freq(5),25*freq(5));
  // ellipse ( random(0,width), random(0,height),30*freq(5),30*freq(5));

  ellipse (30*freq(7),50*freq(6)/4,10*freq(5),10*freq(5)); 
  ellipse (width - 60*freq(4),30*freq(5)/4,5*freq(5),5*freq(5));


  strokeWeight (20*freq(2));
  fill (50*freq(10),30*freq(2)/4,25*freq(5),25*freq(5));
  ellipse (70*freq(8),height -60*freq(7)/4,10*freq(5),10*freq(5)); 
  ellipse (width -60*freq(10), height- 200*freq(10)/4,8*freq(5),8*freq(5)); 
  
    stroke (20* freq (8), 50*freq (15), 200); 
  strokeWeight (2*freq(1));
  noFill ();
  ellipse ( random(0, width), random(0, height), 20, 20); 
  ellipse ( random(0, width), random(0, height), 20, 20);
  ellipse ( random(0, width), random(0, height), 20, 20);


  // }
  noStroke ();
  fill (0,0,0,30);
  rect (0,0,width,height);
}
//  20*freq(10),40*freq(10)/4,25*freq(5),25*freq(5)


