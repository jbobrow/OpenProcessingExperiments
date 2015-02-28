
size (700, 700); //define o tamanho da janela
background (0); // define a cor do background
smooth(); //dá suavidade às formas

float a1, b1; //ponto 1
float a2, b2; // ponto 2

float radius =  300; //Raio e ângulo em graus
float  degree = 20; 


stroke(0); //define a cor da linha

for ( int i = 0 ; i < 360; i++){ //variável; define o ângulo das linhas
  
  degree = degree -1;// velocidade
  
float rad = - radians(degree); // converte graus para Raio; as funções sin() e cos () funcionam com o Raio
a2 = radius * cos(rad); 
b2 = radius * sin (rad); 

// define as características da linha
stroke(random(90,255),random(90,255),random(90,255),random(90,255)); 
line (width/2, height/2,width/2+a2, height/2+b2);

// define as características da elipse
fill(random(50,100),random(100,200),random(100,200));
noStroke(); 
float larg = map (i, 3,360,random(3,20),random(3,40)); 
ellipse (width/2+a2, height/2+b2, larg,larg);

}

saveFrame("ex.png");

