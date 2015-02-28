
/**
 * Shape Primitives. 
 * 
 * The basic shape primitive functions are triangle(),
 * rect(), quad(), and ellipse(). Squares are made
 * with rect() and circles are made with
 * ellipse(). Each of these functions requires a number
 * of parameters to determine the shape's position and size. 
 */
 
size(1030, 700);
smooth(); 
background(#ece5df);

// manchurron
stroke(1);
line(920, 240, 950, 180);
line(925, 245, 955, 185);
noStroke();
fill(#313234,240);
ellipse(880, 250, 40, 40);
ellipse(870, 270, 50, 50);
ellipse(870, 310, 15, 15);
ellipse(890, 330, 15, 15);
ellipse(890, 360, 10, 30);
ellipse(870, 240, 30, 50);
ellipse(850, 220, 30, 50);

noStroke();

// la redonda grande roja
fill(#b7313c);
ellipse(450, 200, 500, 350);

// la redonda verde
fill(#556B2F);
ellipse(180, 100, 40, 40);
fill(#556B2F, 150);
ellipse(180, 100, 60, 60);

// la redonda azul
fill(#476aae);
ellipse(100, 350, 40, 40);
fill(#476aae,150);
ellipse(100, 350, 60, 60);

// la redonda granate
fill(#894132);
ellipse(700, 300, 40, 40);
fill(#894132,150);
ellipse(700, 300, 60, 60);

// la redonda negrilla
fill(#313234);
ellipse(900, 200, 40, 40);
fill(#313234,150);
ellipse(900, 200, 60, 60);

// la redonda marron oscuro
fill(#4e4945);
ellipse(950, 350, 40, 40);
fill(#4e4945,150);
ellipse(950, 350, 60, 60);

// la redonda marron que esta a la izquierda encima del suelo
fill(#72473e);
ellipse(180, 600, 40, 40);
fill(#72473e,150);
ellipse(180, 600, 60, 60);

// la redonda morron encima del suelo
fill(#FFA500);
ellipse(700, 550, 40, 40);
fill(#FFA500,150);
ellipse(700, 550, 60, 60);

// suelo oscuro muy dificil.no me sale!!! :/
fill(0,160);
quad(0, 800, 0, 450, 1100, 390, 1200, 1000);
fill(0,100);
quad(0, 500, 0, 450, 1100, 390, 1200, 450);






