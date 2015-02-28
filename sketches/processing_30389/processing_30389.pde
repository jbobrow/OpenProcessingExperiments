
int x= 250;                              //variaveis 
int y= 270;

size(500,500);                            // tamanho da janela
smooth(); 
background(79,182,206);                   //cor de fundo
   
ellipseMode(CENTER);
rectMode(CENTER);
noStroke();

  fill(255,255,255);                              //<<posicionamento de cada componente>>
  ellipse(100,100,100,50);
  ellipse(150,70,100,50);
  ellipse(420,70,120,60);
  ellipse(350,100,150,70);
     
  fill(20,250,40);
  rect(250,450,500,150);
  fill(137,48,33); 
  ellipse(x+80,y-100,80,80);//orelha
  ellipse(x-80,y-100,80,80);//orelha
  fill(255,157,234); //pink
  ellipse(x+80,y-100,40,40); //dentro da orelha
  ellipse(x-80,y-100,40,40); //dentro da orelha
  fill(157,48,33);
  ellipse(x,y-20,200,200);//cabeça
  fill(137,48,33);
  ellipse(x,y+20,120,70); //a volta do nariz
  fill(257,257,257); 
  ellipse(x-40,y-60,40,40); //olhos
  ellipse(x+40,y-60,40,40); //olhos
  fill(0,0,0); //black
  ellipse(x-40,y-60,15,15); //olhos interior
  ellipse(x+40,y-60,15,15); //olhos interior
  stroke(0,0,0);
  
  fill(0); 
  noStroke();
  ellipse(x,y,35,20); //nariz
  fill(157,48,33);
  rect(250,375,30,100); //pecoço
  ellipse(250,450,100,190); //corpo
  fill(255,157,234); //pink
  ellipse(250,450,70,100); //dentro do corpo
  stroke(137,48,33);
  strokeWeight(7);
  line(210,400,130,350); //braço
  line(290,400,360,350);//braço
  noStroke();
  strokeWeight(0);
  fill(157,48,33);
  ellipse(130,350,40,40); //maos
  ellipse(360,350,40,40);//maos
  fill(255,157,234);
  ellipse(130,350,20,20);//dentro das maos
  ellipse(360,350,20,20);//dentro das maos
  noFill();
  stroke(0);
  arc(250,280,70,70,0, PI/1);
  line(250,280,250,315);
  noStroke();
   
  fill(209,211,212); 
  ellipse(60,70,40,20); //asas
  ellipse(140,70,40,20); //asas
  fill(245,345,40); 
  stroke(0,0,0);
  line(90,60,85,25);
  line(110,60,115,25);
  noStroke();
  ellipse(100,70,50,50); //corpo da abelha
  fill(0,0,0);
  ellipse(90,60,10,10); //olhos
  ellipse(110,60,10,10); //olhos
  ellipse(85,25,10,10);
  ellipse(115,25,10,10);
  stroke(0,0,0);
  noFill();
  arc(100,70,30,30,0,PI/1);
  noStroke();
  
   

 



