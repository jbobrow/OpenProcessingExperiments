
size (500,500);
background (215,0,50); 
smooth();
noStroke();
for ( int i = 0; i < 2000; i = i +1)

// Background aleatorio

{
  fill(random(200,255),0,0, 50);
  arc (random(width), random(height), random(width), random(height), radians(random(360)), radians (random(360)));
  fill(0,0,random(200,255), 50);
  arc (random(width), random(height), random(width), random(height), radians(random(360)), radians (random(360)));
}

// Corpo papagaio e "tronco" de baixo

fill(200,70,20,165);
rect (0,446,500,54);
fill (0,0,255,150);
triangle (100,225,250,200,250,300);
triangle (400,225,250,200,250,300);
quad (50,325,250,500,450,325,250,250);
quad (100,325,250,500,400,325,250,250);
fill (255,0,0,150);
triangle (0,500,250,0,250,250);
triangle (500,500,250,0,250,250);
fill (255,0,0,200);
triangle (75,275,250,200,500,500);
triangle (425,275,250,200,0,500);
arc (380, 200, 300, 300, radians(155), radians (200));
arc (121, 200, 300, 300, radians(-20), radians (25));
fill (0,0,255,245);
arc (250, 399, 200, 400, radians(225), radians (315));
fill (0,0,255,200);
arc (360, 145, 200, 200, radians(130), radians (175));
arc (141, 145, 200, 200, radians(5), radians (50));
fill (255,0,0,200);
arc (328, 125, 125, 125, radians(110), radians (155));
arc (172, 125, 125, 125, radians(25), radians (70));
fill (0,0,255,200);
arc (300, 81, 150, 150, radians(90), radians (135));
arc (201, 81, 150, 150, radians(45), radians (90));
fill (255,0,0,245); // Pena cabeça vermelha
arc (250, 65, 100, 200, radians(45), radians (135));
fill (0,0,255,245); // Penas azuis cabeça
arc (250, 65, 75, 175, radians(45), radians (135));
fill(255,0,0,255); // Penas vermelhas seguintes
arc (250, 65, 50, 150, radians(45), radians (135));

// Bico e penas

fill(255,210,0);
arc (250, 250, 100, 150, radians(240), radians (300));
arc (180, 480, 40, 80, radians(240), radians (300));
arc (192, 480, 40, 80, radians(240), radians (300));
arc (204, 480, 40, 80, radians(240), radians (300));
arc (298, 480, 40, 80, radians(240), radians (300));
arc (310, 480, 40, 80, radians(240), radians (300));
arc (322, 480, 40, 80, radians(240), radians (300));
fill(255,230,0);
arc (250, 250, 80, 120, radians(240), radians (300));
arc (180, 480, 30, 60, radians(240), radians (300));
arc (192, 480, 30, 60, radians(240), radians (300));
arc (204, 480, 30, 60, radians(240), radians (300));
arc (298, 480, 30, 60, radians(240), radians (300));
arc (310, 480, 30, 60, radians(240), radians (300));
arc (322, 480, 30, 60, radians(240), radians (300));
fill(255,250,0);
arc (250, 250, 60, 100, radians(240), radians (300));
arc (180, 480, 15, 60, radians(240), radians (300));
arc (192, 480, 15, 60, radians(240), radians (300));
arc (204, 480, 15, 60, radians(240), radians (300));
arc (298, 480, 15, 60, radians(240), radians (300));
arc (310, 480, 15, 60, radians(240), radians (300));
arc (322, 480, 15, 60, radians(240), radians (300));

// Olhos

fill(200,70,20);
arc (215, 170, 30, 80, radians(200), radians (340));
arc (285, 170, 30, 80, radians(200), radians (340));
fill(255);
arc (215, 170, 20, 70, radians(200), radians (340));
arc (285, 170, 20, 70, radians(200), radians (340));
fill(0);
ellipse (215,155,7,14);
ellipse (285,155,7,14);



