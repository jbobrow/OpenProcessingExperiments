
/*Rogério Luckmann Neto
  Data: 28/04/2014
  Inspiração: "Criar meu web site
              Fazer minha home-page"
              Esta parte da letra me fez lembrar de quando a internet começou a ter um grande acesso, o "boom" das redes socias, como por exemplo o Orkut.*/  
                
//Background
size(400,400);
fill(252, 249, 250);
rect(50,50,300,300);

//Cursor(Com PEQUENO problema de escala)
fill(255);
triangle(119,181,135,195,143,170);
line(109,212,126,190);

//Textos de Login
fill(0, 0, 0);
text("EMAIL", 147,172);
text("SENHA",141,200);

//Logo/Nome
fill(204, 0, 204);
textSize(40);
text("ORKUT", 153, 100);

//Campos de Digitação
fill(255);
rect(186,158, 135,17);
rect(186,185,135,17);
rect(258,226,58,22);

//Login e Senha
fill(0);
textSize(10);
text("malandrinho_23@ig.com.br",188,170);
text("********",191,198);
text("ENTRAR",265,239);

//Layout Windowns & MSN
fill(21, 155, 217);
rect(50,327,300,23);
fill(0, 120, 38);
rect(50,327,50,23);
fill(218, 250, 228);
rect(293,277,57,50);
fill(255);
line(300,327,300,350);
text("8:54",315,342);
text("INICIAR",56 ,343);
rect(293,277,29,30);
line(308,293,307,307);
fill(0);
strokeWeight(7);
point(308,294);
textSize(8);
text("acabou\n de entrar",302,315);
