
int xx;
int y=1;
void setup () {
  size (400, 400);
  background (209, 250, 251);
  xx = 0;
 
}
  
void draw() {
  background (145, 162, 214); //sol
  frameRate(60);
  fill(244, 245, 47);
  noStroke();
  ellipse(xx, height/5, 50, 50);
  if (xx < 500) {
    xx++;
  }


{ 
  //Nuvens
  fill(255);//cor:branco
  noStroke();
  ellipse(40, 65, 30, 30);
  ellipse(60, 65, 35, 35);
  ellipse(80, 65, 30, 30);
  ellipse(180, 110, 30, 30);
  ellipse(200, 110, 35, 35);
    ellipse(220, 110, 30, 30);
    ellipse(280,50,30,30);
    ellipse(300,50,35,35);
    ellipse(320,50,30,30);
    //RETIRADO DO TRABALHO DE CONCLUSÃ�O DA BRENDA DANIELA
}
noStroke();
{ 
fill(192,192,192);
  noStroke();
  rect(0, 260, 400, 40);
  stroke(220, 0, 0);
  //calÃ§ada superior 
  fill(255);
stroke(100);
line(270,260,270,255);
//tronco da Ã¡rvore
fill(0,255,0);
noStroke();
ellipse(270,250,10,10);
//copa da Ã¡rvore
  fill(255);
stroke(100);
line(260,265,260,255);
//tronco da Ã¡rvore 2
fill(0,255,0);
noStroke();
ellipse(260,252,10,10);
//copa da Ã¡rvore 2
}
{
stroke(220,0,0);
  fill(220, 0, 0);
  rect(123, 150, 10, 130);
  //coluna da esquerda
  fill(220, 0, 0);
  rect(123, 139, 161, 10);
  //coluna superior
  rect(274, 150, 10, 130);
  //coluna da direita

}


  noStroke();
fill(0);
rect(300,260,30,40);
//asfalto da direita

stroke(192);
fill(192,192,192);
line(315,260,315,300);


noStroke();
fill(165, 156, 152);
rect(130, 145, 148, 100);
//retÃ¢ngulo central
//x,y,largura,altura
{
noStroke();
fill(10);
rect(0, 300, 400, 80);
//asfalto principal
stroke(200);
fill(192, 192, 192);
rect(0, 380, 400, 200);
//calÃ§ada inferior

}
color(255,0,255);
stroke(100);
line(0,320,400,320);
line(0,340,400,340);
line(0,360,400,360);
//linhas do asfalto principal




for (int i = 0; i <3; i++) {
  fill(50+i);
  stroke(100);

  rect(130, 159, 5+i, 40+i);
  rect(130+5, 159, 5+i, 40+i);
  rect(130+10, 159, 5+i, 40+i);
  rect(130+15, 159, 5+i, 40+i);
  rect(130+20, 159, 5+i, 40+i);
  rect(130+25, 159, 5+i, 40+i);
  rect(130+30, 159, 5+i, 40+i);
  rect(130+35, 159, 5+i, 40+i);
  rect(130+40, 159, 5+i, 40+i);
  rect(130+45, 159, 5+i, 40+i);
  rect(130+50, 159, 5+i, 40+i);
  rect(130+55, 159, 5+i, 40+i);
  rect(130+60, 159, 5+i, 40+i);
  rect(130+65, 159, 5+i, 40+i);
  rect(130+70, 159, 5+i, 40+i);
  rect(130+75, 159, 5+i, 40+i);
  rect(130+80, 159, 5+i, 40+i);
  rect(130+85, 159, 5+i, 40+i);
  rect(130+90, 159, 5+i, 40+i);
  rect(130+95, 159, 5+i, 40+i);
  rect(130+100, 159, 5+i, 40+i);
  rect(130+105, 159, 5+i, 40+i);
  rect(130+110, 159, 5+i, 40+i);
  rect(130+115, 159, 5+i, 40+i);
  rect(130+120, 159, 5+i, 40+i);
  rect(130+125, 159, 5+i, 40+i);
  rect(130+130, 159, 5+i, 40+i);
  rect(130+135, 159, 5+i, 40+i);
  rect(130+140, 159, 5+i, 40+i);
//janelas superiores
  rect(130, 199, 5+i, 40+i);
  rect(130+5, 199, 5+i, 40+i);
  rect(130+10, 199, 5+i, 40+i);
  rect(130+15, 199, 5+i, 40+i);
  rect(130+20, 199, 5+i, 40+i);
  rect(130+25, 199, 5+i, 40+i);
  rect(130+30, 199, 5+i, 40+i);
  rect(130+35, 199, 5+i, 40+i);
  rect(130+40, 199, 5+i, 40+i);
  rect(130+45, 199, 5+i, 40+i);
  rect(130+50, 199, 5+i, 40+i);
  rect(130+55, 199, 5+i, 40+i);
  rect(130+60, 199, 5+i, 40+i);
  rect(130+65, 199, 5+i, 40+i);
  rect(130+70, 199, 5+i, 40+i);
  rect(130+75, 199, 5+i, 40+i);
  rect(130+80, 199, 5+i, 40+i);
  rect(130+85, 199, 5+i, 40+i);
  rect(130+90, 199, 5+i, 40+i);
  rect(130+95, 199, 5+i, 40+i);
  rect(130+100, 199, 5+i, 40+i);
  rect(130+105, 199, 5+i, 40+i);
  rect(130+110, 199, 5+i, 40+i);
  rect(130+115, 199, 5+i, 40+i);
  rect(130+120, 199, 5+i, 40+i);
  rect(130+125, 199, 5+i, 40+i);
  rect(130+130, 199, 5+i, 40+i);
  rect(130+135, 199, 5+i, 40+i);
  rect(130+140, 199, 5+i, 40+i);
//janelas inferiores
}


}
