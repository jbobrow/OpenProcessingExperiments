
size (800, 600);                            // tamanho da janela
background (255,255,0);                     //cor de fundo
smooth ();
 
 
 
for (int i=0; i<100; i=i+1)                 //variaveis 
{
  
       float px = random (width);
 float py = random (height);
   
 float linha = random (0.5,4);
 float arco2 = random (20, 150);
   
 float cor2 = random (255);
 float cor3 =random (10, 200);
 float raio1 = random (0, 180);
 float raio2 = random (180, 360);
 float tamanho = random (20,50);
   
 stroke (cor2,cor2, cor2, 1000);
 strokeWeight (linha);
 fill (cor3, cor3, cor3, 50);
 arc (100, 300, arco2, arco2, radians (raio1), radians (raio2) );                       //amplitude
 ellipse (raio1,raio2, 10,10);
  
 noFill ();
 noStroke ();
 stroke (cor2,cor2, cor2, 60);
 fill(255,100);
 ellipse (px,py, tamanho, tamanho);
  
 noFill ();
 stroke (cor3,cor3,cor3,150);
 strokeWeight (random (0.3,1));
 line (100,300, px,py);                                                                 //linhas
  
 
}
 
for (int i=0; i<20; i=i+1)                     //variaveis 
{
  
  float linha = random (0.5,4);
   
     float px = random (width);
  float py = random (height);
   
  float cor2 = random (255);
 stroke (cor2,cor2, cor2, 80);
 strokeWeight (linha);
  line (px, py, 100, 300);
   
  for (int e=0; e<25; e=e+1)
  {
 noStroke ();
 fill (e,e,e, 20);
 
 float arco = random (10, 10);
 
 arc (px, py, arco, arco, radians (random (0)), radians (random (360)) );    //amplitude dos circulos
 
}
}
 
saveFrame ("teste7.tiff");


