
//Autor: Calleb Malinoski de Cecco, data de inicio 25/4/14, término em 30/4/14;
//A inspiração do código em si foi a música inteira. Há referências da música em toda a parte, a começar pela ideia de se fazer uma pagina de um web-site.
//A idéia principal é a representação da jangada, como é a metáfora que o autor da música usa para navegar na internet. 
//Há bastante referências as localidades citadas na música, principalmente na vela da jangada que possui as cores da bandeira do Gabão. Todas as outras localidades são representadas com texto ou com as cores de suas bandeiras em alguma parte do site.
//Em relação aos termos técnicos, foi usado na descrição da jangada e na própria ideia de se fazer o web-site, de venda de barcos, já que se trata de uma jangada.

size(700,500);
background(0);

//Navegador
fill(240, 235, 235);
stroke(168, 150, 150);
rect(10,30,680,670,3); //tela inteira do navegador
rect(650,20,40,10,30,30,7,7); //botões, fechar, minimizar, maximizar
rect(10,30,160,20,3);  //primeira aba
rect(10,50,680,20,3); //barra de endereços

stroke(133, 118, 118);
fill(199, 191, 191);
rect(156,30,220,20,3); //segunda aba

fill(0, 0, 0);
text("<-  ->  [http://barcosnomeusite.com.br/home/barcos/antigos/jangada/]                                                                                               ≡", 12, 66);
text("Barcos Gil - Oriki              x", 12,46);
text("Taipé Viagens/ Calcuta - Helsinque     x", 160,46);

fill(0);
textSize(8);
text("__  □  X", 655,28);

//fundo do site
stroke(66, 12, 12);
fill(255, 116, 41);
rect(10,70,680,620,5);

//jangada.
fill(0, 0, 0);
rect(220,150,230,200,15); //foto da jangada
fill(48, 42, 212);
rect(220,266,230,84,0,0,15,15);  //retangulo do mar
fill(138, 60, 60);
stroke(0);
rect(260,260,150,10,7); //toras
rect(258,264,154,10,90);
rect(305,160,5,110,90); //mastro
rect(261,268,150,10,80);
rect(260,272,153,10,60);
rect(263,276,151,10,90);
rect(268,280,145,10,6);
fill(20, 250, 8);
triangle(310,160,310,230,376,230);
fill(255, 242, 0);
triangle(310,175,310,230,361,230);
fill(0, 94, 255);
triangle(310,190,310,230,346,230);
fill(255,255,255);
point(270,230);
ellipse(270,190,2,2);
ellipse(263,218,2,2);
ellipse(381,222,2,2);
ellipse(392,170,15,15); //lua
ellipse(282,234,2,2);
ellipse(420,175,2,2);
ellipse(402,196,2,2);

//barras laterais
fill(189, 155, 155);
stroke(58, 222, 17);
rect(15,130,90,15,15);
rect(15,150,90,15,15);
rect(15,170,90,15,15);
rect(15,190,90,15,15);
rect(15,210,90,15,15);
rect(15,230,90,15,15);
rect(15,250,90,15,15);
rect(15,270,90,15,15);
rect(15,290,90,17,15);

fill(49, 29, 204);
textSize(10);
text("HOME", 20,143);
text("MEMBROS", 20,163);
text("MODELOS", 20,183);
text("ANUNCIE", 20,203);
text("LOCAÇÃO", 20,223);
text("HISTORIA", 20,243);
text("MATÉRIAS", 20,263);
text("CONTATO", 20, 283);
text("LOCALIZAÇÃO", 20,303);

//logo
stroke(102, 140, 32);
fill(224, 224, 150);
rect(15,80,140,40,6);

fill(255, 0, 0);
text("BARCOS GIL-ORIKI", 17,92);
text("O melhor site de barcos", 17,105);
text("De Milão ao Japão!!!!", 17,118);

//descrição da jangada
stroke(168, 150, 150);
fill(224, 224, 150);
rect(210,355,250,70);

fill(0);
stroke(168, 150, 150);
textSize(8.4);
text("Descrição: -Modelo: Jangada Hot-Link GT580 Ano 2002", 215, 370);
text("-Capacidade: 250GB;", 268,385);
text("-Velocidade Máxima: 10MBps;", 268,400);
text("-Valor: A negociar com o comprador.", 268,415);

fill(224, 224, 150);
rect(235,120,200,15,15);

fill(0);
textSize(10);
text("JANGADA HOT-LINK GT580 ANO 2002", 243,133);

//informações embaixo da pagina
fill(128, 84, 184);
rect(15,460,670,37,15);
fill(0);
textSize(8);
text("Barcos Gil-Oriki © Copyright 1997-2024 Associação Brasileira de Barcos S.A", 200,470);
text("Barcos Wilson               Classificados               Anuncie Aqui               Sites Relacionados               Denuncie", 150,480);  
textSize(7);
text("©2014 Barcos Gil-Oriki e demais são marcas registradas da ASB S.A. Estes termos e todos os materiais relacionados imagens, reportagens, respeitam os direitos autorais da © ASB S.A.", 40,490);

//login area de membros
fill(224, 224, 150);
stroke(168, 150, 150);
rect(540,78,125,25,15);

fill(255);
stroke(168, 150, 150);
rect(600,80,60,10,15);
rect(600,90,60,10,15);

fill(0);
text("Login/Usuário", 550,87);
text("Senha", 570,97);

//propagandas laterais
fill(223, 218, 240);
stroke(223, 218, 240);
rect(550,150,125,70,5); //propaganda 1
textSize(11);
fill(255,0,0);
text("PARABENS!", 580,160);
textSize(10);
text("VOCE GANHOU", 575,170);
text("UM DISKMAN POR SER", 559,182);
text("O VISITANTE 1MILHÃO", 558,194);
text("CLIQUE AQUI PARA", 566,206);
text("SABER COMO!!!!!", 574,218);

fill(255);
stroke(0);
rect(550,230,125,70,5); //propaganda 2
fill(0);
text("Colecionador de floppys!", 553,243);
text("     !!Compro/Troco!!", 553,253);
text("     -Disquetes novos",553,263);
text("     -Disquetes usados", 553,273);
text("   Tel-008862-96932661",553,283);




