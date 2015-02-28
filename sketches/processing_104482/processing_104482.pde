
int s;
int p;
int y;
int z;
void setup () {
  size (650, 400); // tamanho
  smooth ();
  frameRate (9);
  s=0;
  p=10;
  y=64;
  z=460;
}

void draw () {
  background (188,207,255);

  s++; // sol
  noStroke ();
 fill (random(252,255),random(250,228), random (146,75));
  ellipse (s,50,60,60);
  
  p++; //núvens
  fill (255); 
  ellipse (p+400,170,200,45); 
  ellipse (p+175,120,150,50); ellipse (p+150,100,150,50);
  ellipse (p,200,300,60); 
  ellipse (p-175,140,150,50); ellipse (p-150,120,150,50);
  ellipse (p-400,170,200,45); 
  fill (230); //chuva
  ellipse (p-700,100,300,60); ellipse (p-800,130,500,50);

  if (mouseX<width/2) //vegetação
 { fill (87,160,73); }
 else {fill (17,108,0);}
  for (int a=0; a<700; a+=20) { 
    ellipse (a,330, 30,25); }
   if (mouseY<325) //chão
  { fill (203,222,157); }
  else {fill (163,185,148);} 
  rect (0,325,650,150);
  
 
  fill (111,158,183); //lago 
  ellipse (325,350, 700,20);
  
  
  fill (230); //EDIFÍCIO
  rect (245,320,160,30); //base  
  stroke (170,169,146);
  fill (52,62,80); //porta
  rect (350,325,45,25);
  
  noStroke (); //calçada
  fill (150);
  quad (350,350, 650,370, 650,360, 395,350);
  
  noStroke ();
  fill (225);
  quad (64,300, 245,320, 405,320, 600,300); //sustentação
  
  fill (201,203,255); //CENTRO
  rect (190,200,270,105);
   fill (240); //detalhe
   rect (190,300,270,5);
   rect (190,200,270,5);
   
   stroke (170,169,146);
   for (int x=190; x<=460; x+=15) { // linhas verticais centro
  strokeWeight (1);
  line (x, 205, x, 300);  
 }

 
   line (190,205, z,205); //linhas horizontais
   line (190,231, z,231);
   line (190,244, z,244);
   line (190,270, z,270);
   line (190,283, z,283);
   line (190,300, z,300);
  
  noStroke(); //ESQUERDA
  fill (219,220,255);
  quad (64,220, 64,300, 190,305, 190,200);
   fill (255);
   quad (64,220, 64,225, 190,205, 190,200);
   quad (64,300, 64,295, 190,300, 190,305);
   
   stroke (170,169,146);
   line (y, 225, y,295); //linhas veticais esquerda
   line (y+7,224, y+7,295);
   line (y+14,223, y+14,295);
   line (y+21,222, y+21,296);
   line (y+28,221, y+28,296);
   line (y+35,220, y+35,296);
   line (y+42,219, y+42,296);
   line (y+49,218, y+49,297);
   line (y+56,217, y+56,297);
   line (y+63,216, y+63,297);
   line (y+70,215, y+70,297);
   line (y+77,214, y+77,298);
   line (y+84,213, y+84,298);
   line (y+91,212, y+91,298);
   line (y+98,211, y+98,298);
   line (y+105,209, y+105,299);
   line (y+112,207, y+112,299);
   line (y+119,206, y+119,300);
   line (y+126,205, y+126,300); 
  
   line (190,205, y,225); //linhas horizontais esquerda
   line (190,231, y,245);
   line (190,244, y,255);
   line (190,270, y,275);
   line (190,283, y,285);
   line (190,300, y,295);
  
  noStroke (); //DIREITA
  fill (167,171,255); 
  quad (460,200, 460,305, 586,300, 586,220); 
   fill (220); 
   quad (460,200, 460,205, 586,225, 586,220);
   quad (460,305, 460,300, 586,295, 586,300);
   
   fill (245); //passarela
   rect (586,293, 100,7);
   rect (586,268, 100,7);
   stroke (245);
   line (586,286, 650,286);
   line (586,261, 650,261);
   for (int c=586; c<650; c+=4) {
     line (c,286, c,293);
     line (c,261, c,268);
   }
   
   stroke (175); strokeWeight (1.5); 
   line (586,300, 650,300);
   line (586,275, 650,275);
   

   strokeWeight (1);
   stroke (170,169,146);  
   line (z, 205, z,300); //linhas verticais direita
   line (z+7,206, z+7,300);
   line (z+14,207, z+14,299);
   line (z+21,209, z+21,299);
   line (z+28,211, z+28,298);
   line (z+35,212, z+35,298);
   line (z+42,213, z+42,298);
   line (z+49,214, z+49,298);
   line (z+56,215, z+56,297);
   line (z+63,216, z+63,297);
   line (z+70,217, z+70,297);
   line (z+77,218, z+77,297);
   line (z+84,219, z+84,296);
   line (z+91,220, z+91,296);
   line (z+98,221, z+98,296);
   line (z+105,222, z+105,296);
   line (z+112,223, z+112,295);
   line (z+119,224, z+119,295);
   line (z+126,225, z+126,295); 
 
   line (z,205, 586,225); //linhas horizontais direita
   line (z,231, 586,245);
   line (z,244, 586,255);
   line (z,270, 586,275);
   line (z,283, 586,285);
   line (z,300, 586,295);
 
}
