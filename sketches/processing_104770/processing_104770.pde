
color c = color(255);
float i = 100;
float x = 30;
float y = 150;
float speed = 1;

void setup() {
  size(1020,600);
  }
void draw() {
  background(80);
    move();
display();

//*LUA//*
stroke(250);
fill(250);
ellipse(900,200,140,140);
stroke(243);
fill(243);
ellipse(915,240,30,30);
ellipse(870,220,20,20);

//*CASA//*
stroke(0);
fill(128,67,0);
rect(360,395,400,15);
rect(360,380,400,15);
rect(360,365,400,15);
rect(360,350,400,15);
rect(360,335,400,15);
rect(360,425,400,15);
rect(360,410,400,15);
triangle(330,335,560,130,790,335);
line(350,320,773,320);
line(360,305,760,305);
line(380,290,745,290);
line(400,275,725,275);
line(410,260,710,260);
line(425,245,690,245);
line(445,230,675,230);
line(465,215,655,215);
line(478,200,645,200);
line(495,185,625,185);
line(512,170,605,170);
line(530,155,590,155);
line(550,140,575,140);

//*TELHADO//*
stroke(245);
fill(245);
quad(560,130,560,115,805,340,790,340);
quad(560,130,560,115,315,340,330,340);

//*JANELA//*
fill(128,67,0);
strokeWeight(8);
rect(620,330,70,70);
line(655,330,655,400);
strokeWeight(4);
line(620,353,690,353);
line(620,376,690,376);
strokeWeight(11);
rect(500,230,120,50);
line(562,230,562,280);
strokeWeight(1);

//*chao//*
fill(240);
stroke(240);
line(0,435,1020,405);
quad(0,435,1020,405,1020,710,0,710);

//*BONECO//*
stroke(255);
fill(255);
ellipse(560,355,80,80);
ellipse(560,460,140,140);
stroke(0);
fill(0);

//*CACHECOL//*
stroke(255,0,0);
fill(255,0,0);
quad(540,385,580,385,590,398,530,398);
stroke(0);
fill(0);

for (int i = 387; i < 398; i += 3) {
  if (i < 10) {
    line(543, i, 583, i);
  } else if (i < 45) {
    line(540, i, 586, i);
  } else {
    line(537, i, 589, i);
  }
}

//*ROSTO BONECO//*
ellipse(546,345,9,17);
ellipse(575,345,9,17);
stroke(255,127,39);
fill(255,127,39);
ellipse(560,360,5,5);
fill(255);
stroke(0);
arc(560,370, 25, 25, 0, PI, OPEN);

//*BRAÇO BONECO//*
stroke(185,122,67);
strokeWeight (5);
line(612,450,662,400);
line(645,415,662,415);
line(500,450,440,400);
line(455,415,440,417);

//*CARTOLA BONECO//*
strokeWeight(1);
stroke(0);
fill(0);
rect(518,305,85,15);
rect(533,255,57,50);

//*BOTOES BONECO//*
stroke(0);
fill(0);
ellipse(560,430,9,9);
ellipse(560,455,9,9);
ellipse(560,480,9,9);

//*PINHEIROS//*
//*tronco//*
stroke(81,40,0);
fill(81,40,0);
rect(47,450,15,80);
//*folhas//*
stroke(0,64,0);
fill(0,64,0);
triangle(55,325,75,365,35,365);
triangle(55,355,85,395,25,395);
triangle(55,385,95,425,15,425);
triangle(55,415,105,455,5,455);
//*tronco//*
stroke(81,40,0);
fill(81,40,0);
rect(195,450,20,80);
//*folhas//*
stroke(0,64,0);
fill(0,64,0);
triangle(200,255,235,315,165,315);
triangle(200,295,250,355,150,355);
triangle(205,325,265,405,135,405);
triangle(210,355,285,455,120,455);
stroke(245);
fill(245);
triangle(55,325,65,340,45,340);
triangle(200,255,215,275,185,275);

//*CHAO//*
stroke(245);
fill(245);
line(0,510,1020,532);
quad(0,510,1020,532,1020,710,0,710);

//*NEVE//*
}
void move() {
  y = y + speed ;
  if (y > width) {
    y = 0;
  }
  x = x + speed;
  if (x > width) {
    x= 0;
}
i = i + speed;
  if (i > width) {
    i= 0;
}

}
void display() {
 stroke(196);
 
 fill(c);
  
  ellipse(10,y,10,10);
  ellipse(20,i,10,10);
  ellipse(40,x,10,10);
  ellipse(60,i,10,10);
  ellipse(80,y,10,10);
   ellipse(100,x,10,10);
  ellipse(120,i,10,10);
   ellipse(140,x,10,10);
 ellipse(160,y,10,10);
  ellipse(180,x,10,10);
  ellipse(200,i,10,10);
  ellipse(220,x,10,10);
  ellipse(240,y,10,10);
  ellipse(260,x,10,10);
  ellipse(280,i,10,10);
  ellipse(300,x,10,10);
  ellipse(320,y,10,10);
  ellipse(340,i,10,10);
ellipse(360,y,10,10);
   ellipse(380,x,10,10);
ellipse(400,i,10,10);
  ellipse(420,y,10,10);
 ellipse(440,x,10,10);
   ellipse(460,i,10,10);
   ellipse(480,y,10,10);
  ellipse(500,x,10,10);
  ellipse(520,i,10,10);
  ellipse(540,y,10,10);
  ellipse(560,x,10,10);
  ellipse(580,i,10,10);
  ellipse(600,y,10,10);
  ellipse(620,x,10,10);
  ellipse(640,i,10,10);
  ellipse(680,y,10,10);
  ellipse(700,x,10,10);
  ellipse(720,i,10,10);
  ellipse(740,y,10,10);
  ellipse(780,x,10,10);
  ellipse(800,i,10,10);
  ellipse(820,y,10,10);
  ellipse(840,x,10,10);
  ellipse(860,i,10,10);
  ellipse(880,y,10,10);
  ellipse(900,x,10,10);
  ellipse(920,i,10,10);
  ellipse(940,y,10,10);
ellipse(960,x,10,10);
  ellipse(980,i,10,10);
  ellipse(1000,x,10,10);
  ellipse(1020,y,10,10);
    
}
