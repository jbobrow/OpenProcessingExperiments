
size(1020,710);
background(24,199,199);
//*ESTRUTURA PRINCIPAL//*
fill(160);
stroke(160);
triangle(255,355,225,455,255,455); //* triangulo esquerdo//*
rect(255,355,500,100); //*parte central//*
triangle(755,355,755,455,795,455); //*triangulo direito//*
//*PORTAL//*
fill(180);
stroke(180);
rect(500,400,40,60);
rect(480,400,40,60);
rect(480,385,17,22);
rect(523,385,17,22);
stroke(0);
fill(0,100,50);
ellipse(510,455,30,90); 
//*GRAMADO//*
stroke(37,234,12);
fill(37,234,12);
rect(0,455,1200,500);
//*ESTRUTURA BRANCA//*
fill(255);
stroke(255);
rect(245,305,515,50);
//*FAROL ESTRUTURA//*
rect(530,205,40,80); 
stroke(0);
fill(0);
ellipse(550,161,5,5);
fill(255);
//JANELAS//*
strokeWeight (3);
stroke(228,210,126); //*cor batente//*
fill(24,58,48); 
rect(340,323,18,22); 
rect(400,323,18,22); 
rect(455,323,18,22); 
rect(500,323,18,22); 
rect(570,323,18,22); 
rect(600,323,18,22); 
rect(655,323,18,22); 
//*FAROL DETALHES//*
fill(0);
stroke(0);
rect(530,265,40,45); //*listra preta//*
rect(535,164,30,40);
fill(255);
//*JANELAS ESTRUTURA PRINCIPAL//*
fill(155);
stroke(180);
rect(400,400,18,22); //*janela inferior esquerda//*
rect(600,400,18,22);//*janela inferior direita//*
fill(100);
strokeWeight (0);
//*detalhe divisão de estruturas*//
rect(255,355,500,3); 
fill(255);
strokeWeight (3);
//*TELHADO//*
stroke(255, 128, 35);
fill(200, 150, 36);
quad(245,305,760,305,765,310,240,310);
fill(255);
stroke(255);
strokeWeight (1);
fill(255);
//*JANELAS FAROL//*
rect(547,275,5,5); 
rect(547,295,5,5);
stroke(200);
rect(547,230,6,6);
//*GRADES FAROL//*
strokeWeight (2);
fill(245);
stroke(245);
rect(533,190,34,1);
rect(533,167,34,1);
strokeWeight(1);
//*verticais//*
line(540,190,540,167);
line(540,190,540,167);
line(550,190,550,167);
line(560,190,560,167);
line(533,190,533,167);
line(567,190,567,167);
//*horizontais//*
line(533,175,566,175);
line(533,183,566,183);
