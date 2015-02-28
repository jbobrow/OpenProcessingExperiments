
//Roberta
size(200, 200);
background(255);

//telhado
for (int i=0;i<30;i++)
  for (int j=0;j<10;j++)
  {
    stroke(113, 17, 17);
    fill(137, 21, 21);
    rect(25+i*5, 50+j*5, 5, 5);
  }
  
//corpo da casa
stroke(203, 128, 47);
fill(203, 128, 47);
rect(25, 95, 150, 60);
stroke(77, 46, 12);
strokeWeight(3);

//cor da janela
fill(180, 237, 219);
rect(35, 115, 30, 20);
rect(85, 115, 30, 20);
rect(135, 115, 30, 20);

//janelas
line(35, 115, 65, 115);
line(85, 115, 115, 115);
line(135, 115, 165, 115);
line(35, 135, 65, 135);
line(85, 135, 115, 135);
line(135, 135, 165, 135);
line(35, 115, 35, 135);
line(65, 115, 65, 135);
line(85, 115, 85, 135);
line(115, 115, 115, 135);
line(135, 115, 135, 135);
line(165, 115, 165, 135);
line(50, 115, 50, 135);
line(100, 115, 100, 135);
line(150, 115, 150, 135);

//grama
fill(11, 121, 54);
noStroke();
rect(0, 155, 200, 45);

//céu
fill(71, 215, 250);
noStroke();
rect(0, 0, 200, 50);
rect(0, 50, 25, 105);
rect(175, 50, 25, 105);
fill(254, 255, 0);
ellipse(170, 10, 30,30);
