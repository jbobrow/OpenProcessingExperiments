

int s; //variável dos segundos; os segundos vão de 0-59 
int m; //variável dos minutos, vão de 0-59
int h;    //variável das horas, vão de 0-23

PFont myFont;//guardar a fonte

void setup(){//função para as definições
  size(500,500);//tamanho da pagina 
  background(255);//cor de fundo da pagina
smooth();//serve para suavizar as formas 
s=0;//atribuimos um valor de inicio
m=0;//atribuimos um valor de inicio
h=0;//atribuimos um valor de inicio
  
  myFont= createFont("Verdana-48",40, true);//fazemos o download do tipo de letra(font)
  
  textFont(myFont,40);//tamanho do tipo de letra
  
}

void draw(){// função para desenhar 
  background(255);//cor de fundo
  
 
  s=second();//variável dos segundos
  m=minute();//variavel dos minutos
  h=hour();//variavel das horas
  
  println(s);//para inserir uma acçao na matrix do codigo que queremos
  
  noStroke();// sem contorno

 fill(201,81,91);//cor do texto dos segundos
 text(s,width/2+70,height); //texto dos segundos e onde se vai localizar
fill(201,81,91,100);//cor da elipse dos segundos

ellipse(width/2,height/2, s*5,s*5);//onde a elipse dos segundos vai ficar localizada

fill(81,201,172);//cor do texto dos minutos
text(m,width/2,height);//texto dos minutos e onde se vai localizar
 fill(81,201,172,100);//cor da elipse dos minutos
 //stroke(0,255,0);
ellipse(width/4, height/2, m*5, m*5);//onde a elipse dos minutos vai ficar localizada//onde a elipse vai ficar localizada

fill(191,201,81);//cor do texto das horas
text(h, width/2-70, height); //texto das horas e onde se vai localizar
 fill(191,201,81,100);//cor da elipse das horas
 
 //stroke(0,0,255);
ellipse(width/2, height/4, h*5,h*5);//onde a elipse das horas vai ficar localizada
}

