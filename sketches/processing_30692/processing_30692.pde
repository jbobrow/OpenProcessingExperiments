
size (800,600); // define o tamanho da janela
background (0);// define a cor do background
smooth (); // aplica anti-alias


for (int e=0; e<200; e=e+1) {
  
  fill (random (0,255),30,30);
  stroke (0);//define a cor da linha
  strokeWeight (1);//define a espessura da linha
  float circulo2 = random (0, 100);//define uma variável
  //define as caracteristicas do objecto
  ellipse (random (width), random (height), circulo2, circulo2);
  
}

noFill();
noStroke();
filter (BLUR,15);//aplica um filtro de desfoque "BLUR"

//define variáveis
float x1, y1;
float x2, y2;

float radius;
radius = 200;
float radius2;
radius2 = 400;

float radius0;
radius0 = 50;
float radius01;
radius01 = 200;


//cria um loop
for (int angle=100; angle<1000; angle=angle+1)
{
  float rad = -radians (angle);
x2 = radius2 * cos (rad); 
y2 = radius * sin (rad);
x1 = radius01 * cos (rad); 
y1 = radius0 * sin (rad);

stroke (x2,y2);
strokeWeight (1);
float arco = random (1,4);
//define as caracteristicas da linha
line (width/2+x1,height/2+y1,width/2+x2,height/2+y2);
line (400+x1,20+y1,width/2+x2,height/2+y2);
line (400+x1,20+y1,400+x2,5+y2);
//define as caracteristicas da elipse
ellipse (400+x1,20+y1, arco, arco);
ellipse (400+x2,5+y2, arco, arco);
ellipse (width/2+x2,height/2+y2, arco, arco);
noStroke();

 stroke (radius0,y2,x1,y1);
 noFill();
  strokeWeight (random (1,5));
line (width/2+x1,height/2+y1,width/2+x2,height/2+y2);
//define as caracteristicas dos rectangulos
float circulo = random (0, 20);
rect (width/2+x2,height/2+y2, circulo, circulo);

noFill();
strokeWeight (random (0,10));
float tamanho2 = random (0,10);
rect (width/2+x1,height/2+y1, tamanho2, tamanho2);


}



saveFrame ("polar2.tiff");//salva a imagem

