
size(680, 460);
background(237, 245, 243); //color de fondo

//líneas hacia arriba
line(0, -25, 360, 230);
line(0, 15, 360, 230);
line(0, 70, 360, 230);
line(0, 100, 360, 230);
line(0, 160, 360, 230);
//líneas hacia abajo
line(1200, 500, 360, 230);
line(1200, 630, 360, 230);
line(1200, 710, 360, 230);
line(1200, 810, 360, 230);
line(1200, 950, 360, 230);

//ellips de arriba
fill(181, 216, 177);
ellipse (500, 50, 80, 80);
ellipse (400, 50, 80, 80);
ellipse (400, 100, 80, 80);
ellipse (475, 159, 40, 40);
// ellips de abajo
fill(177, 137, 216);
ellipse (160, 411, 80, 80);
ellipse (260, 411, 80, 80);
ellipse (260, 347, 80, 80);
ellipse (200, 298, 40, 40);


//conjunto de elipses
smooth();
int y = 230;
int d = 120;
ellipse(250, y, d, d);   

//degrade
fill(177, 187, 216); 
ellipse(290, y, d, d); 
fill(177, 214, 216); //
ellipse(340, y, d, d);  
fill(177, 216, 195); 
ellipse(390, y, d, d);  

fill(181, 216, 177); //color-ellipsarriba
ellipse(430, y, d, d);   


