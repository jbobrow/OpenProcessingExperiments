
size(643,800);
PImage b;
b = loadImage("BG.jpg");
background(b);

noStroke();
smooth();


// rectangulos verticais
fill(#c4bfbb);
rect(24,0,140,800);

fill(#331017);
rect(190,0,42,800);

fill(#de7e27);
rect(222,0,70,800);

fill(#af4825);
rect(535,0,18,800);

fill(#d2ccd0);
rect(566,0,140,800);

// quads
fill(#61352c);
quad(380, 170, 414, 190 ,414 ,240 , 380, 220);

fill(#61352c);
quad(338, 240, 372, 270 ,372 , 315, 340, 295);

fill(#61352c);
quad(460, 284, 490, 260 ,490 , 310, 460, 330);

fill(#61352c);
quad(406, 360, 440, 340 ,440 , 382, 410, 402);

// quads largos
fill(#61352c);
quad(360, 410, 390, 430, 390, 570, 360, 550);

fill(#61352c);
quad(395, 578, 425, 598, 425, 768, 395, 768);

// quad gray
fill(#83727c);
quad(240, 550, 1200, 900, 1400, 1100, 240, 650);

// floor
fill(#70708a);
quad(140, 650, 1600, 1220, 0, 3100, 0, 740);


// triangulo lateral
fill(#61352c);
triangle(0, 560, 60, 610, 0, 660);





