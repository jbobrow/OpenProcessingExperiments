
//Hello Nightmare!

// Juan Garcia Idep 011

//tamanio del lienzo
size(643,800); // siempre terminar los comandos con --->  punto y coma!
 
PImage b;
b = loadImage("back.jpg");
background(b); //aplica imagen de fondo que este guardada en data jpeg!
//background(#A6FF21); // ir a tools para encontrar colores en codigo

smooth(); // suavizar esquinas // width/2,height/2 variable  

noStroke();
fill(#FFF9D6);//color de relleno
quad(0,0,28,0,28,713,0,735); //trapecio exterior izquierdo


fill(#FFF9D6);//color de relleno
stroke(#6C391B);//borde color
quad(162,0,561,0,567,800,162,800); //trapecio exterior izquierdo

fill(#552121);//color de relleno
noStroke();//sin borde
triangle(0,572,62,615,0,659); //Triangulo exterior izquierdo

noStroke();
fill(#6C391B);//color de relleno
quad(360,354,393,374,395,553,361,536); //Trapecio central pequenio

noStroke();
fill(#6C391B);//color de relleno
quad(400,566,436,581,436,800,400,800); //Trapecio central pequenio inferior 

noStroke();
fill(#9B510C);//color de relleno
quad(536,0,550,0,556,800,539,800); //Trapecio exterior derecho 

noStroke();
fill(#E39342);//color de relleno
quad(217,0,288,0,288,800,217,800); //Trapecio central naranja 

noStroke();
fill(#8B0E0E);//color de relleno
quad(184,0,218,0,218,800,184,800); //Trapecio central bordo 


fill(#88A9F0);//color de relleno
stroke(#6C391B);//borde color
triangle(0,736,150,631,521,799);//Triangulo azul inferior

fill(#88A9F0);
noStroke();//sin borde
triangle(0,735,521,799,0,800);//completando triangulo azul inferior


fill(#88A9F0);//color de relleno
stroke(#6C391B);//borde color
quad(247,540,643,728,606,800,247,630); //trapecio Grande azul inferior derecho


fill(#88A9F0);
noStroke();//sin borde
triangle(643,728,643,800,606,800);//completando triangulo azul inferior

//cuatro Trapecios pequenitos grupo de cuatro

noStroke();
fill(#6C391B);//color de relleno
quad(392,149,425,169,423,218,390,200); //Trapecio 1

noStroke();
fill(#6C391B);//color de relleno
quad(354,223,387,242,386,289,354,272); //Trapecio 2

noStroke();
fill(#6C391B);//color de relleno
quad(464,261,494,243,495,287,466,304); //Trapecio 3

noStroke();
fill(#6C391B);//color de relleno
quad(415,322,449,303,449,347,415,362); //Trapecio 4


//Goodbye Blue Sky!







