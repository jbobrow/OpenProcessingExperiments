
//William de Oliveira Souza
//BSI 30/04/2014 turma S73
//trabalho se refera ao virus que podera atacar o Japao futuramente

void setup(){
 size(1000,1150);
 background(51, 43, 36);
 
//bandeira do japao

fill(255, 255, 255);
strokeWeight(3);
rect(100,640,800,485,15);


//corpo do virus
noStroke();
fill(91, 140, 163,90);
triangle(500,670,350,535,650,535);
rect(350,135,300,400);
triangle(500,25,350,135,650,135);
rect(350,160,300,60);  
fill(255,0,0,80);
ellipse(500,190,270,25);
fill(56, 125, 119,180);
ellipse(500,380,240,300);

//"material genetico"  
strokeWeight(1);
fill(245, 155, 10,80);
arc(500,300,80,100,0,270);
fill(245, 233, 12,80);
arc(500,395,80,90,90,270);
fill(245, 40, 12,80);
arc(500,485,80,90,80,270);


//tronco (daonde saem as patas)
  stroke(10);
  line(500,670,500,810);
//linhas das "patas"
//pata1
line(500,810,380,680);
line(380,680,320,770);
//pata2
line(500,810,670,675);
line(670,675,880,775);
//pata3
line(500,810,800,850);
line(800,850,890,980);
//pata4
line(500,810,680,940);
line(680,940,700,1070);
//pata5
line(500,810,335,725);
line(335,725,337,1055);
//pata6
line(500,810,220,820);
line(220,820,140,900);
 }
void draw(){
 
}
void mousePressed() {
//raio laser e texto do BSI e detalhe da bandeira

  fill(255,0,0);
  ellipse(500,860,200,200);
  noStroke();
 fill(255,255,255);
 textSize(40);
 text("UUUHHHH TERROR BSI!!!", 5, 802);
 fill(255,0,0);
 quad(365,190,635,190,0,870,0,740);
}

void mouseReleased(){  
//Ao soltar o mouse, as letras do BSI mudam e a cor do raio laser tbm
fill(255,255,255);
  ellipse(500,860,200,200);
 fill(255,0,0); 
 textSize(40);
 text("UUUHHHH TERROR BSI!!!", 5, 802);
 
 fill(255, 255, 255);
 quad(365,190,635,190,0,870,0,740);
}

