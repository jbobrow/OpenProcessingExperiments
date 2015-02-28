
size (591,820);//tamaño de superficie
smooth();//suaviza pixel de dibujo
noStroke();
PImage fondo = loadImage("Malevich - Suprematism2.jpg");
background(fondo);//carga el fondo

//círculo rojo
fill(178,40,3);
ellipse(117,130,191,191);
noStroke();

//línea inclinada mostaza, debajocruz y cuadro negro
fill(204,150,0); //(r,g,b)
quad(33,380,464,332,458,299,32,343);  //x__, yI, sentido del reloj inverso;
noStroke();//sin línea de borde

//línea amarillo verde, paralela a la roja
fill(161,150,60);
quad(107,820,134,820,234,525,205,525);
noStroke();

//línea roja paralela a línea amarillo verde
fill(135,48,28);
quad(161,740,200,740,288,495,244,495);
noStroke();

//línea gris
fill(220,218,223);
quad(237,707,303,707,370,515,299,515);
noStroke();

//línea roja, casi acostada, derecha
fill(149,27,4);
quad(382,790,526,716,524,678,368,765);
noStroke();

//línea amarilla, debajo línea roja acostada
fill(195,141,9);
quad(445,792,573,732,574,703,448,768);
noStroke();

//parte de cruz azul: vertical
fill(18,28,115);
quad(366,730,380,720,272,108,256,110);
noStroke();

//parte cruz azul: horizontal
fill(18,28,115);
quad(238,155,304,135,302,122,237,141);
noStroke();

//cuadrado negro, casi al centro de la imagen
fill(4,0,11);
quad(406,385,500,210,321,127,226,291);
noStroke();

//todos los parámetro empleados, para definir dibujo, en la forma cuad, parámetro de "x" y "y"
//determinados al contrario de las manecillas del reloj

