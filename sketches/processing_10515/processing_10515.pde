
// GRUP: Marina Martínez, Marta Palou i Sílvia Marcet.



// 0 - CONFIGURACIÓ GENERAL

float t=0;

void setup()
{
size(800,300); // tamany pantalla
background(113,9,35); // color fons
strokeWeight(2); // amplada contorn
smooth(); // suavitza contorns
frameRate(30);
}

void draw()
{
  t=t+0.5;
  dibuixaFons();
  dibuixaEli();
  println(t);

}

void dibuixaEli()
{
  

// 1 - BOLES FONS

stroke(248,165,186,0); // color linea perimetre
fill(248,165,186,100); // color bola
ellipse(150,50+yPos(2),300,300); // defineix elipse


stroke(240,57,103,0); 
fill(240,57,103,100); 
ellipse(400,50+yPos(7),300,300);


stroke(171,14,53,0); 
fill(171,14,53,100); 
ellipse(650,50+yPos(12),300,300);

  
// 2 - BOLES PETITES

stroke(251,208,219); //color linea perimetre
fill(251,208,219); //color bola
rectMode(CENTER); 
ellipse(50,50+yPos(0),50,50);

stroke(251,196,209); 
fill(251,196,209); 
ellipse(100,50+yPos(1),50,50);

stroke(248,165,186); 
fill(248,165,186);
ellipse(150,50+yPos(2),50,50);

stroke(245,135,163); 
fill(245,135,163); 
ellipse(200,50+yPos(3),50,50);

stroke(244,113,146); 
fill(244,113,146); 
ellipse(250,50+yPos(4),50,50);

stroke(241,80,120); 
fill(241,80,120); 
ellipse(300,50+yPos(5),50,50);

stroke(240,57,103); 
fill(240,57,103); 
ellipse(350,50+yPos(6),50,50);

stroke(238,32,84); 
fill(238,32,84); 
ellipse(400,50+yPos(7),50,50);

stroke(231,18,71); 
fill(231,18,71); 
ellipse(450,50+yPos(8),50,50);

stroke(217,17,67); 
fill(217,17,67); 
ellipse(500,50+yPos(9),50,50);

stroke(205,16,64);
fill(205,16,64); 
ellipse(550,50+yPos(10),50,50);

stroke(191,15,60); 
fill(191,15,60); 
ellipse(600,50+yPos(11),50,50);

stroke(171,14,53); 
fill(171,14,53); 
ellipse(650,50+yPos(12),50,50);

stroke(157,13,49); 
fill(157,13,49); 
ellipse(700,50+yPos(13),50,50);

stroke(143,12,45); 
fill(143,12,45); 
ellipse(750,50+yPos(14),50,50);
}

// 3 - DEFINEIX MOVIMENT

float yPos(float i)
{
  float aux01,aux02,aux03;
  aux01=0.07*(t-10*i);
 
  if(aux01<0){aux01=0;}
  aux02=sin(aux01);
  aux03=(aux02+1)*100;
  
  
return aux03;
}

void dibuixaFons()
{
background(113,9,35);
}




