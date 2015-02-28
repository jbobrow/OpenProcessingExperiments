
void setup(){
  size (600, 600);
  smooth ();
  background (0);
  noStroke ();
}

void draw (){
  fill (0,0,255);
  line (325,350,350,325);
  
  //Cara blanca
  fill (255,255,255);
  ellipse (300,300, 300, 300); 
  
    // elipse ojo Izq
  fill (0,0,0);
  strokeWeight (5);
  ellipse (275, 275, 30, 30);
  
    // elipse ojo Der
  fill (0,0,0);
  strokeWeight (5);
  ellipse (325, 275, 30, 30);
  
  // elipse pupila Izq
  fill (255,255,255);
  ellipse (285, 275, 10, 10);
  
  // elipse puplila Der
  fill (255,255,255);
  ellipse (315, 275, 10, 10);
  //Nariz
  fill (0,0,0);
  ellipse (300, 300, 25, 25);
  
  //agujeros de la nariz
  stroke (0);
  fill (255,255,255);
  ellipse (295,310,10,10);
  ellipse (305,310,10,10);
  


 //orejas izquierda
  fill (0,0,0);
 triangle (50,500, 200,200,200,400);
 //orejas derecha
 fill (0,0,0);
 triangle (550,500,400,400,400,200);

 // Boca

 strokeWeight (3);
 stroke (5);
 line (250,375,250,350);
 line (250,350, 275,375);
 line (275,375, 300, 350);
 line (300,350, 325,375);
 line (325,375, 350,350);
 line (350,350, 350,375);
line (350,375, 300,390);
line (300,390, 250,375);

// triangulo
noStroke ();
fill (0);
//Cabeza
triangle (300, 400, 300, 450, 350, 425);
triangle (200,200, 300,5, 400,200);

//Barbilla

fill (0);
triangle (300, 400, 300, 450, 250, 425);
translate( 0,30);
triangle (300, 400, 300, 450, 250, 425);
triangle (300, 400, 300, 450, 350, 425);
stroke (125);
strokeWeight (1);
line (300,325, 300,360);
//rotate (90);

fill (255,0,0);
triangle(275,345,325, 345, 300, 360);
fill (0);
line (300,350, 300,360);
//Cola
fill (255,255,255);
ellipse (300,145,40,40);

fill (255,255,255);
ellipse (320,115,20,20);

fill (255,255,255);
ellipse (305,105,10,10);

fill (255,255,255);
ellipse (300,95,10,10);

//KK
fill (#95671B);
translate(300,435);
rotate(PI/4.0);
rect(-26, -26, 52, 52);
fill (#95671B);
translate(60, 60);
rotate(PI/2.0);
rect(-26, -26, 52, 52);
line(300,50, 300,200);

stroke (125);
strokeWeight (2);



}

