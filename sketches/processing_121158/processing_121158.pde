
//Felipe Luiz Pontes de Andrade
//18/11/2013
//São Paulo-SP - Brasil


size(1000,700);
//Fundo
background(58,80,229);
noStroke();
fill(50,80,170);
rect(0,0,1000,100);
fill(50,80,180);
rect(0,100,1000,100);
fill(50,80,190);
rect(0,200,1000,100);
fill(50,80,200);
rect(0,300,1000,100);
fill(50,80,210);
rect(0,400,1000,100);
stroke(0);

//Nuvem e chuva
  fill(100);
  noStroke();
  ellipse(100,50,50,50);
  ellipse(130,50,50,50);
  ellipse(160,50,50,50);
  ellipse(190,50,50,50);
  ellipse(220,50,50,50);
  
  ellipse(320,50,50,50);
  ellipse(350,50,50,50);
  ellipse(380,50,50,50);
  ellipse(410,50,50,50);
  ellipse(440,50,50,50);
  
  ellipse(540,50,50,50);
  ellipse(570,50,50,50);
  ellipse(600,50,50,50);
  ellipse(630,50,50,50);
  ellipse(660,50,50,50);
  
  ellipse(760,50,50,50);
  ellipse(790,50,50,50);
  ellipse(820,50,50,50);
  ellipse(850,50,50,50);
  ellipse(880,50,50,50);  
  
  stroke(255,255,255);
  line(-400,100,100,700);
  line(-300,100,200,700);
  line(-200,100,300,700);  
  line(-100,100,400,700);  
  line(0,100,500,700); 
  line(100,100,600,700);  
  line(200,100,700,700); 
  line(300,100,800,700);
  line(400,100,900,700);
  line(500,100,1000,700);
  line(600,100,1100,700);
  line(700,100,1200,700);
  line(800,100,1300,700);
  line(900,100,1400,700);
  
  noStroke();
  fill(50,80,210);
  rect(0,425,1000,50);
  fill(50,80,200);
  rect(0,325,1000,50);
  fill(50,80,190);
  rect(0,225,1000,50);
  fill(50,80,180);
  rect(0,125,1000,50);
  
  
//EdifÃ­cio (esquerda do ItaÃº)
stroke(0);
fill(200);
rect(0,400,100,300);
  fill(255,255,255);
  rect(20,420,20,20);                  //Janela com cortina
    line(30,420,30,440);
    line(20,430,40,430);
    noFill();
    arc(20,420,10,40,0,HALF_PI);
    arc(40,420,10,40,HALF_PI, PI);
    fill(255,255,255);
  rect(60,420,20,20);
    line(70,420,70,440);
    line(60,430,80,430);
  rect(20,460,20,20);
    line(30,460,30,480);
    line(20,470,40,470);
  rect(60,460,20,20);
    line(70,460,70,480);
    line(60,470,80,470);
  rect(20,500,20,20);
    line(30,500,30,520);
    line(20,510,40,510);  
  rect(60,500,20,20);
    line(70,500,70,520);
    line(60,510,80,510);  
  rect(20,540,20,20);
    line(30,540,30,560);
    line(20,550,40,550);
  rect(60,540,20,20);                  //janela com cortina
    line(70,540,70,560);
    line(60,550,80,550);  
    noFill();
    arc(60,540,10,40,0,HALF_PI);
    arc(80,540,10,40,HALF_PI, PI);
    fill(255,255,255);
  rect(20,580,20,20);
    line(30,580,30,600);
    line(20,590,40,590);  
  rect(60,580,20,20);
    line(70,580,70,600);
    line(60,590,80,590);  
  rect(20,620,20,20);
    line(30,620,30,640);
    line(20,630,40,630); 
  rect(60,620,20,20);
    line(70,620,70,640);
    line(60,630,80,630); 
  rect(35,670,30,40,10);
    line(50,670,50,700);
    ellipse(44,685,3,3);
    ellipse(56,685,3,3);

