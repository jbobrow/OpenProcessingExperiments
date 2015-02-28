
//Declaracion de variables:

int des = 400;
int desplazamiento = 480; 
int desp = 500;
int eli = 40;
int eli2 = 80;
int eli3 = 100;


//void setup   
size(559, 950);//tamaño mesa de trabajo
background (40,40,40);//color del fondo
noStroke(); //ancho de la linea


fill (138,218,235,20);
bezier (79,0,326,135,558,326,79,0); // curva
bezier (79+desplazamiento,0+desplazamiento,326
+desplazamiento,135+desplazamiento,558+desplazamiento
,326+desplazamiento,79,0); //rayo de luz
fill (138,218,235,10);
bezier (79,0,326+des,135+des,558,326,79,0);
fill (138,218,235,5);
bezier (79,0,326+desp,135+desp,558+desp,326+desp,79,0);
fill (138,218,235,40);
bezier (79,0,326,135,558,326,79,0); // curva

fill (180,242,251,50); //color de cada figura figura 
beginShape(); //comenzar forma
vertex(0,240);
vertex(293,444);
vertex (293,741);
vertex(558,461);
vertex(558,766);
vertex(289,746);
endShape (CLOSE); // cerrar forma

strokeWeight (5);
line(79,0,326,135); //linea

fill (112,193,251,50);
strokeWeight(2);
beginShape();
vertex(0,317);
vertex(172,330);
vertex (293,444);
vertex(272,716);
vertex(558,591);
vertex(558,537);
vertex(264,685);
endShape (CLOSE);

fill (202,249,255,60);
triangle(0,331,55,321,0,402); //triangulo
fill (255,255,255,60);
triangle(55,321,172,330,138,408);

fill (207,167,253,65);
beginShape();
vertex(137,407);
vertex(172,446);
vertex (244,398);
vertex(293,444);
vertex(210,546);
vertex(32,622);
endShape (CLOSE);

fill (250,32,165,70);
quad(0,603,48,587,32,622,0,635); //cuadrialtero
fill (204,176,251,75);
triangle(0,480,84,516,0,552);

fill (116,199,236,70);
quad(0,402,55,321,84,516,0,480);
fill (251,201,243,75);
triangle(0,576,210,546,0,587);
rect (640,640, 50,50); //rectangulo

fill (184,170,249,75);
quad(0,443,293,444,9,484,0,480);

fill (82,199,252,80);
triangle(558,691,558,710,272,716);
fill (255,255,255,80);
triangle(558,654,558,670,272,716);

fill (0,70,86,85);
triangle(272,716,511,611,188,555);

fill (7,66,107,90);
quad(188,555,210,546,520,607,456,635);

triangle(558,419,558,461,293,670);
fill (248,135,253,95);
triangle(84,516,210,546,175,560);



fill (184,170,249,75);
ellipse(128,180, 70,70); // elipse 
ellipse(128,180, 70+eli,70+eli);
ellipse(128,180, 70+eli2,70+eli2);
ellipse(128,180, 70+eli3,70+eli3);


//figura repetitiva

fill (255,255,255,2);
for (int i = 1; i <= 550 ; i = i +50) {
 for (int j = 1 ; j <= 950; j = j +50) {
   
triangle ( i, j, i+20, j+30, i+70, j+55);//figura a repetir
}
}
