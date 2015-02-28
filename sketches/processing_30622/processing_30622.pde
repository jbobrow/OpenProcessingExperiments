
size (500, 500);
background (0);
smooth();

// Definição de centros

int centerx=width/2;
int centery=height/2;

float x1, y1; //ponto 1
float x2, y2; // ponto 2

float radius =  500;
float  degree = 90;

// Preparaçao de geometria radial polar

for ( int i = 0 ; i < 360; i++){
 
  degree = degree -20;
  println("angulo = " + degree%360);
 
float rad = - radians(degree); // Converter graus para Radians para utilizar funções de sin() e cos()
x2 = radius * cos(rad);
y2 = radius * sin (rad);

// Linha 1

stroke(255);
strokeWeight(.1);
line (width/2, height/2,width/2+x2, height/2+y2);

}

for ( int i = 0 ; i < 360; i++){
 
  degree = degree -1;
  println("angulo = " + degree%360);
 
float rad = - radians(degree); 

x2 = radius * cos(rad);
y2 = radius * sin (rad);

//Linha 2

stroke(255);
strokeWeight(.1);
line (width/2, height/2,width/2+x2, height/2+y2);

}

// Teia de Vertex

stroke(255);
strokeWeight(1);
noFill();

beginShape();
vertex(250, 150);
vertex(217, 155);
vertex(185, 172);
vertex(162, 199);
vertex(148, 232);
vertex(148, 268);
vertex(162, 301);
vertex(185, 328);
vertex(217, 344);
vertex(250, 349);//centro inferior do vertex
vertex(283, 344);
vertex(315, 328);
vertex(338, 301);
vertex(352, 268);
vertex(352, 232);
vertex(338, 199);
vertex(315, 172);
vertex(283, 155);
endShape(CLOSE);

scale(0.5);
translate (centerx,centery);
beginShape();
vertex(250, 150);
vertex(217, 155);
vertex(185, 172);
vertex(162, 199);
vertex(148, 232);
vertex(148, 268);
vertex(162, 301);
vertex(185, 328);
vertex(217, 344);
vertex(250, 349);//centro inferior do vertex
vertex(283, 344);
vertex(315, 328);
vertex(338, 301);
vertex(352, 268);
vertex(352, 232);
vertex(338, 199);
vertex(315, 172);
vertex(283, 155);
endShape(CLOSE); 

translate (-125,-125);
scale(1.5);
beginShape();
vertex(250, 150);
vertex(217, 155);
vertex(185, 172);
vertex(162, 199);
vertex(148, 232);
vertex(148, 268);
vertex(162, 301);
vertex(185, 328);
vertex(217, 344);
vertex(250, 349);//centro inferior do vertex
vertex(283, 344);
vertex(315, 328);
vertex(338, 301);
vertex(352, 268);
vertex(352, 232);
vertex(338, 199);
vertex(315, 172);
vertex(283, 155);
endShape(CLOSE);

scale(0.5);
translate (centerx,centery);
beginShape();
vertex(250, 150);
vertex(217, 155);
vertex(185, 172);
vertex(162, 199);
vertex(148, 232);
vertex(148, 268);
vertex(162, 301);
vertex(185, 328);
vertex(217, 344);
vertex(250, 349);//centro inferior do vertex
vertex(283, 344);
vertex(315, 328);
vertex(338, 301);
vertex(352, 268);
vertex(352, 232);
vertex(338, 199);
vertex(315, 172);
vertex(283, 155);
endShape(CLOSE);

scale(0.7);
translate (110,110);
beginShape();
vertex(250, 150);
vertex(217, 155);
vertex(185, 172);
vertex(162, 199);
vertex(148, 232);
vertex(148, 268);
vertex(162, 301);
vertex(185, 328);
vertex(217, 344);
vertex(250, 349);//centro inferior do vertex
vertex(283, 344);
vertex(315, 328);
vertex(338, 301);
vertex(352, 268);
vertex(352, 232);
vertex(338, 199);
vertex(315, 172);
vertex(283, 155);
endShape(CLOSE);

