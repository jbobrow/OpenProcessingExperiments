
//tamanho da janela e cor de fundo
size (700, 500);
background (0);
smooth(); 

float x1, y1;
float x2, y2;

//espiral
float radius = 1200;
float degree = 1400; 

strokeWeight (2);
stroke(random(350),random(350),random(350));
//raio espiral
for ( int i = 0 ; i < 360; i++){
//angulo da espiral
degree = degree -2;
println("anglulo = " + degree%360); 

float rad = radians(degree);
x2 = radius * cos(rad);
y2 = radius * sin (rad); 

//linhas da espiral
stroke(random(400),random(400),random(400));
line (width/2, height/2,width/2+x2, height/2+y2);

fill(random(255),random(255),random(255));
noStroke(); 


}



                
                
