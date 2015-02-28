
{
  size(800,600);
  background(195);
  
  rotate (radians(15));//rodar 15 graus

     fill(255);
     rect (365,275,110,200);//pescoço
       fill(10);
     rect (355,450,130,100);//coleira
     
     fill(255);
     
  ellipse (400,120,335,350);//cabeça
  
  rotate (radians(-5));
  ellipse (200,220,300,185);//fucinho
  
  stroke (1);
  
   fill (0);
     ellipse (100,150,100,60);//nariz
     fill(255);
     ellipse (85,140,40,20);//brilho do nariz
     
     rotate (radians(-10));//voltar a rotação para o normal
     
     ellipse (250,130,60,60);//olho esquerdo
     fill (0);
     ellipse (255,140,30,30);//pupila esquerda
     fill (255);
     ellipse (260,143,10,10);//brilho do olho esquerdo
     
     ellipse (340,150,80,80);//olho direito
     fill (0);
     ellipse (345,160,40,40);//pupila direita
     fill (255);
     ellipse (350,163,15,15);//brilho do olho direito
     
     rotate (radians(5));
     fill (0);
     ellipse (470,270,100,350);//orelha
   
   fill(255); 
    noStroke ();
  ellipse (275,225,150,90);
 noStroke ();
  ellipse (285,245,100,100);
   } 
