
/*
Trabalho de Algoritmos I - Profª Silvia
Aluno: Elcio Julionel Junior
Versão:1,0
*/



size(600,450);
background(36, 28, 28);
//JANELA DO SITE
fill(131,139,131);
rect(15,15,570,415);
//BOTOES (FECHAR, MINIMIZAR, MAXIMIZAR)
int tamanhoBotao = 15;
fill(255,0,0);
ellipse(30, 28, tamanhoBotao, tamanhoBotao);
fill(131,111,255);
ellipse(35+tamanhoBotao, 28, tamanhoBotao, tamanhoBotao);
fill(131,111,255);
ellipse(40+(tamanhoBotao*2), 28, tamanhoBotao, tamanhoBotao);

//NOME DA ABA
fill(255,225,255);
text("HOME PAGE", 85, 32);

//ENDERECO URL
fill(245,245,245);
rect(18,40,563,25);
fill(0,0,0);
text("WWW.CRIESEUWEBSITE.COM.BR", 40, 57);

//PROPAGANDA JANGADA
//rect(15,15,570,370);
fill(254,245,245);
rect(18,75,565,350);
fill(144,238,144);
rect(50,80,400,100);
fill(255,0,0);
textSize(30);
text("CLIQUE AQUI PARA\nCOMPRAR SUA JANGADA", 60, 110);

//PROPAGANDA VIDEOPOKER
fill(254,245,245);
rect(400,200,170,150);
fill(255,0,0);
textSize(20);
text("NOTICIAS:\nVideopôquer\nNa praca Onze\n Venham!", 420, 230);


//FORMULARIO PARA MANDAR EMAIL
fill(0,139,139);
textSize(20);
text("Formulario para envio", 40, 205);
fill(0,0,0);
textSize(15);
text("Enviar email para:", 40, 230);
noFill();
rect(180,210,100,25);
fill(0,0,0);
text("Calcutá", 185, 230);


//CAIXA DE TEXTO
noFill();
rect(40,250,350,100);
fill(0,0,0);
text("Aqui está o hot-link de Helsinque que pediu,\nhttp://www.hel.fi/hki/helsinki/en/etusivu\nE me responda se vai ao debate.\nAbraço.", 50, 270);

//BOTAO ENVIAR
fill(124,252,0);
rect(45, 360, 100, 30, 15);
//BOTAO CANCELAR
fill(255,0,0);
rect(160, 360, 100, 30, 15);
