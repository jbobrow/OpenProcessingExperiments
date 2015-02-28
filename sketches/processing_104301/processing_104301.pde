
void setup()
{
  size(600,600);
}

void draw()
{
   //FUNDO
   background(87,108,200);
   
  //CHÃO
  noStroke();
  fill(20,190,20);
  rect(300,525, 300, 90);
  fill(210);
  quad(0,490,20, 460,580,460,600,490);
  quad(270, 452, 330, 452, 340, 600, 260, 600);
  fill(100,50,0);
  rect(530,410,5,40);
  fill(0,130,0);
  ellipse(530,360,50,70);

  //TOPO
  stroke(0);
  rectMode(RADIUS);
  fill(210);
  rect(300,225,75,25);
  //DETALHES  
  triangle(299,200, 300, 145, 301, 200);
  ellipse(300,175,8,4);
  ellipse(300, 185, 15, 6);
  for(int a = 225; a < 375; a +=3)  
  {
    for (int b  = 228; b<374; b+=8)
    {
      rect(b, 200, 3, 4);
    }
  }
  // (ENTRE INFERIOR E TOPO)
  rect(300,240,200,10);
  triangle(250, 216, 260, 214, 270, 216);
  rect(260, 232, 11, 16);
  triangle(350, 216, 340, 214, 330, 216);
  rect(340, 232, 11, 16);
  //INFERIOR
  rect(300,350,200,100);
    //JANELAS 100 a 500 - 300 a 400 (até 250 - 2; depois de 350 - 2. Largura de 30; altura de 70)
  fill(30);
  for (int b = 135; b<480; b+=80)
  {//135+90= 205 - 205 + 90 = 295
    if (b < 250)
    {
      rect (b, 350, 10, 35,50,50,0,0);
    }
    else
    {
     for (int c = 465; c>375; c-=80)
      {//135+90= 205 - 205 + 90 = 295
        if (c > 375)
          {
           rect (c, 350, 10, 35,50,50,0,0);
          }
      }
    }
  }
  //PILARES (largura 30 ; altura 250 a 450)
  fill(210);
  rect(260, 350, 12, 100);
  rect(340, 350, 12, 100);
  fill(20);
  ellipse(260,452,6,4);
  ellipse(340,452,6,4);
  //PORTA
  fill(30);
  rect(300, 380, 25, 70,20,20,0,0);
  line(300,450, 300, 310);
  //DETALHES
  fill(210);
  stroke(1);
  rect(300, 252, 200, 2);
  for (int e = 104; e < 499; e+= 8)
  {
    if (e < 498)
    {
      arc(e, 255, 6, 6, PI, TWO_PI, OPEN);
    }
  }
  //ANIMAÇÕES
  if (mouseX < 300)
  {
    noStroke();
    fill(242,242,0);
    ellipse(mouseX,70, 50,50);
    fill(255,255,255,120);
    ellipse(mouseX*3, 50, 80,40);
    ellipse(mouseX*4, 50, 250,45);
    ellipse(mouseX*6, 50, 160,60);
    ellipse(mouseX*2, 50, 120,30);
  }
  else
  {
  //FUNDO
  background(0,0,91);
   
  //CHÃO
  noStroke();
  fill(0,120,0);
  rect(300,525, 300, 90);
  fill(150);
  quad(0,490,20, 460,580,460,600,490);
  quad(270, 452, 330, 452, 340, 600, 260, 600);
  fill(80,30,0);
  rect(530,410,5,40);
  fill(0,100,0);
  ellipse(530,360,50,70);

  //TOPO
  stroke(0);
  rectMode(RADIUS);
  fill(150);
  rect(300,225,75,25);
  //DETALHES  
  triangle(299,200, 300, 145, 301, 200);
  ellipse(300,175,8,4);
  ellipse(300, 185, 15, 6);
  for(int a = 225; a < 375; a +=3)  
  {
    for (int b  = 228; b<374; b+=8)
    {
      rect(b, 200, 3, 4);
    }
  }
  // (ENTRE INFERIOR E TOPO)
  rect(300,240,200,10);
  triangle(250, 216, 260, 214, 270, 216);
  rect(260, 232, 11, 16);
  triangle(350, 216, 340, 214, 330, 216);
  rect(340, 232, 11, 16);
  //INFERIOR
  rect(300,350,200,100);
    //JANELAS 100 a 500 - 300 a 400 (até 250 - 2; depois de 350 - 2. Largura de 30; altura de 70)
  fill(30);
  for (int b = 135; b<480; b+=80)
  {//135+90= 205 - 205 + 90 = 295
    if (b < 250)
    {
      rect (b, 350, 10, 35,50,50,0,0);
    }
    else
    {
     for (int c = 465; c>375; c-=80)
      {//135+90= 205 - 205 + 90 = 295
        if (c > 375)
          {
           rect (c, 350, 10, 35,50,50,0,0);
          }
      }
    }
  }
  //PILARES (largura 30 ; altura 250 a 450)
  fill(150);
  rect(260, 350, 12, 100);
  rect(340, 350, 12, 100);
  ellipse(260,452,6,4);
  ellipse(340,452,6,4);
  //PORTA
  fill(30);
  rect(300, 380, 25, 70,20,20,0,0);
  line(300,450, 300, 310);
  //DETALHES
  fill(150);
  stroke(1);
  rect(300, 252, 200, 2);
  for (int e = 104; e < 499; e+= 8)
  {
    if (e < 498)
    {
      arc(e, 255, 6, 6, PI, TWO_PI, OPEN);
    }
  }
  //LUA
    noStroke();
    fill(250);
    ellipse(mouseX,70, 50,50);
   //LUZES
  fill(240,240,0, 140);
  quad(258,452,228,250,292,250,262,452);
  quad(338,452,308,250,372,250,342,452);
  fill(255,255,255,120);
  ellipse(mouseX/1.5, 50, 80,40);
  ellipse(mouseX/0.5, 50, 250,45);
  ellipse(mouseX*1.5, 50, 160,60);
  ellipse(mouseX*2, 50, 120,30);
  }
}