//Itau
fill(247,121,17);          //Laranja
rect(100,550,400,250,10);         
  //Simbolo do itau
  fill(0,68,247);          //Azul
  rect(275,560,52,52,10);
  fill(247,227,0);                        
  textSize(25);
  text("ItaÃº",280,608);
  fill(255,255,255);
  rect(290,670,20,50);
    rect(292,672,16,50);
    fill(0);
    rect(292,686,16,2);
    fill(247,121,17);
    ellipse(306,687,4,4);
  //Garagens  
  fill(0);
  stroke(255,255,255);
  rect(120,660,80,40);                  //Entrada
    line(125,660,125,700);
    line(130,660,130,700);
    line(135,660,135,700);
    line(140,660,140,700);
    line(145,660,145,700);
    line(150,660,150,700);
    line(155,660,155,700);
    line(160,660,160,700);
    line(165,660,165,700);
    line(170,660,170,700);
    line(175,660,175,700);
    line(180,660,180,700);
    line(185,660,185,700);
    line(190,660,190,700);
    line(195,660,195,700);
    line(200,660,200,700);
    line(120,695,200,695);
    textSize(10);
    text("Entrada",140,650);
  rect(400,660,80,40);                   //SaÃ­da
    line(405,660,400,695);
    line(410,660,405,695);
    line(415,660,410,695);
    line(420,660,415,695);
    line(425,660,420,695);
    line(430,660,425,695);
    line(435,660,430,695);
    line(440,660,435,695);
    line(445,660,440,695);
    line(450,660,445,695);
    line(455,660,450,695);
    line(460,660,455,695);
    line(465,660,460,695);
    line(470,660,465,695);
    line(475,660,470,695);
    line(480,660,475,695);
    line(400,690,475,690);
    textSize(10);
    text("SaÃ­da",430,650);
    fill(255,255,255);
  //Estrelas do Itau
  line(285,620,285,618);        //1
  line(285,620,287,619);                
  line(285,620,283,619);                
  line(285,620,286,621);                
  line(285,620,284,621);
  line(293,620,293,618);        //2
  line(293,620,295,619);        
  line(293,620,291,619);        
  line(293,620,294,621);        
  line(293,620,292,621);
  line(301,620,301,618);        //3
  line(301,620,303,619);        
  line(301,620,299,619);        
  line(301,620,302,621);        
  line(301,620,300,621);
  line(309,620,309,618);        //4
  line(309,620,311,619);        
  line(309,620,307,619);        
  line(309,620,310,621);        
  line(309,620,308,621);
  line(317,620,317,618);        //5
  line(317,620,319,619);        
  line(317,620,315,619);        
  line(317,620,318,621);        
  line(317,620,316,621);  
  
  //EdifÃ­cio (direita do banco)
  fill(200);
  stroke(0);
  rect(500,300,200,400);
    fill(255,255,255);
    rect(520,600,60,30);            //janelas com parapeito.
      line(520,620,580,620);
        line(525,620,525,630);
        line(530,620,530,630);
        line(535,620,535,630);
        line(540,620,540,630);
        line(545,620,545,630);
        line(550,620,550,630);
        line(555,620,555,630);
        line(560,620,560,630);
        line(565,620,565,630);
        line(570,620,570,630);
        line(575,620,575,630);
    rect(620,600,60,30);
      line(620,620,680,620);
        line(625,620,625,630);
        line(630,620,630,630);
        line(635,620,635,630);
        line(640,620,640,630);
        line(645,620,645,630);
        line(650,620,650,630);
        line(655,620,655,630);
        line(660,620,660,630);
        line(665,620,665,630);
        line(670,620,670,630);
        line(675,620,675,630);
    rect(520,545,60,30);
      line(520,565,580,565);
        line(525,565,525,575);
        line(530,565,530,575);
        line(535,565,535,575);
        line(540,565,540,575);
        line(545,565,545,575);
        line(550,565,550,575);
        line(555,565,555,575);
        line(560,565,560,575);
        line(565,565,565,575);
        line(570,565,570,575);
        line(575,565,575,575);
    rect(620,545,60,30);
      line(620,565,680,565);
        line(625,565,625,575);
        line(630,565,630,575);
        line(635,565,635,575);
        line(640,565,640,575);
        line(645,565,645,575);
        line(650,565,650,575);
        line(655,565,655,575);
        line(660,565,660,575);
        line(665,565,665,575);
        line(670,565,670,575);
        line(675,565,675,575);
    rect(520,490,60,30);
      line(520,510,580,510);
        line(525,510,525,520);
        line(530,510,530,520);
        line(535,510,535,520);
        line(540,510,540,520);
        line(545,510,545,520);
        line(550,510,550,520);
        line(555,510,555,520);
        line(560,510,560,520);
        line(565,510,565,520);
        line(570,510,570,520);
        line(575,510,575,520);
    rect(620,490,60,30);
      line(620,510,680,510);
        line(625,510,625,520);
        line(630,510,630,520);
        line(635,510,635,520);
        line(640,510,640,520);
        line(645,510,645,520);
        line(650,510,650,520);
        line(655,510,655,520);
        line(660,510,660,520);
        line(665,510,665,520);
        line(670,510,670,520);
        line(675,510,675,520);
    rect(520,435,60,30);
      line(520,455,580,455);
        line(525,455,525,465);
        line(530,455,530,465);
        line(535,455,535,465);
        line(540,455,540,465);
        line(545,455,545,465);
        line(550,455,550,465);
        line(555,455,555,465);
        line(560,455,560,465);
        line(565,455,565,465);
        line(570,455,570,465);
        line(575,455,575,465);
    rect(620,435,60,30);
        ellipse(655,443,4,4);                    //Homem
        line(655,445,655,460);
        line(655,460,652,465);
        line(655,460,658,465);
        noFill();
        arc(655,457,10,20,PI+HALF_PI,TWO_PI);
        arc(655,457,30,20,PI+QUARTER_PI,PI+HALF_PI);
        fill(255,255,255);
        ellipse(648,443,4,4);                    //Mulher
        line(648,445,648,460);
        line(648,460,645,465);
        line(648,460,651,465);
        noFill();
        arc(652,445,3,10,PI+QUARTER_PI,TWO_PI);   //Cabelo da mulher
        arc(645,445,3,10,PI,TWO_PI-QUARTER_PI);
        arc(648,457,10,20,PI+HALF_PI,TWO_PI);
        arc(648,457,10,20,PI,PI+HALF_PI);
       fill(255,255,255);
      line(620,455,680,455);
        line(625,455,625,465);
        line(630,455,630,465);
        line(635,455,635,465);
        line(640,455,640,465);
        line(645,455,645,465);
        line(650,455,650,465);
        line(655,455,655,465);
        line(660,455,660,465);
        line(665,455,665,465);
        line(670,455,670,465);
        line(675,455,675,465);
    rect(520,380,60,30);
      line(520,400,580,400);
        line(525,400,525,410);
        line(530,400,530,410);
        line(535,400,535,410);
        line(540,400,540,410);
        line(545,400,545,410);
        line(550,400,550,410);
        line(555,400,555,410);
        line(560,400,560,410);
        line(565,400,565,410);
        line(570,400,570,410);
        line(575,400,575,410);
    rect(620,380,60,30);
      line(620,400,680,400);
        line(625,400,625,410);
        line(630,400,630,410);
        line(635,400,635,410);
        line(640,400,640,410);
        line(645,400,645,410);
        line(650,400,650,410);
        line(655,400,655,410);
        line(660,400,660,410);
        line(665,400,665,410);
        line(670,400,670,410);
        line(675,400,675,410);
    rect(520,325,60,30);
        ellipse(550,337,4,4);
        line(550,339,550,350);
        line(550,350,547,355);
        line(550,350,553,355);
        noFill();
        arc(550,331,15,20,0,HALF_PI);
        arc(550,331,15,20,HALF_PI,2.9);
        fill(255,255,255);
      line(520,345,580,345); 
        line(525,345,525,355);
        line(530,345,530,355);
        line(535,345,535,355);
        line(540,345,540,355);
        line(545,345,545,355);
        line(550,345,550,355);
        line(555,345,555,355);
        line(560,345,560,355);
        line(565,345,565,355);
        line(570,345,570,355);
        line(575,345,575,355);
    rect(620,325,60,30);
      line(620,345,680,345);
        line(625,345,625,355);
        line(630,345,630,355);
        line(635,345,635,355);
        line(640,345,640,355);
        line(645,345,645,355);
        line(650,345,650,355);
        line(655,345,655,355);
        line(660,345,660,355);
        line(665,345,665,355);
        line(670,345,670,355);
        line(675,345,675,355);
    rect(587.5,670,20,30);
    //portÃ£o
      line(500,660,700,660);
      line(500,695,570,695);
      line(625,695,700,695);
        ellipse(571,690,2,2);
        ellipse(571,675,2,2);
        ellipse(624,690,2,2);
        ellipse(624,675,2,2);
      noFill();
        rect(572,672,51,28);
        line(572,695,623,695);
        line(572,690,623,690);
        line(572,685,623,685);
        line(572,680,623,680);
        line(572,675,623,675);
        line(597.5,700,597.5,672);
        rect(602,679,2,12);
        rect(592,679,2,12);
      rect(505,660,5,40);
      rect(515,660,5,40);  
      rect(525,660,5,40); 
      rect(535,660,5,40); 
      rect(545,660,5,40); 
      rect(555,660,5,40); 
      rect(565,660,5,40); 
      rect(575,660,5,10); 
      rect(585,660,5,10); 
      rect(595,660,5,10);
      rect(605,660,5,10); 
      rect(615,660,5,10); 
      line(570,670,625,670);
      rect(625,660,5,40);
      rect(635,660,5,40); 
      rect(645,660,5,40);
      rect(655,660,5,40);
      rect(665,660,5,40);
      rect(675,660,5,40);
      rect(685,660,5,40);
      rect(695,660,5,40);
      
  //Industria
  fill(120);
  rect(700,500,300,200);
  rect(835,300,30,200);
  stroke(120);
  line(835,500,865,500);
  stroke(0);
  ellipse(850,300,30,20);
  fill(0);
  ellipse(830,280,30,15);
  ellipse(820,270,30,15);
  ellipse(810,260,30,15);
  ellipse(800,250,30,15);
    textSize(30);
    text("Fabrica",800,550);
  fill(255,255,255);  
  rect(825,660,50,50,20);
  line(850,660,850,700);
  ellipse(845,680,2,2);
  ellipse(855,680,2,2);
