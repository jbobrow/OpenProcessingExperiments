
 //Autor: Alvaro Ramos
//IDEP 2010  
//Modulo: Processing  
//Miro dinamico  
PImage bg;                  
void setup()   
{  
  size(640,460);  
  frameRate(25);   
  noStroke();  
  smooth();  
  background (225);  
}  

void draw()   
{  
  
  fill(60,14,227);  
  ellipse(98,200, 35, 35);    //bolabluky  
  fill(120,38,38);  
  
  fill(40,100,60);  
  ellipse(156, 44, 35, 35);    //verdechikita 

  ellipse(471, 160, 37, 37); //bola marron 

  fill(30,40,30);  
  ellipse(610, 190, 38, 38); //verdegrisderecha
  
  
  fill(20,30,50);  
  ellipse(556, 105, 43, 43); //bolagrisderexa
  

  fill(30);  
  rotate(-0.10);  
  rect(-40,290,820,100);//lineanegra   
  
  fill(50,50,50);  
  rect(-60,335,830,950);  //suelo 
     
  fill(132,59,4);  
  ellipse(135, 419,25, 25); //naranjaizqd
  
  fill(265,80,2);  
  ellipse(429, 412, 36, 36); //circulonaranjabajo
 
  filter(BLUR, 2);             //Blureado  

  fill(170,38,38);  
  ellipse(300, 139, 310, 190);  
}

