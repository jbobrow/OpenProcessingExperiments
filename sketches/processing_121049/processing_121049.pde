
//Rubens Funke Junior
//15/11/2013
//Campo Largo, Paraná, Brasil.

//plano de fundo
size(500,500);
background(#C1E5F2);        
ellipseMode(CENTER);
rectMode(CENTER);

//calcada
fill(#3D7E40);
quad(0,430,500,430,500,500,0,500);

//muro
fill(#958C80);
rect(0,390,400,115);

//fundo do predio
fill(#C43812);                          
quad(215,320,265,300,335,300,385,320);  
fill(#A5753A);                          
quad(180,320,420,320,420,450,180,450);  
fill(#EFEFEF);  

//porta esquerda
rect(235,425,23,50,20,20,0,0);         
rect(235,425,19,46,20,20,0,0);
line(235,448,235,403);
line(225,430,243,430);
line(225,411,243,411);

//porta direita
rect(365,425,23,50,20,20,0,0);          
rect(365,425,19,46,20,20,0,0);
line(365,448,365,403);
line(355,430,373,430);
line(355,411,373,411);
   
//porta do meio 
rect(300,420,30,60,20,20,0,0);          
rect(300,420,27,57,20,20,0,0);
rect(300,420,24,54,20,20,0,0);
fill(#010201);                     
quad(290,405,310,405,310,447,290,447);


fill(#985826);        
//coluna direita 1
quad(215,390,220,390,220,450,215,450);
//coluna direira 2
quad(250,390,255,390,255,450,250,450);  
//coluna esquerda 1
quad(345,390,350,390,350,450,345,450); 
 //coluna esquerda 2
quad(385,390,380,390,380,450,385,450);   
//coluna meio 2
quad(335,390,325,390,325,450,335,450);  
//coluna meio 1
quad(265,390,275,390,275,450,265,450);

//letreiro
fill(#FFFCFF); 
line(215,330,385,330);
text("Vinicola Famiglia Zanlorenzi",220, 350);
line(215,357,385,357);
text("VINHOS CAMPO LARGO",230,370);
