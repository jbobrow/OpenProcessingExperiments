
/* @pjs preload="sky.jpg"; */

PImage bg;

float a;

void setup() {
  size(600, 700);
  smooth();
  frameRate(30);
  bg = loadImage ("sky.jpg");
}


void draw() {
  background(bg);


  if (mouseX>540 && mouseX<560 &&
    mouseY>15 && mouseY<35) {  
    fill(0, 200);
    rect(0, 0, 600, 700);
  }

  noStroke();
  fill(242);
  //ellipse(550, 25, 20, 20); //lua  
  arc(550, 25, 20, 20, 0, PI+QUARTER_PI, CHORD); //lua

  stroke(0);


  fill(33, 33, 33);
  rect(180, 50, 240, 500); //corpo do edifício


  for (int i = 50; i < 555; i = i+5) {
    line(180, i, 420, i);
  }

  for (int i = 200; i < 400; i = i+40) {
    line(i, 50, i, 550);
  }


  if (mousePressed == false) {
    fill(180, 190, 200);
  } 
  else {
    fill (255, 250, 100);
  }

  int x = 180;
  int y = 55;


  //janelas da primeira coluna:
  rect(x, y, 20, 5);
  rect(x, y+10, 20, 5);
  rect(x, y+15, 20, 5);
  rect(x, y+40, 20, 5);
  rect(x, y+50, 20, 5);
  rect(x, y+55, 20, 5);
  rect(x, y+80, 20, 5);
  rect(x, y+85, 20, 5);
  rect(x, y+90, 20, 5);
  rect(x, y+115, 20, 5);
  rect(x, y+120, 20, 5);
  rect(x, y+130, 20, 5);
  rect(x, y+140, 20, 5);
  rect(x, y+155, 20, 5);
  rect(x, y+160, 20, 5);
  rect(x, y+175, 20, 5);
  rect(x, y+185, 20, 5);
  rect(x, y+190, 20, 5);
  rect(x, y+220, 20, 5);
  rect(x, y+225, 20, 5);
  rect(x, y+235, 20, 5);
  rect(x, y+245, 20, 5);
  rect(x, y+255, 20, 5);
  rect(x, y+260, 20, 5);
  rect(x, y+280, 20, 5);
  rect(x, y+290, 20, 5);
  rect(x, y+295, 20, 5);
  rect(x, y+325, 20, 5);
  rect(x, y+330, 20, 5);
  rect(x, y+340, 20, 5);
  rect(x, y+360, 20, 5);
  rect(x, y+365, 20, 5);
  rect(x, y+375, 20, 5);
  rect(x, y+385, 20, 5);
  rect(x, y+395, 20, 5);
  rect(x, y+400, 20, 5);
  rect(x, y+430, 20, 5);
  rect(x, y+435, 20, 5);
  rect(x, y+445, 20, 5);
  rect(x, y+465, 20, 5);
  rect(x, y+470, 20, 5);
  rect(x, y+480, 20, 5);

  //janelas da segunda coluna:
  rect(x+20, y, 40, 5);
  rect(x+20, y+15, 40, 5);
  rect(x+20, y+20, 40, 5);
  rect(x+20, y+45, 40, 5);
  rect(x+20, y+50, 40, 5);
  rect(x+20, y+60, 40, 5);
  rect(x+20, y+70, 40, 5);
  rect(x+20, y+85, 40, 5);
  rect(x+20, y+90, 40, 5);
  rect(x+20, y+115, 40, 5);
  rect(x+20, y+120, 40, 5);
  rect(x+20, y+130, 40, 5);
  rect(x+20, y+140, 40, 5);
  rect(x+20, y+150, 40, 5);
  rect(x+20, y+155, 40, 5);
  rect(x+20, y+185, 40, 5);
  rect(x+20, y+190, 40, 5);
  rect(x+20, y+200, 40, 5);
  rect(x+20, y+210, 40, 5);
  rect(x+20, y+225, 40, 5);
  rect(x+20, y+230, 40, 5);
  rect(x+20, y+255, 40, 5);
  rect(x+20, y+260, 40, 5);
  rect(x+20, y+270, 40, 5);
  rect(x+20, y+290, 40, 5);
  rect(x+20, y+295, 40, 5);
  rect(x+20, y+305, 40, 5);
  rect(x+20, y+315, 40, 5);
  rect(x+20, y+330, 40, 5);
  rect(x+20, y+335, 40, 5);
  rect(x+20, y+350, 40, 5);
  rect(x+20, y+365, 40, 5);
  rect(x+20, y+370, 40, 5);
  rect(x+20, y+395, 40, 5);
  rect(x+20, y+400, 40, 5);
  rect(x+20, y+405, 40, 5);
  rect(x+20, y+420, 40, 5);
  rect(x+20, y+435, 40, 5);
  rect(x+20, y+440, 40, 5);
  rect(x+20, y+455, 40, 5);
  rect(x+20, y+470, 40, 5);
  rect(x+20, y+475, 40, 5);

  //janelas da terceira coluna:
  rect(x+60, y+5, 40, 5);
  rect(x+60, y+15, 40, 5);
  rect(x+60, y+20, 40, 5);
  rect(x+60, y+35, 40, 5);
  rect(x+60, y+45, 40, 5);
  rect(x+60, y+50, 40, 5);
  rect(x+60, y+75, 40, 5);
  rect(x+60, y+85, 40, 5);
  rect(x+60, y+90, 40, 5);
  rect(x+60, y+105, 40, 5);
  rect(x+60, y+120, 40, 5);
  rect(x+60, y+125, 40, 5);
  rect(x+60, y+150, 40, 5);
  rect(x+60, y+155, 40, 5);
  rect(x+60, y+165, 40, 5);
  rect(x+60, y+175, 40, 5);
  rect(x+60, y+190, 40, 5);
  rect(x+60, y+195, 40, 5);
  rect(x+60, y+210, 40, 5);
  rect(x+60, y+220, 40, 5);
  rect(x+60, y+225, 40, 5);
  rect(x+60, y+245, 40, 5);
  rect(x+60, y+260, 40, 5);
  rect(x+60, y+265, 40, 5);
  rect(x+60, y+280, 40, 5);
  rect(x+60, y+295, 40, 5);
  rect(x+60, y+300, 40, 5);
  rect(x+60, y+315, 40, 5);
  rect(x+60, y+325, 40, 5);
  rect(x+60, y+330, 40, 5);
  rect(x+60, y+350, 40, 5);
  rect(x+60, y+360, 40, 5);
  rect(x+60, y+365, 40, 5);
  rect(x+60, y+385, 40, 5);
  rect(x+60, y+400, 40, 5);
  rect(x+60, y+405, 40, 5);
  rect(x+60, y+420, 40, 5);
  rect(x+60, y+430, 40, 5);
  rect(x+60, y+435, 40, 5);
  rect(x+60, y+455, 40, 5);
  rect(x+60, y+465, 40, 5);
  rect(x+60, y+470, 40, 5);

  //janelas da quarta coluna:
  rect(x+100, y+10, 40, 5);
  rect(x+100, y+15, 40, 5);
  rect(x+100, y+25, 40, 5);
  rect(x+100, y+45, 40, 5);
  rect(x+100, y+50, 40, 5);
  rect(x+100, y+55, 40, 5);
  rect(x+100, y+80, 40, 5);
  rect(x+100, y+85, 40, 5);
  rect(x+100, y+95, 40, 5);
  rect(x+100, y+115, 40, 5);
  rect(x+100, y+120, 40, 5);
  rect(x+100, y+125, 40, 5);
  rect(x+100, y+140, 40, 5);
  rect(x+100, y+155, 40, 5);
  rect(x+100, y+160, 40, 5);
  rect(x+100, y+175, 40, 5);
  rect(x+100, y+185, 40, 5);
  rect(x+100, y+190, 40, 5);
  rect(x+100, y+210, 40, 5);
  rect(x+100, y+225, 40, 5);
  rect(x+100, y+230, 40, 5);
  rect(x+100, y+245, 40, 5);
  rect(x+100, y+255, 40, 5);
  rect(x+100, y+260, 40, 5);
  rect(x+100, y+290, 40, 5);
  rect(x+100, y+295, 40, 5);
  rect(x+100, y+305, 40, 5);
  rect(x+100, y+315, 40, 5);
  rect(x+100, y+330, 40, 5);
  rect(x+100, y+335, 40, 5);
  rect(x+100, y+350, 40, 5);
  rect(x+100, y+365, 40, 5);
  rect(x+100, y+370, 40, 5);
  rect(x+100, y+385, 40, 5);
  rect(x+100, y+395, 40, 5);
  rect(x+100, y+400, 40, 5);
  rect(x+100, y+420, 40, 5);
  rect(x+100, y+435, 40, 5);
  rect(x+100, y+440, 40, 5);
  rect(x+100, y+455, 40, 5);
  rect(x+100, y+470, 40, 5);
  rect(x+100, y+475, 40, 5);


  //janelas da quinta coluna:
  rect(x+140, y+5, 40, 5);
  rect(x+140, y+15, 40, 5);
  rect(x+140, y+20, 40, 5);
  rect(x+140, y+45, 40, 5);
  rect(x+140, y+50, 40, 5);
  rect(x+140, y+60, 40, 5);
  rect(x+140, y+75, 40, 5);
  rect(x+140, y+85, 40, 5);
  rect(x+140, y+90, 40, 5);
  rect(x+140, y+115, 40, 5);
  rect(x+140, y+120, 40, 5);
  rect(x+140, y+130, 40, 5);
  rect(x+140, y+140, 40, 5);
  rect(x+140, y+150, 40, 5);
  rect(x+140, y+155, 40, 5);
  rect(x+140, y+185, 40, 5);
  rect(x+140, y+190, 40, 5);
  rect(x+140, y+200, 40, 5);
  rect(x+140, y+210, 40, 5);
  rect(x+140, y+220, 40, 5);
  rect(x+140, y+225, 40, 5);
  rect(x+140, y+255, 40, 5);
  rect(x+140, y+260, 40, 5);
  rect(x+140, y+265, 40, 5);
  rect(x+140, y+280, 40, 5);
  rect(x+140, y+290, 40, 5);
  rect(x+140, y+295, 40, 5);
  rect(x+140, y+315, 40, 5);
  rect(x+140, y+325, 40, 5);
  rect(x+140, y+330, 40, 5);
  rect(x+140, y+350, 40, 5);
  rect(x+140, y+360, 40, 5);
  rect(x+140, y+365, 40, 5);
  rect(x+140, y+395, 40, 5);
  rect(x+140, y+400, 40, 5);
  rect(x+140, y+410, 40, 5);
  rect(x+140, y+420, 40, 5);
  rect(x+140, y+430, 40, 5);
  rect(x+140, y+435, 40, 5);
  rect(x+140, y+455, 40, 5);
  rect(x+140, y+465, 40, 5);
  rect(x+140, y+470, 40, 5);

  //janelas da sexta coluna:
  rect(x+180, y+10, 40, 5);
  rect(x+180, y+15, 40, 5);
  rect(x+180, y+20, 40, 5);
  rect(x+180, y+35, 40, 5);
  rect(x+180, y+50, 40, 5);
  rect(x+180, y+55, 40, 5);
  rect(x+180, y+80, 40, 5);
  rect(x+180, y+85, 40, 5);
  rect(x+180, y+95, 40, 5);
  rect(x+180, y+115, 40, 5);
  rect(x+180, y+120, 40, 5);
  rect(x+180, y+125, 40, 5);
  rect(x+180, y+150, 40, 5);
  rect(x+180, y+155, 40, 5);
  rect(x+180, y+165, 40, 5);
  rect(x+180, y+175, 40, 5);
  rect(x+180, y+185, 40, 5);
  rect(x+180, y+190, 40, 5);
  rect(x+180, y+220, 40, 5);
  rect(x+180, y+225, 40, 5);
  rect(x+180, y+235, 40, 5);
  rect(x+180, y+245, 40, 5);
  rect(x+180, y+255, 40, 5);
  rect(x+180, y+260, 40, 5);
  rect(x+180, y+280, 40, 5);
  rect(x+180, y+295, 40, 5);
  rect(x+180, y+300, 40, 5);
  rect(x+180, y+325, 40, 5);
  rect(x+180, y+330, 40, 5);
  rect(x+180, y+340, 40, 5);
  rect(x+180, y+360, 40, 5);
  rect(x+180, y+365, 40, 5);
  rect(x+180, y+375, 40, 5);
  rect(x+180, y+385, 40, 5);
  rect(x+180, y+395, 40, 5);
  rect(x+180, y+400, 40, 5);
  rect(x+180, y+430, 40, 5);
  rect(x+180, y+435, 40, 5);
  rect(x+180, y+440, 40, 5);
  rect(x+180, y+465, 40, 5);
  rect(x+180, y+470, 40, 5);
  rect(x+180, y+480, 40, 5);

  //janelas da sétima coluna:
  rect(x+220, y, 20, 5);
  rect(x+220, y+15, 20, 5);
  rect(x+220, y+20, 20, 5);
  rect(x+220, y+45, 20, 5);
  rect(x+220, y+50, 20, 5);
  rect(x+220, y+60, 20, 5);
  rect(x+220, y+80, 20, 5);
  rect(x+220, y+85, 20, 5);
  rect(x+220, y+90, 20, 5);
  rect(x+220, y+110, 20, 5);
  rect(x+220, y+120, 20, 5);
  rect(x+220, y+125, 20, 5);
  rect(x+220, y+140, 20, 5);
  rect(x+220, y+150, 20, 5);
  rect(x+220, y+155, 20, 5);
  rect(x+220, y+180, 20, 5);
  rect(x+220, y+190, 20, 5);
  rect(x+220, y+195, 20, 5);
  rect(x+220, y+220, 20, 5);
  rect(x+220, y+225, 20, 5);
  rect(x+220, y+235, 20, 5);
  rect(x+220, y+250, 20, 5);
  rect(x+220, y+260, 20, 5);
  rect(x+220, y+265, 20, 5);
  rect(x+220, y+285, 20, 5);
  rect(x+220, y+295, 20, 5);
  rect(x+220, y+300, 20, 5);
  rect(x+220, y+325, 20, 5);
  rect(x+220, y+330, 20, 5);
  rect(x+220, y+340, 20, 5);
  rect(x+220, y+360, 20, 5);
  rect(x+220, y+365, 20, 5);
  rect(x+220, y+375, 20, 5);
  rect(x+220, y+390, 20, 5);
  rect(x+220, y+400, 20, 5);
  rect(x+220, y+405, 20, 5);
  rect(x+220, y+430, 20, 5);
  rect(x+220, y+435, 20, 5);
  rect(x+220, y+445, 20, 5);
  rect(x+220, y+465, 20, 5);
  rect(x+220, y+470, 20, 5);
  rect(x+220, y+480, 20, 5);

  line(180, 50, 180, 550);
  line(400, 50, 400, 550);
  line(420, 50, 420, 550);

  //base do edifício:

  rect(200, 550, 220, 125);
  rect(280, 550, 140, 125); 

  fill(150, 150);
  rect(200, 550, 220, 125);
  fill(100, 50);
  rect(280, 550, 140, 125); 
  fill(100, 150);
  rect(200, 550, 80, 40); 

  line(305, 550, 405, 675); //diagonal 1
  line(305, 675, 405, 550); //diagonal 2

  line(200, 590, 420, 590);
  line(200, 635, 420, 635);

  fill(255);
  rect(185, 550, 10, 125); //coluna 1
  rect(295, 550, 10, 125); //coluna 2
  rect(405, 550, 10, 125); //coluna 3

  fill(94, 143, 77);
  if (mouseX>540 && mouseX<560 &&
    mouseY>15 && mouseY<35) {  
    fill(60, 87, 50);
  }
  rect(0, 675, 600, 25); //piso

  noStroke();
  fill(180, 190, 200, 150);
  rect(525, 150, 75, 525); //edifício vizinho

  stroke(0);

  //Tram:

  line(0, 590, 600, 590); //cabo aéreo

  fill(255);
  beginShape();
  vertex(a, 620);
  vertex(a-5, 620);
  vertex(a-10, 630);
  vertex(a-10, 670);
  vertex(a-5, 675);
  vertex(a, 675);
  endShape(CLOSE);
  rect(a, 620, 500, 55);
  beginShape();
  vertex(a+485, 620);
  vertex(a+550, 615);
  vertex(a+550, 630);
  vertex(a+575, 670);
  vertex(a+570, 675);
  vertex(a+485, 675);
  endShape(CLOSE);

  //janelas: 
  if (mousePressed == false) {
    fill(150);
  } 
  else {
    fill (255, 250, 100);
  }
  rect(a+10, 625, 50, 25);
  rect(a+70, 625, 50, 25);
  rect(a+130, 625, 50, 25);
  rect(a+190, 625, 50, 25);
  rect(a+250, 625, 50, 25);
  rect(a+310, 625, 50, 25);
  rect(a+370, 625, 50, 25);
  rect(a+430, 625, 50, 25);
  rect(a+490, 625, 55, 30);

  line(a+275, 620, a+250, 605); //cabos
  line(a+250, 605, a+305, 590);
  a=a+4;
}

//imagem: http://i4.photobucket.com/albums/y136/cityw/Architecture/VismaBygget3x800.jpg


