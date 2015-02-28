
/*
Tendo como inspiração o verso "Um vírus para atacar os programas no Japão"
da música "Pela Internet" composta por Gilberto Gil,
fiz esse pequeno labirinto, onde o usuário deve levar o quadrado
-que nesse caso seria um vírus- até a bandeira do Japão. */

color fillVal = color(126);
int x=0,y=0,inicio=0;
void setup()
{
  size(500,500);
  background(100);
  noStroke();
  
}
void draw() 
{
 
  if(x<=420 || y>50)
  {
  fill(255);
  rect(420,0,80,50);
  ellipseMode(CENTER);
  fill(255,0,0);
  ellipse(460,25,30,30);
  }
 
  //FAIXAS VERTICAIS DO CENÁRIO.
  fill(0,200,0);
  rect(30,0,30,500);
  rect(90,0,30,500);
  rect(150,0,30,500);
  rect(210,0,30,500);
  rect(270,0,30,500);
  rect(330,0,30,500);
  rect(390,0,30,500);
  rect(450,50,50,450);
  
  //PASSAGENS PARA O PERSONAGEM.
  //coluna1
  fill(100);
  rect(30,90,30,30);
  
  fill(100);
  rect(30,330,30,30);
  
  //coluna2
  fill(100);
  rect(90,420,30,30);
  
  fill(100);
  rect(90,210,30,30);
  
  //coluna3
  fill(100);
  rect(150,150,30,30);
  
  fill(100);
  rect(150,330,30,30);
  
  //coluna4
  fill(100);
  rect(210,30,30,30);
  
  fill(100);
  rect(210,270,30,30);
  
  fill(100);
  rect(210,420,30,30);
  
  //coluna5
  fill(100);
  rect(270,90,30,30);
  
  fill(100);
  rect(270,300,30,30);
  
  //coluna6
  fill(100);
  rect(330,450,30,30);
  
  fill(100);
  rect(330,180,30,30);
  
  //coluna7
  fill(100);
  rect(390,0,30,30);
  
  fill(100);
  rect(390,420,30,30);
  
  //BLOQUEIO NOS CAMINHOS.
  fill(0,200,0);
  rect(60,270,30,30);
  
  fill(0,200,0);
  rect(120,300,30,30);
  
  fill(0,200,0);
  rect(180,240,30,30);
  
  fill(0,200,0);
  rect(240,60,30,30);
  
  fill(0,200,0);
  rect(240,330,30,30);
  
  fill(0,200,0);
  rect(300,150,30,30);

  fill(0,200,0);
  rect(360,240,30,30); 
 
  fill(0,200,0);
  rect(360,90,30,30);
  
   if(x>=420&&y<50)
      {
      background(80,110,200);
      fill(0);
      rect(420,0,80,50);
      ellipseMode(CENTER);
      fill(0,250,0);
      ellipse(460,25,30,30);
      fill(0);
      textSize(30);
      text("O seu vírus chegou ao JAPÃO",20,250);
      
    }
    if(inicio==0)
  {    background(255);      
      fill(0);
      textSize(30);
      text("FASE 1: Leve o quadrado(Vírus) \nao Japão. \nAPERTE ENTER PARA INICIAR ",20,250);
  }
  
  
  
}

void keyPressed()
{
  
  if(key == ENTER)
  inicio=inicio+1;
  
  
  if (key == CODED) 
{
    if (keyCode == UP) 
    {
     background(100);
     y=y-30; 
   
      if(x==60)
      if(y>=270&&y<300)
      y=y+30;
     
      if(x==120)
      if(y>=300&&y<330)
      y=y+30;
      
      if(x==180)
      if(y>=240&&y<270)
      y=y+30;
      
      if(x==240)
      if(y>=330&&y<360 || y>=60 && y<90)
      y=y+30;
      
      if(x==300)
      if(y>=150&&y<180)
      y=y+30;
     
      if(x==360)
      if(y>=240&&y<270 || y>=90 && y<120)
      y=y+30;
   
     //Margens
     if(y<0)
     y=y+30;
   
     fill(255,100,100);
     rect(x,y,30,30);
     
   
       
     }
    else if (keyCode == DOWN) 
    {
      background(100);
      y=y+30; 
      
      if(x==60)
      if(y>=270&&y<=300)
      y=y-30;
     
      if(x==120)
      if(y>=300&&y<=330)
      y=y-30;
      
      if(x==180)
      if(y>=240&&y<=270)
      y=y-30;
      
      if(x==240)
      if(y>=330&&y<=360 || y>=60 && y<=90)
      y=y-30;
      
      if(x==300)
      if(y>=150&&y<=180)
      y=y-30;
     
      if(x==360)
      if(y>=240&&y<=270 || y>=90 && y<=120)
      y=y-30;
     
      //Margens
       if(y>500)
       y=y-30;
 
   
      fill(255,100,100);
      rect(x,y,30,30); 
   
      
      } 
     
   else if(keyCode == LEFT) 
    {
         background(100);
      //COLUNA1
      if(x==60)
      if(y>=90&&y<120 || y>=330 && y<360)
      x=x-60;
          
      //COLUNA2
      if(x==120)
      if(y>=210&&y<240 || y>=420 && y<450)
      x=x-60;
      
      //COLUNA3
      if(x==180)
      if(y>=150&&y<180 || y>=330 && y<360)
      x=x-60;
      
      //COLUNA4
      if(x==240)
      if(y>=30 && y<60 || y>=270 && y<300 || y>=420 && y<450)
      x=x-60;
      
      //COLUNA5
      if(x==300)
      if(y>=90&&y<120 || y>=300 && y<330)
      x=x-60;
      
      //COLUNA6
      if(x==360)
      if(y>=180&&y<210 || y>=450 && y<480)
      x=x-60;
      
      //COLUNA7
      if(x==420)
      if(y>=0 &&y<30 || y>=420 && y<450)
      x=x-60;
  
      
      fill(255,100,100);
      rect(x,y,30,30);
    }
    else if(keyCode == RIGHT) 
    {
      background(100);
      //COLUNA1
      if(x==0)
      if(y>=90&&y<120 || y>=330 && y<360)
      x=x+60;
          
      //COLUNA2
      if(x==60)
      if(y>=210&&y<240 || y>=420 && y<450)
      x=x+60;
      
      //COLUNA3
      if(x==120)
      if(y>=150&&y<180 || y>=330 && y<360)
      x=x+60;
      
      //COLUNA4
      if(x==180)
      if(y>=30 && y<60 || y>=270 && y<300 || y>=420 && y<450)
      x=x+60;
      
      //COLUNA5
      if(x==240)
      if(y>=90&&y<120 || y>=300 && y<330)
      x=x+60;
      
      //COLUNA6
      if(x==300)
      if(y>=180&&y<210 || y>=450 && y<480)
      x=x+60;
      
      //COLUNA7
      if(x==360)
      if(y>=0 &&y<30 || y>=420 && y<450)
      x=x+60;
  
      
      fill(255,100,100);
      rect(x,y,30,30);
      
      }
    
      

      

  
  
  
   } 
}



