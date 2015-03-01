
/*Dibuix animat*/

/*Declaracions de variable*/

size(500,600);
background(255,245,219);
noStroke();

int x1=130;
int y1=150;
int x2=350;
int y2=450;


/*TORTUGUES*/

//TORTUGA 1


  fill(56,111,62);
  ellipse(x1,y1,100,140); //closca
  
  fill(151,206,81);
  ellipse(x1,y1,85,125); //panxa
  
  ellipse(x1,y1-70,60,45); //boca
  ellipse(x1,y1-90,45,45); //ulls
  ellipse(x1-47,y1+20,25,25); //mà dreta
  ellipse(x1+47,y1+20,25,25); //mà esquerra  
  rect(x1-25,y1+50,20,50); //peu dret
  rect(x1+5,y1+50,20,50); //peu esquerra
  
  fill(242,241,210);
  rect(x1-20,y1-20,40,30); //panxa2
  ellipse(x1,y1+15,40,40); //panxa3
  
  fill(131,115,94);
  rect(x1+45,y1-100,10,200); //pal
  
  fill(193,192,191);
  rect(x1+45,y1,10,40); //cinta gris
  
  fill(101,45,126); //lila
  rect(x1-22,y1-95,45,10); //Cinta ulls
  rect(x1-25,y1+75,20,8); //cinta cama dreta
  rect(x1+5, y1+75,20,8); //cinta cama esquerra
  

  
  //TORTUGA 2


  fill(56,111,62);
  ellipse(x2,y1,100,140); //closca
  
  fill(151,206,81);
  ellipse(x2,y1,85,125); //panxa
  
  ellipse(x2,y1-70,60,45); //boca
  ellipse(x2,y1-90,45,45); //ulls
  ellipse(x2-47,y1+20,25,25); //mà dreta
  ellipse(x2+47,y1+20,25,25); //mà esquerra  
  rect(x2-25,y1+50,20,50); //peu dret
  rect(x2+5,y1+50,20,50); //peu esquerra
  
  fill(242,241,210);
  rect(x2-20,y1-20,40,30); //panxa2
  ellipse(x2,y1+15,40,40); //panxa3
  
  
  fill(193,192,191);
  rect(x2+45,y1,10,30); //espasa
  rect(x2+35,y1,30,5); //espasa2
  triangle(x2+45,y1,x2+55,y1,x2+50,y1-35); 
  
  
  fill(255,43,5); //Vermell
  rect(x2-22,y1-95,45,10); //Cinta ulls
  rect(x2-25,y1+75,20,8); //cinta cama dreta
  rect(x2+5, y1+75,20,8); //cinta cama esquerra
  rect(x2+45,y1+10,10,5); //espasa
  
  
  //TORTUGA 3


  fill(56,111,62);
  ellipse(x1,y2,100,140); //closca
  
  fill(151,206,81);
  ellipse(x1,y2,85,125); //panxa
  
  ellipse(x1,y2-70,60,45); //boca
  ellipse(x1,y2-90,45,45); //ulls
  ellipse(x1-47,y2+20,25,25); //mà dreta
  ellipse(x1+47,y2+20,25,25); //mà esquerra  
  rect(x1-25,y2+50,20,50); //peu dret
  rect(x1+5,y2+50,20,50); //peu esquerra
  
  fill(242,241,210);
  rect(x1-20,y2-20,40,30); //panxa2
  ellipse(x1,y2+15,40,40); //panxa3
  
 
  
  fill(193,192,191);
  rect(x1+45,y2,10,40); //arma1
  rect(x1+65,y2-20,40,10); //arma2
  ellipse(x1+50,y2-5,10,10); 
  ellipse(x1+55,y2-10,10,10); 
  ellipse(x1+60,y2-15,10,10); 
  
  
  fill(255,135,5); //taronja
  rect(x1-22,y2-95,45,10); //Cinta ulls
  rect(x1-25,y2+75,20,8); //cinta cama dreta
  rect(x1+5, y2+75,20,8); //cinta cama esquerra
  rect(x1+45,y2+10,10,20); //cinta arma1
  rect(x1+75, y2-20, 20,10); //cinta arma2
  
  
  //TORTUGA 4


  fill(56,111,62);
  ellipse(x2,y2,100,140); //closca
  
  fill(151,206,81);
  ellipse(x2,y2,85,125); //panxa
  
  ellipse(x2,y2-70,60,45); //boca
  ellipse(x2,y2-90,45,45); //ulls
  ellipse(x2-47,y2+20,25,25); //mà dreta
  ellipse(x2+47,y2+20,25,25); //mà esquerra  
  rect(x2-25,y2+50,20,50); //peu dret
  rect(x2+5,y2+50,20,50); //peu esquerra
  
  fill(242,241,210);
  rect(x2-20,y2-20,40,30); //panxa2
  ellipse(x2,y2+15,40,40); //panxa3
  
  
  fill(193,192,191);
  rect(x2+45,y2,10,40); //cinta gris
  triangle(x2+45,y2,x2+55,y2,x2+50,y2-35); 
  
  fill(5,44,255); //blau
  rect(x2-22,y2-95,45,10); //Cinta ulls
  rect(x2-25,y2+75,20,8); //cinta cama dreta
  rect(x2+5, y2+75,20,8); //cinta cama esquerra
  rect(x2+45,y2,10,10);
