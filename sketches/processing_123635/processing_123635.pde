
void setup () {
size (500, 400);
background (#D8C165);
noStroke ();
//tronco
fill (#5F361A);
rect (180,350,30,50);
//presente grande e fita
fill(#EA3450);
rect (320,310,90,90);  
fill(255);
rect (360,310,8,90);
triangle(340,323,340,293,365,310);
triangle(365,310,395,323,395,293);
//presente médio e fita
fill(21,30,50);
rect (385,355,46,46);
fill (#FCF508);
rect (405,355,5,46);
fill (#FCF508);
rect (385,375,46,5);
//presente pequeno e laço
fill (#BAA7E5);
rect (310,370,30,30);
fill (#F08E33);
triangle (315,365,315,375,325,369);
triangle (325,369,335,365,335,375);
rect(323,370,4,30);

//pinheirinho folhas
fill (#255D23);
triangle (50,350,350,350,200,200);
triangle (80,300,320,300,200,180);
triangle (110,250,290,250,200,150);
triangle (140,200,260,200,200,100); 

//bolinhas
fill (255,0,0);
ellipse (140,325,15,15);
fill (255,0,0);
ellipse (275,335,15,15);
fill (255,0,0);
ellipse (52,350,15,15);
fill (255,0,0);
ellipse (82,300,15,15);
fill (255,0,0);
ellipse (112,250,15,15);
fill (255,0,0);
ellipse (142,200,15,15);
fill (255,0,0);
ellipse (318,300,15,15);
fill (255,0,0);
ellipse (288,250,15,15);
fill (255,0,0);
ellipse (258,200,15,15);
fill (255,0,0);
ellipse (348,350,15,15);
fill (255,0,0);
ellipse (200,275,15,15);
fill(255,0,0);
ellipse (165,236,15,15);
fill(255,0,0);
ellipse (185,150,15,15);
fill(255,0,0);
ellipse (220,175,15,15);
fill(255,0,0);
ellipse (122,280,15,15);
fill(255,0,0);
ellipse (260,280,15,15);
fill(255,0,0);
ellipse (258,237,15,15);


//estrela
fill (#FCE429);
triangle(200,109,220,80,180,80);
triangle(200,70,220,100,180,100);

//lareira
fill(#674611);
rect (360,150,140,110);
rect(430,0,46,150);
fill(#A57C39);
rect(390,200,92,60);

fill(#D33122);
noStroke();
bezier(436,260,426,250,416,240,436,220);
bezier(436,260,446,250,456,240,436,220);
noStroke();
fill(#F58616);
bezier(436,260,431,255,426,250,436,240);
bezier(436,260,441,255,446,250,436,240);


for (int a=0; a<210; a= a+10) {
  ellipse (100+a, 300, 5, 5);
  fill(232,223,35);
}

for (int a=30; a<180; a= a+10) {
  ellipse (100+a, 250, 5, 5);
  fill(232,223,35);
}
for (int a=55; a<150; a= a+10) {
  ellipse (100+a, 200, 5, 5);
  fill(232,223,35);
}}


void mouseMoved() {
  loadPixels();
  for (int i = 0; i < width*height; i++) {
    if (pixels[i] == #34EAD0) {  
      pixels[i] = #E8DF23;  
      continue;  
    }
    if (pixels[i] == #E8DF23) pixels[i] = #34EAD0; 
  }
  updatePixels();
}

//efeitolareira
void draw() {
}

void mousePressed() {
  loadPixels();
  for (int i = 0; i < width*height; i++) {
    if (pixels[i] == #D33122) {  
      pixels[i] = #F5C502;  
      continue;  
    }
    if (pixels[i] == #D33122) pixels[i] = #F5C502; 
  }
  updatePixels();
}

