
/*  Trabalho 1 de Algoritmos - IF61F
*   Prof. Sílvia Bim
*   Aluna: Cássio Augusto Lütke Jarek
*   Data de criação: 25/04/2014
*   Título: Criar meu website
*   Descrição: Com esse sketch desejo representar a parte da musica em que Gilberto Gil diz que vai criar seu website e sua homepage. Em minha arte fiz um browser(Google Chrome), mais conhecido como navegador de internet, que nele está aberto uma pagina do buscador Googlev(Maior site de buscas do mundo) onde está sendo pesquisado como fazer um website ou uma home page. Para fazer esse sketch usei muito text,rect. Poderia ter explorado a função draw e qualquer outra função de interatividade com o usuário,mas preferi não usar já que meus conhecimentos ainda não são o suficiente,em próximas versões irei implementar mais interatividades.
*/

size(530,530);
background(255,255,255);
// Janela
    fill(189, 189, 189);
    stroke(189, 189, 189);
    rect(0,0,999,50);
    //Botões de fechar
        strokeWeight(12);
        //fechar
            stroke(255, 0, 0);
            point(20, 15);
        //maximizar
            stroke(255, 234, 0);
            point(40, 15);
        //minimizar
            stroke(51, 255, 0);
            point(60, 15);
    //Abas
        strokeWeight(1);
        stroke(110, 102, 110);
        textSize(14);
        //New Tab
            fill(235, 218, 235);
            rect(224,25,120,25,10,10,0,0);
            fill(36, 33, 33);
            text("New Tab",250,43);
            //X
                fill(100, 100, 100);
                textSize(11);
                text('x',329,42);
        //Google
            fill(235, 228, 235);
            rect(80,22,150,28,10,10,0,0);
            fill(36, 33, 33);
            textSize(14);
            text("Google",119,42);
            //X
                fill(100, 100, 100);
                textSize(13);
                text('x',215,41);
            //Icone
                fill(68, 46, 242);
                stroke(68, 46, 242);
                rect(90,26,20,20,2);
                fill(255, 255, 255);
                textSize(14);
                text('g',97,40);
        //Botão Nova Aba
            fill(235, 218, 235);
            stroke(156, 153, 153);
            quad(350, 29, 380, 29, 385, 47, 355, 47);
            //Mais
                stroke(148, 138, 138);
                strokeWeight(2);
                line(367,33,367,42);
                line(362,38,371,38);
        stroke(110, 102, 110);
        strokeWeight(1);
        line(1,50,999,50);
        stroke(235, 228, 235);
        line(81,50,229,50);
      //Barra de endereço
          fill(235, 228, 235);
          stroke(235, 228, 235);
          rect(0,51,999,35);
          //Setas
            fill(235, 228, 235);
            stroke(112, 100, 100);
            rect(5,56,75,25,7);
            line(43,56,43,81);
            textSize(30);
            fill(112, 100, 100);
            //Direita
              text(">",52,78);
            //Esquerda
              text("<",12,78);
          //Endereço
            strokeWeight(1);
            stroke(112, 100, 100);
            fill(255,255,255);
            rect(90,56,400,25,5);
            fill(0,0,0);
            textSize(14);
            text("http://www.google.com.br",105,74);
          //Configurações
              strokeWeight(3);
              stroke(112, 100, 100);
              line(505,63,520,63);
              line(505,68,520,68);
              line(505,73,520,73);
          stroke(200, 200, 200);
          strokeWeight(1);
          line(0,87,999,87);
//PAGINA
  //GOOGLE
     textSize(100);
     fill(19,105,234);
     text("G",100,250);
     text("g",275,250);
     fill(255,187,3);
     text("o",223,250);
     fill(0,153,87);
     text("l",325,250);
     fill(216,67,46);
     text("o",170,250);
     text("e",345,250);
  //Caixa de Pesquisa
    stroke(200, 200, 200);
    fill(255,255,255);
    rect(60,300,400,30,2);
    fill(0,0,0);
    textSize(16);
    text("Como fazer um website/home page?",65,322);
 //Botão de Pesquisa
    stroke(150, 150, 150);
    fill(200, 200, 200);
    rect(120,350,120,30,2);
    textSize(12);
    fill(0,0,0);
    text("Pesquisa Google",132,370);
 //Botão de Estou com Sorte
    stroke(150, 150, 150);
    fill(200, 200, 200);
    rect(270,350,120,30,2);
    textSize(12);
    fill(0,0,0);
    text("Estou com Sorte",282,370);
