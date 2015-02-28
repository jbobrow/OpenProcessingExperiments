
size(250, 250);
background(10);
smooth();
 
//rectangulos
noStroke();
fill(#FF00A2);
rect(10, 10, 230, 230);

fill(#FF006F);
rect(30, 30, 190, 190);

fill(#FF00A2);
rect(50, 50, 150, 150);

fill(#FF006F);
rect(70, 70, 110, 110);

fill(#FF00A2);
rect(90, 90, 70, 70);
 
//circulos do meio
noStroke();
fill(#00E8FF);
ellipse(125, 125, 80, 80);

fill(#00A8FF);
ellipse(125, 125, 60, 60);

fill(#00E8FF);
ellipse(125, 125, 40, 40);

fill(#00A8FF);
ellipse(125, 125, 20, 20);
 
//curvas
noFill();
//curvas verticais
stroke(0, 100);
strokeWeight(10);
bezier(90, 0, 190, 90, 70, 170, 130, 250);
 
stroke(0, 170);
strokeWeight(5);
bezier(90, 0, 190, 90, 70, 170, 130, 250);
 
//curvas horizontais
stroke(0, 100);
strokeWeight(10);
bezier(0, 150, 100, 80, 150, 170, 250, 110);
 
stroke(0, 170);
strokeWeight(5);
bezier(0, 150, 100, 80, 150, 170, 250, 110);
 
//quadrados
noStroke();
//canto sup esq
fill(#FFE600);
rect(115, 115, 10, 10);

fill(80);
rect(85, 85, 25, 25);

fill(#FFE600);
rect(55, 55, 35, 35);

fill(200);
rect(25, 25, 45, 45);

fill(#FFE600);
rect(-10, -10, 60, 60);
 
//canto inf dir
fill(#FFE600);
rect(115, 125, 10, 10);

fill(80);
rect(85, 140, 25, 25);

fill(#FFE600);
rect(55, 160, 35, 35);

fill(200);
rect(25, 180, 45, 45);

fill(#FFE600);
rect(-10, 200, 60, 60);
 
//canto superior dir
fill(#FFE600);
rect(125, 115, 10, 10);

fill(80);
rect(140, 85, 25, 25);

fill(#FFE600);
rect(160, 55, 35, 35);

fill(200);
rect(180, 25, 45, 45);

fill(#FFE600);
rect(200, -10, 60, 60);
 
//canto inf esq
fill(#FFE600);
rect(125, 125, 10, 10);

fill(80);
rect(140, 140, 25, 25);

fill(#FFE600);
rect(160, 160, 35, 35);

fill(200);
rect(180, 180, 45, 45);

fill(#FFE600);
rect(200, 200, 60, 60);
 
//circulo do meio
fill(0);
ellipse(125, 125, 10, 10);

                
                