scale(5);
translate (-200,-200);
beginShape();
vertex(250, 150);
vertex(217, 155);
vertex(185, 172);
vertex(162, 199);
vertex(148, 232);
vertex(148, 268);
vertex(162, 301);
vertex(185, 328);
vertex(217, 344);
vertex(250, 349);//centro inferior do vertex
vertex(283, 344);
vertex(315, 328);
vertex(338, 301);
vertex(352, 268);
vertex(352, 232);
vertex(338, 199);
vertex(315, 172);
vertex(283, 155);
endShape(CLOSE);

scale(1.3);
translate (-58,-58);
beginShape();
vertex(250, 150);
vertex(217, 155);
vertex(185, 172);
vertex(162, 199);
vertex(148, 232);
vertex(148, 268);
vertex(162, 301);
vertex(185, 328);
vertex(217, 344);
vertex(250, 349);//centro inferior do vertex
vertex(283, 344);
vertex(315, 328);
vertex(338, 301);
vertex(352, 268);
vertex(352, 232);
vertex(338, 199);
vertex(315, 172);
vertex(283, 155);
endShape(CLOSE);

scale(1.3);
translate (-58,-58);
beginShape();
vertex(250, 150);
vertex(217, 155);
vertex(185, 172);
vertex(162, 199);
vertex(148, 232);
vertex(148, 268);
vertex(162, 301);
vertex(185, 328);
vertex(217, 344);
vertex(250, 349);//centro inferior do vertex
vertex(283, 344);
vertex(315, 328);
vertex(338, 301);
vertex(352, 268);
vertex(352, 232);
vertex(338, 199);
vertex(315, 172);
vertex(283, 155);
endShape(CLOSE);

scale(1.3);
translate (-58,-58);
beginShape();
vertex(250, 150);
vertex(217, 155);
vertex(185, 172);
vertex(162, 199);
vertex(148, 232);
vertex(148, 268);
vertex(162, 301);
vertex(185, 328);
vertex(217, 344);
vertex(250, 349);//centro inferior do vertex
vertex(283, 344);
vertex(315, 328);
vertex(338, 301);
vertex(352, 268);
vertex(352, 232);
vertex(338, 199);
vertex(315, 172);
vertex(283, 155);
endShape(CLOSE);
fill(0);
stroke(0);
translate(0.7,0);

// Patas aranha

line (centerx-5,centery+20,centerx-10,centery+15);
line (centerx-10,centery+15,centerx-5,centery);

line (centerx+5,centery+20,centerx+10,centery+15);
line (centerx+10,centery+15,centerx+5,centery);

line (centerx-5,centery+22,centerx-14,centery+16);
line (centerx-14,centery+16,centerx-12,centery+5);

line (centerx+5,centery+22,centerx+14,centery+16);
line (centerx+14,centery+16,centerx+12,centery+5);

line (centerx-5,centery+23,centerx-13,centery+25);
line (centerx-13,centery+25,centerx-22,centery+15);

line (centerx+5,centery+23,centerx+13,centery+25);
line (centerx+13,centery+25,centerx+22,centery+15);

line (centerx-5,centery+24,centerx-16,centery+30);
line (centerx-16,centery+30,centerx-25,centery+50);

line (centerx+5,centery+24,centerx+16,centery+30);
line (centerx+16,centery+30,centerx+25,centery+50);

line (centerx-2,centery+18,centerx-4,centery+14);
line (centerx-4,centery+14,centerx-2,centery+12);

line (centerx+2,centery+18,centerx+4,centery+14);
line (centerx+4,centery+14,centerx+2,centery+12);

//Corpo Aranha

stroke(25);
ellipse (centerx,centery+22,12,12);
ellipse (centerx,centery+40,25,30);
noStroke();
fill(255,0,0);
triangle (centerx,centery+40,centerx-5,centery+35,centerx+5,centery+35);
triangle (centerx,centery+40,centerx-5,centery+45,centerx+5,centery+45);

