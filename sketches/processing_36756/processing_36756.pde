
size (500, 500);// este comando define a janela
background (0);//cor fundo
smooth();// graficos com anti-alissing

float x1, y1; //enuciar variavel ponto 1
float x2, y2; //enuciar ponto 2


float radius =  800;//enuciar variavel raio
float  degree = 10; //enuciar variavel grau

//ciclo que vai fazer o senario estrelado, atraves do loop de mil pontos brancos
for (int i = 1; i <1000; i = i + 1){

strokeWeight(random(3)); // tamanho dos pontos varia aletoriamento entre 1 e 3
stroke(255);//pontos com contorno brancos
point (random(width), random(height) )  ;  //pontos com posicao aleatoria
  
}


for ( int i = 0 ; i < 360; i++){
 
degree = degree -3;// incremento   

 

float rad = - radians(degree); // converter graus em  Radians


//incremento ao segundo ponto das linhas
x2 = radius * cos(rad);
y2 = radius * sin (rad);


stroke(0);


//desenho dos planetas


fill(113,109,255);
ellipse (x2/1.05,y2/1.05,16,16);//plutao

fill(106,175,253);
ellipse (x2/1.3,y2/1.3,18,18);//neptuno

fill(145,246,230);
ellipse (x2/1.6,y2/1.6,25,25);//urano

fill(213,212,70);
ellipse (x2/2,y2/2,23,23);//saturno

fill(125,151,114);
ellipse (x2/2.4,y2/2.4,40,40);//jupiter

fill(212,178,140);
ellipse (x2/3,y2/3,10,10);//marte

fill(62,85,199);
ellipse (x2/3.9,y2/3.9,13,13);//terraa

fill(227,70,15);
ellipse (x2/5,y2/5,17,17);//venus

fill(101,119,119);
ellipse (x2/6.5,y2/6.5,10,10);//mercurio


}

fill(252,205,5);
ellipse (0,0,200,200);//sol

