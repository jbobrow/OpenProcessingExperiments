
// Echo por: Marc Cabañas Garcia 1ºASIX(TARDA)
// Cara de Sonic

// *fondo y quadro

size(500,500);
background(#FFFFFF);

stroke(#000000);
strokeWeight(3);

fill(#D3AE8F);
quad(0,0,100,0,100,100,0,100);
fill(#957153);
quad(0,100,100,100,100,200,0,200);
fill(#D3AE8F);
quad(0,200,100,200,100,300,0,300);
fill(#957153);
quad(0,300,100,300,100,400,0,400);
fill(#D3AE8F);
quad(0,400,100,400,100,500,0,500);

fill(#957153);
quad(100,0,200,0,200,100,100,100);
fill(#D3AE8F);
quad(100,100,200,100,200,200,100,200);
fill(#957153);
quad(100,200,200,200,200,300,100,300);
fill(#D3AE8F);
quad(100,300,200,300,200,400,100,400);
fill(#957153);
quad(100,400,200,400,200,500,100,500);

fill(#D3AE8F);
quad(200,0,300,0,300,100,200,100);
fill(#957153);
quad(200,100,300,100,300,200,200,200);
fill(#D3AE8F);
quad(200,200,300,200,300,300,200,300);
fill(#957153);
quad(200,300,300,300,300,400,200,400);
fill(#D3AE8F);
quad(200,400,300,400,300,500,200,500);

fill(#957153);
quad(300,0,400,0,400,100,300,100);
fill(#D3AE8F);
quad(300,100,400,100,400,200,300,200);
fill(#957153);
quad(300,200,400,200,400,300,300,300);
fill(#D3AE8F);
quad(300,300,400,300,400,400,300,400);
fill(#957153);
quad(300,400,400,400,400,500,300,500);

fill(#D3AE8F);
quad(400,0,500,0,500,100,400,100);
fill(#957153);
quad(400,100,500,100,500,200,400,200);
fill(#D3AE8F);
quad(400,200,500,200,500,300,400,300);
fill(#957153);
quad(400,300,500,300,500,400,400,400);
fill(#D3AE8F);
quad(400,400,500,400,500,500,400,500);

fill(#E4E817);
ellipse(50,50,60,60);
fill(#D3AE8F);
ellipse(50,50,30,30);

fill(#E4E817);
ellipse(250,50,60,60);
fill(#D3AE8F);
ellipse(250,50,30,30);

fill(#E4E817);
ellipse(450,50,60,60);
fill(#D3AE8F);
ellipse(450,50,30,30);

fill(#E4E817);
ellipse(150,150,60,60);
fill(#D3AE8F);
ellipse(150,150,30,30);

fill(#E4E817);
ellipse(350,150,60,60);
fill(#D3AE8F);
ellipse(350,150,30,30);

fill(#E4E817);
ellipse(50,250,60,60);
fill(#D3AE8F);
ellipse(50,250,30,30);

fill(#E4E817);
ellipse(250,250,60,60);
fill(#D3AE8F);
ellipse(250,250,30,30);

fill(#E4E817);
ellipse(450,250,60,60);
fill(#D3AE8F);
ellipse(450,250,30,30);

fill(#E4E817);
ellipse(450,250,60,60);
fill(#D3AE8F);
ellipse(450,250,30,30);

fill(#E4E817);
ellipse(150,350,60,60);
fill(#D3AE8F);
ellipse(150,350,30,30);

fill(#E4E817);
ellipse(350,350,60,60);
fill(#D3AE8F);
ellipse(350,350,30,30);

fill(#E4E817);
ellipse(50,450,60,60);
fill(#D3AE8F);
ellipse(50,450,30,30);

fill(#E4E817);
ellipse(250,450,60,60);
fill(#D3AE8F);
ellipse(250,450,30,30);

fill(#E4E817);
ellipse(450,450,60,60);
fill(#D3AE8F);
ellipse(450,450,30,30);

// *cara

stroke(#041289);
strokeWeight(5);
fill(#000AB7);
ellipse(190,290,190,190);

// *puntas del pelo

stroke(#041289);
strokeWeight(5);
fill(#000AB7);
arc(285,205,240,160,3.10,5.12);

arc(251,357,190,465,24.34,25.55);

arc(261,263,280,155,4.70,6.45);

arc(200,387,190,465,24.58,25.55);

line(270,266,400,276);

line(296,408,336,447);

line(300,186,331,131);

line(200,390,286,481);

// *ojos

stroke(#041289);
strokeWeight(10);
arc(224,279,110,120,12.40,15.15);
arc(240,298,130,70,8.70,11.62);
line(120,263,155,360);
stroke(#000000);
strokeWeight(3);

noStroke();

// ojo derecho

fill(#EBEDEB);
arc(224,279,110,120,12.40,15.15);

stroke(#041289);
strokeWeight(5);
arc(224,279,110,120,12.40,15.15);
ellipse(195,295,18,40);
ellipse(195,295,10,30);

arc(240,298,130,70,8.70,11.62);

stroke(#000000);
strokeWeight(1);
fill(#1EAD2D);
ellipse(195,295,18,40);

fill(#000000);
ellipse(195,295,10,30);

fill(#FFFFFF);
ellipse(193,286,6,10);

// ojo izquierdo

fill(#EBEDEB);
stroke(#041289);
strokeWeight(5);
arc(130,300,60,85,13.50,16.80);

noStroke();
ellipse(155,325,90,30);

stroke(#041289);
strokeWeight(5);
noFill();
arc(135,385,240,155,4.71,5.12);

stroke(#000000);
strokeWeight(1);
fill(#1EAD2D);
ellipse(122,300,11,33);

fill(#000000);
ellipse(122,300,6,24);

fill(#FFFFFF);
ellipse(121,293,3,8);

// *morro

stroke(#000000);
strokeWeight(5);
arc(190,346,160,85,44.05,47.22);

noStroke();
fill(#FAB877);
arc(190,346,160,85,44.05,47.12);

ellipse(223,350,90,30);

ellipse(168,345,93,45);

ellipse(147,345,75,30);

stroke(#000000);
strokeWeight(3);
noFill();
arc(227,480,220,288,4.57,5.12);

arc(168,516,220,388,4.37,5.12);

arc(148,449,170,238,4.22,4.52);

// *orejas

stroke(#041289);
strokeWeight(5);

// oreja derecha

fill(#000AB7);
triangle(260,180,205,225,260,245);

stroke(#000000);
strokeWeight(2);
fill(#FAB877);
triangle(255,190,210,225,255,238);

// oreja izquierda

stroke(#041289);
strokeWeight(5);
fill(#000AB7);
triangle(100,170,115,245,170,205);

fill(#FAB877);
stroke(#000000);
strokeWeight(2);
triangle(106,180,118,240,140,225);

// *nariz

noStroke();
fill(#000000);
ellipse(150,332,15,30);

// *boca

noFill();
stroke(#000000);
strokeWeight(3);
arc(170,347,140,30,12.85,14.00);
line(225,344,245,356);


