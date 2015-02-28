
//Luyz Renó Martins
//Itajubá MG

size(600,600);
background(102,161,209);        //ceu azul
ellipseMode(CENTER);
rectMode(CENTER);

//ceu
fill(#E0D7D7,35);
noStroke();
ellipse(300,300,670,330);
ellipse(300,300,720,380);
ellipse(300,300,770,430);
ellipse(300,300,820,480);
ellipse(300,300,870,530);

//cenario
fill(#A8AE8A);
quad(0,400,600,400,600,600,0,600);       //fundo
fill(#202735);
quad(50,600,550,600,380,490,220,490);    //rua
  stroke(#767D8B);
  strokeWeight(4);
  //line(300,510,300,530);
  //line(300,550,300,575);
  //line(300,595,300,600);
  strokeWeight(1);
  stroke(0);


//escada
fill(#D1D0CB);         //cinza claro
quad(400,450,200,450,200,490,400,490);    //escada
quad(400,450,200,450,200,485,400,485);
quad(420,450,180,450,180,480,420,480);
quad(420,450,180,450,180,475,420,475);
quad(420,450,180,450,180,470,420,470);
quad(420,450,180,450,180,465,420,465);
quad(420,450,180,450,180,460,420,460);
quad(420,450,180,450,180,455,420,455);
quad(180,450,180,480,220,500,220,470);    //corremao
quad(420,450,420,480,380,500,380,470);    //corremao

//fundo igreja
fill(#9D9D9D);
quad(150,350,150,445,450,445,450,350);
  quad(150,350,150,358,450,358,450,350);
  quad(150,350,150,356,450,356,450,350);
  quad(150,350,150,354,450,354,450,350);
  quad(150,350,150,352,450,352,450,350);

//base igreja
fill(#1A1517);                          //preto fundo
quad(215,320,265,300,335,300,385,320);  //trapezio fundo
fill(#D1D0CB);                          //cinza claro
quad(180,320,420,320,420,450,180,450);  //retangulo base
fill(#EFEFEF);                          //branco
rect(235,360,12,30,15,15,0,0);          //janela esquerda 
rect(365,360,12,30,15,15,0,0);          //janela direita
rect(235,425,23,50,20,20,0,0);          //porta esquerda
    rect(235,425,19,46,20,20,0,0);
    line(235,448,235,403);
    line(225,430,243,430);
    line(225,411,243,411);
rect(365,425,23,50,20,20,0,0);          //porta direita
    rect(365,425,19,46,20,20,0,0);
    line(365,448,365,403);
    line(355,430,373,430);
    line(355,411,373,411);
rect(300,420,30,60,20,20,0,0);          //porta principal
    rect(300,420,27,57,20,20,0,0); 
    rect(300,420,24,54,20,20,0,0); 
     fill(#010201);                     //preto porta
    quad(290,405,310,405,310,447,290,447); 
fill(#555A7A); //azul   
ellipse(300,360,20,20);                 //vitral em cima da porta
    line(300,350,295,368);
    line(300,350,305,368);
    line(295,368,305,368);
    ellipse(300,357,3,3);
    line(298,359,298,368);
    line(302,359,302,368);
fill(#B2B3B5);                              //cinza escuro
quad(215,320,220,320,220,450,215,450);      //coluna direita 1
quad(250,320,255,320,255,450,250,450);      //coluna direira 2
quad(345,320,350,320,350,450,345,450);      //coluna esquerda 1
quad(385,320,380,320,380,450,385,450);      //coluna esquerda 2
quad(335,320,325,320,325,450,335,450);      //coluna meio 2
quad(265,320,275,320,275,450,265,450);      //coluna meio 1

//torre esquerda
fill(#D1D0CB); //cinza claro
quad(255,320,215,320,215,230,255,230);  //base torre
triangle(215,230,255,230,235,190);      //topo torre
line(235,190,235,180);          //cruz
line(232,183,238,183);          //cruz
rect(235,275,8,33,15,15,0,0);           //janela torre esquerda              
    line(231,261,238,261); 
    line(231,263,238,263); 
    line(231,265,238,265); 
    line(231,267,238,267); 
    line(231,269,238,269); 
    line(231,271,238,271); 
    line(231,273,238,273); 
    line(231,275,238,275); 
    line(231,277,238,277); 
    line(231,279,238,279); 
    line(231,281,238,281); 
    line(231,283,238,283); 
    line(231,285,238,285); 
    line(231,287,238,287); 
    line(231,289,238,289); 
    line(231,291,238,291); 
    
//torre meio
line(300,80,300,110);                   //cruz topo
   line(292,90,308,90);
triangle(275,150,325,150,300,110);      //triangulo topo torre meio
quad(275,150,325,150,325,230,275,325);
line(275,190,300,180);
line(325,190,300,180);
fill(#706E6B);                    //cinza escuro
quad(265,240,275,230,325,230,335,240);  //trapezio no meio da torre
fill(#EDEDED);                    //branco
ellipse(300,192,13,13);                 //relogio topo
    line(300,192,300,187);
    line(300,192,302,190);
    point(300,196);
    point(304,192);
    point(300,188);
    point(296,192);
fill(#D1D0CB);                           //cinza claro
quad(265,240,335,240,335,320,265,320);  //base torre do meio
rect(294,214,8,25,15,15,0,0);      //janela alto da torre do meio
    line(290,226,298,226); 
    line(290,224,298,224);
    line(290,222,298,222);
    line(290,220,298,220);
    line(290,218,298,218);        
    line(290,216,298,216);
    line(290,214,298,214);
    line(290,212,298,212);
    line(290,210,298,210);
    line(290,208,298,208);
    line(290,206,298,206);
    line(290,204,298,204);
rect(306,214,8,25,15,15,0,0);      //janela alto da torre do meio
    line(302,226,310,226); 
    line(302,224,310,224);
    line(302,222,310,222);
    line(302,220,310,220);
    line(302,218,310,218);
    line(302,216,310,216);
    line(302,214,310,214);
    line(302,212,310,212);
    line(302,210,310,210);
    line(302,208,310,208);
    line(302,206,310,206);
    line(302,204,310,204);
fill(#EFEFEF);                     //branco
rect(300,268,8,30,15,15,0,0);      //janela torre do meio
rect(315,268,8,30,15,15,0,0);      //janela torre do meio
rect(285,268,8,30,15,15,0,0);      //janela torre do meio
  
//torre direita
fill(#D1D0CB); //cinza claro
quad(345,320,385,320,385,230,345,230);  //base terceira torre
triangle(345,230,385,230,365,190);      //triangulo topo terceira torre
line(365,190,365,180);          //cruz
line(362,183,368,183);          //cruz
rect(365,275,8,33,15,15,0,0);      //janera torre direita
    line(361,261,368,261); 
    line(361,263,368,263); 
    line(361,265,368,265); 
    line(361,267,368,267); 
    line(361,269,368,269); 
    line(361,271,368,271); 
    line(361,273,368,273); 
    line(361,275,368,275); 
    line(361,277,368,277); 
    line(361,279,368,279); 
    line(361,281,368,281); 
    line(361,283,368,283); 
    line(361,285,368,285); 
    line(361,287,368,287); 
    line(361,289,368,289); 
    line(361,291,368,291); 
        
quad(420,320,180,320,180,328,420,328);       //detalhe
  quad(420,320,180,320,180,326,420,326);
  quad(420,320,180,320,180,324,420,324);
  quad(420,320,180,320,180,322,420,322);

line(275,150,325,150);        //detalhe topo
  line(278,145,322,145);
  line(281,140,319,140);
  line(284,135,316,135);
  line(287,130,313,130);
  line(291,125,309,125);
  line(294,120,306,120);
  line(297,115,303,115);
  
line(345,230,385,230);        //detalhe torre direita
  line(347,225,383,225);
  triangle(345,230,385,230,365,220);
  line(350,220,380,220);
  line(353,215,377,215);
  line(356,210,374,210);
  line(358,205,372,205);
  line(360,200,370,200);
  line(363,195,367,195);

line(345-130,230,385-130,230);        //detalhe torre esquerda
  line(347-130,225,383-130,225);
  triangle(215,230,255,230,235,220);
  line(350-130,220,380-130,220);
  line(353-130,215,377-130,215);
  line(356-130,210,374-130,210);
  line(358-130,205,372-130,205);
  line(360-130,200,370-130,200);
  line(363-130,195,367-130,195);


