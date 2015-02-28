


size (500,500);// este comando define a janela
background (255); //cor fundo branca
smooth(); // graficos com anti-alissing

float x1, y1; //enuciar variavel ponto 1
float x2, y2; //enuciar ponto 2


float radius =  800; //enuciar variavel raio
float  degree = 20; //enuciar variavel grau


stroke(0); //contorno 0

for ( int i = 0 ; i < 360; i++){
  
  degree = degree -2;// incremento   


float rad = - radians(degree); // converter graus em  Radians


//incremento ao segundo ponto das linhas
x2 = radius * cos(rad); 
y2 = radius * sin (rad); 


 

noStroke();//graficos sem controno
fill(255,0,0); //preenchimento vermelho
quad(width/2, height/2, width/2, height/2,width/2+x2, height/2+y2, width/2+x2+10, height/2+y2+10);
fill(5,0,255);
quad(width/2, height/2, width/2, height/2,width/2+x2, height/2+y2, width/2+x2-10, height/2+y2-10);

//desenhar a linha com o primeiro ponto ao centro 
//e o segundo comforme defenido araves do cos e sim
stroke(0);
line (width/2, height/2,width/2+x2, height/2+y2);




}

