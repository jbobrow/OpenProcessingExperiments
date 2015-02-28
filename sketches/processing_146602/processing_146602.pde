
//Aluno: Maximiliano Wiliam Alves
//Data:30/04/2014
//Descrição: Feito a partir da interpretação do trecho:
//"Se faz uma jangada"
//"Um barco que veleje"
//"Um barco que veleje"
//"Que veleje nesse informar"

size(800,600);
background(192,217,217);

rect(0,200,800,400); 
fill(204);

fill(50,153,204);
rect(0,200,800,400); 

line(300,250,200,400);//lado 1
line(600,300,500,450);//lado 2 baixo
line(300,250,600,300);//lado 3 cima
line(200,400,500,450);//lado 4

line(200,410,500,460);//borda 1
line(600,310,500,460);//borda 2

line(200,400,200,410);
line(500,450,500,460);
line(600,300,600,310);

strokeWeight(15);
line(400,350,400,150);//mastro jangada

fill(250);
textSize(50);
text("0 1 0 1 0 1 0 1",00,250);
text("0 1 0 1 0 1 0 1 0",410,250);
text("0 1 0 1 0 1 0",610,300);
text("1 0 1 0 1 0 1",610,350);
text("0 1 0 1 0 1 0",570,400);
text("1 0 1 0 1 0 1",560,450);
text("0 1 0 1 0 1",00,300);
text("1 0 1 0 1",00,350);
text("1 0 1 0",00,400);
text("1 0 1 0",00,450);

text("0 1 0 1 1 0 1 1 1 0 1 0 1 1 0 0 1",00,500);
text("1 0 1 0 0 1 0 0 0 1 0 1 0 0 1 1 0",00,550);
text("0 1 0 1 1 0 1 1 1 0 1 0 1 1 0 0 1",00,600);




