
// Desplazamiento del eje x

int despl = 350;
int despl2 = -180;

// Color de ojos y cuerpo

color v = color (0,255,0);
color f = color (255,0,100);
color a = color (255,200, 0);
color m = color (0,0,255);
color e = color (0,255,255);
color x = color (240,120,200);

// Bordes ojos, boca y cuerpo

int bord = 5;
int bord2 = 3;
int linbord = 7;


size (600,500);
background (255);

// Figura 1= Mono Puntiagudo

strokeWeight (linbord);
fill (v);
beginShape ();

vertex (93, 161);
vertex (114, 177);
vertex (137, 143);
vertex (159, 177);
vertex (179, 161);
vertex (202, 321);
vertex (159, 321);
vertex (137, 360);
vertex (114, 321);
vertex (72, 321);

endShape (CLOSE);

// Ojos Mono P

strokeWeight (bord);
fill (255);
ellipse (137-30,239, 28,28);
ellipse (137+30,239, 28,28);

strokeWeight (bord2);
fill (a);
ellipse (137-30,239, 10,10);
ellipse (137+30,239, 10,10);

// Boca Mono P

strokeWeight (1.5);
line (137,290, 160,290);


// CLON Mono P

fill (f);
beginShape ();

vertex (93+ despl, 161);
vertex (114 + despl, 177);
vertex (137+ despl, 143);
vertex (159+ despl, 177);
vertex (179+ despl, 161);
vertex (202+ despl, 321);
vertex (159+ despl, 321);
vertex (137+ despl, 360);
vertex (114+ despl, 321);
vertex (72+ despl, 321);

endShape (CLOSE);

// Ojos CLON mono P

strokeWeight (bord2);
fill (255);
ellipse (137-30+ despl,239, 28,28);
ellipse (137+30 + despl,239, 28,28);


fill (e);
ellipse (137-30 +despl,239, 10,10);
ellipse (137+30 + despl,239, 10,10);


// Boca CLON mono P

strokeWeight (linbord);
fill (x);
line (137+despl,290, 160+despl,290);



// Figura 2= Perro triangular

stroke (f); 
strokeWeight (bord);
fill (a);

beginShape ();

vertex (414 +despl2, 244);
vertex (492 +despl2, 144);
vertex (570 +despl2, 244);
vertex (527 +despl2, 244);
vertex (527 +despl2, 360);
vertex (513 +despl2, 360);
vertex (513 +despl2, 276);
vertex (471 +despl2, 276);
vertex (471 +despl2, 360);
vertex (457 +despl2, 360);
vertex (457 +despl2, 244);

endShape (CLOSE);


// Ojos Perro T

stroke (0);
strokeWeight (1);
fill (0);
ellipse (492-22.5 +despl2, 192, 10,10);
ellipse (492+22.5 +despl2, 192, 10,10);

// Boca Perro T

strokeWeight (bord);
fill (m);
triangle (492 +despl2, 186, 513 +despl2, 224, 471 +despl2, 224);

fill (a);
triangle (492 +despl2, 196, 482 +despl2, 215, 502 +despl2, 215);
