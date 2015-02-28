
size(700, 700);
background(66, 133, 254);
noStroke();

//ropa
fill(0, 170, 0);
noStroke();

//pecho
quad(80,330,320,330,320,390,80,390);

//brazo izquierdo
ellipse(80,350,40,40);
quad(70,330,0,440,10,500,110,390);
ellipse(0,470,60,50);
quad(15,460,0,495,100,560,100,530);

//pantalons
fill(25,44,111);
quad(100,590,300,590,300,660,100,660);
quad(100,590,230,590,180,700,100,700);
quad(180,590,300,590,300,700,220,700);

//camiseta
fill(0, 170, 0);
quad(80,390,320,390,300,490,100,490);
quad(100,490,300,490,305,600,95,600);

//brazo derecho
ellipse(320,350,40,40);
quad(327,332,300,395,460,475,460,430);
ellipse(457,451,40,44);
quad(460,430,460,476,520,485,520,455);

//cuello
noStroke();
fill(242, 192, 130);
quad(150,240,250,240,250,330,150,330);
triangle(150,330,250,330,200,380);

//cara
ellipse(200,190,290,260);

//cejas
stroke(0, 0, 0);
fill(0, 0, 0);
triangle(180, 120, 180, 140, 35, 90); 
triangle(220, 120, 220, 140, 365, 90); 

//ojos
noStroke();
fill(255, 255, 255);
arc(120,160,100,90,0.0,3.92);
arc(280,160,100,90,-0.85,3.15);
triangle(83, 128, 170, 160, 130, 180);
triangle(230, 160, 312, 127, 310, 180);


//pupilas
fill(0, 0, 0);
ellipse(130,180,25,32);
ellipse(270,180,25,32);

//boca
stroke(255,0,0);
strokeWeight(2);
fill(255, 255, 255);
quad(100,240,300,240,280,260,120,260);

//tronco
noStroke();
fill(95,52,12);
rect(500, 100, 70, 600);
strokeWeight(3);
stroke(124,68,15);
ellipse(530,320,35,50);
ellipse(530,320,25,35);
fill(124,68,15);
ellipse(530,320,7,20);
ellipse(540,600,9,15);
ellipse(530,693,3,3);
ellipse(530,690,2,3);
ellipse(533,692,3,3);
ellipse(535,696,3,4);

//hojas del arbol
stroke(34,90,5);
fill(52,147,1);
ellipse(540,100,330,350);

//cabell
noStroke();
fill(0,0,0);

//detalls
strokeWeight(2);
stroke(0,140,0);
line(190,400,210,400);
line(190,400,126,331);
line(210,400,278,331);

ellipse(200,450,5,5);
ellipse(200,430,5,5);
ellipse(200,410,5,5);
ellipse(200,470,5,5);
ellipse(200,490,5,5);
ellipse(200,510,5,5);
ellipse(200,530,5,5);
ellipse(200,550,5,5);
ellipse(200,570,5,5);
ellipse(200,390,5,5);

//manos
stroke(0,0,0);
noFill();
arc(110,545,40,60,4.5,8);
arc(295,545,40,60,8,11);
noStroke();
fill(242, 192, 130);
quad(100,525,98,562,120,562,120,525);
quad(550,445,550,482,570,482,570,445);

stroke(0,0,0);
line(550,454,570,454);
line(550,464,570,464);
line(550,474,570,474);

//sol
noStroke();
fill(224,217,66);
ellipse(20,20,100,100);
















