
//https://es.khanacademy.org/cs/dibujo-del-vector-ayala-y-alvarez/2712005881

// Vectores Rafael Ayala Torres ... Jorge Alvarez 
// Materia a la cual se aplicara : Calculo Vectorial
// Docente al que se le sugiere el poryecto: MIREYA DIAZ  

background(228, 240, 239);
// eje coordenado (x,y)
    stroke(36, 181, 111);
    line(200,400,200,0);
    stroke(240, 17, 91);
    line(0,200,399,200);

// punto uno coordenadas (x,y)

var x1= (10);
var y1=-(70);

// punto dos coordenadas (x,y)

var x2= (50);
var y2=-(-94);

// dibuja el punto P1
strokeWeight(10);
stroke(179, 132, 38);
    point(x1+200, y1+200);

// dibuja el punto P2
strokeWeight(10);
point(x2+200, y2+200);

// Representacion grafica del Vector
strokeWeight(5);
line(x1+200,y1+200,x2+200,y2+200);

