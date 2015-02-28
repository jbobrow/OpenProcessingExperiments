
/* Cy Twombly - 2008
 Thetta skjal synir sjonraent oll tempo temposkalans, i nokkurs konar
 jafnstillingu, kodinn er relativur
 en breyting a upplausn skjalsins hefur ahrif a hreyfingu prikana en innbyrdis
 haldast allir tempovarar
 
 Konsertpasa i upphafi er naudsynleg og
 ekki tharf ad hafa ahyggjur hvenaer er byrjad ad lesa af skorinu
 vegna thess ad thetta er hugsad sem sams konar hrif oskylt fasa.
 Allir enda i lokatempoinu sem er einnig upphafstempoid og er adaltempo
 verksins. (um 48 MM i thessari upplausn)
 
 Til ad framkalla skorid er annadhvort ad stydja a Command + R (slaufa og R)
 eda fyrir fullan skja Command + Shift + R
 */

int a = 0;
float b = 0.0;
float c = 0.0;
float d = 0.0;
float e = 0.0;
float f = 0.0;
float g = 0.0;
float h = 0.0;
float i = 0.0;
float j = 0.0;
float k = 0.0;
float l = 0.0;
float m = 0.0;
float n = 0.0;


void setup()
{
  size(1200, 750);
  stroke(255);
  frameRate(80);
}

void draw()
{
  background(51);
  color blikk = color(1000,1000,1000);
  //Lina 1
  color lina1 = color(400,100,100);
  stroke(lina1);
  fill(lina1);
   if (a >= (1*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina1); stroke(lina1);
 }
 if (a >= (2*(width/8))) {fill(lina1);stroke(lina1);
 }
  rect(1*(width/8),1*(height/15),7,7);
 
    if (a >= (2*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina1); stroke(lina1);
 }
 if (a >= (3*(width/8))) {fill(lina1);stroke(lina1);
 }
  rect(2*(width/8),1*(height/15),7,7);
  
     if (a >= (3*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina1); stroke(lina1);
 }
 if (a >= (4*(width/8))) {fill(lina1);stroke(lina1);
 }
  rect(3*(width/8),1*(height/15),7,7);
  
     if (a >= (4*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina1); stroke(lina1);
 }
 if (a >= (5*(width/8))) {fill(lina1);stroke(lina1);
 }
  rect(4*(width/8),1*(height/15),7,7);
  
     if (a >= (5*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina1); stroke(lina1);
 }
 if (a >= (6*(width/8))) {fill(lina1);stroke(lina1);
 }
  rect(5*(width/8),1*(height/15),7,7);
  
     if (a >= (6*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina1); stroke(lina1);
 }
 if (a >= (7*(width/8))) {fill(lina1);stroke(lina1);
 }
  rect(6*(width/8),1*(height/15),7,7);
  
   if (a >= (7*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina1); stroke(lina1);
 }
  rect(7*(width/8),1*(height/15),7,7);
  
  //Lina 2
  color lina2 = color(204, 100, 0);
  stroke(lina2);
  fill(lina2);
  
   if (b >= (1*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina2); stroke(lina2);
 }
  if (b >= (2*(width/8))) {fill(lina2);stroke(lina2);
 }
  rect(1*(width/8),2*(height/15),7,7);
  
     if (b >= (2*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina2); stroke(lina2);
 }
  if (b >= (3*(width/8))) {fill(lina2);stroke(lina2);
 }
  rect(2*(width/8),2*(height/15),7,7);
  
     if (b >= (3*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina2); stroke(lina2);
 }
  if (b >= (4*(width/8))) {fill(lina2);stroke(lina2);
 }
  rect(3*(width/8),2*(height/15),7,7);
  
     if (b >= (4*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina2); stroke(lina2);
 }
  if (b >= (5*(width/8))) {fill(lina2);stroke(lina2);
 }
  rect(4*(width/8),2*(height/15),7,7);
  
     if (b >= (5*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina2); stroke(lina2);
 }
  if (b >= (6*(width/8))) {fill(lina2);stroke(lina2);
 }
  rect(5*(width/8),2*(height/15),7,7);
  
     if (b >= (6*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina2); stroke(lina2);
 }
  if (b >= (7*(width/8))) {fill(lina2);stroke(lina2);
 }
  rect(6*(width/8),2*(height/15),7,7);
  
  if (b >= (7*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina2); stroke(lina2);
 }
  rect(7*(width/8),2*(height/15),7,7);
  
  //Lina 3
  color lina3 = color(200,500,0);
  stroke(lina3);
  fill(lina3);
  
      if (c >= (1*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina3); stroke(lina3);
 }
  if (c >= (2*(width/8))) {fill(lina3);stroke(lina3);
 } 
  rect(1*(width/8),3*(height/15),7,7);
  
        if (c >= (2*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina3); stroke(lina3);
 }
  if (c >= (3*(width/8))) {fill(lina3);stroke(lina3);
 } 
  rect(2*(width/8),3*(height/15),7,7);
  
        if (c >= (3*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina3); stroke(lina3);
 }
  if (c >= (4*(width/8))) {fill(lina3);stroke(lina3);
 } 
  rect(3*(width/8),3*(height/15),7,7);
  
        if (c >= (4*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina3); stroke(lina3);
 }
  if (c >= (5*(width/8))) {fill(lina3);stroke(lina3);
 } 
  rect(4*(width/8),3*(height/15),7,7);
  
        if (c >= (5*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina3); stroke(lina3);
 }
  if (c >= (6*(width/8))) {fill(lina3);stroke(lina3);
 } 
  rect(5*(width/8),3*(height/15),7,7);
  
        if (c >= (6*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina3); stroke(lina3);
 }
  if (c >= (7*(width/8))) {fill(lina3);stroke(lina3);
 } 
  rect(6*(width/8),3*(height/15),7,7);
  
 if (c >= (7*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina3); stroke(lina3);
 }
  rect(7*(width/8),3*(height/15),7,7);
  
  //Lina 4
  color lina4 = color(100,600,300);
  stroke(lina4);
  fill(lina4);
  
if (d >= (1*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina4); stroke(lina4);
 }
  if (d >= (2*(width/8))) {fill(lina4);stroke(lina4);
 } 
  rect(1*(width/8),4*(height/15),7,7);
  
  if (d >= (2*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina4); stroke(lina4);
 }
  if (d >= (3*(width/8))) {fill(lina4);stroke(lina4);
 } 
  rect(2*(width/8),4*(height/15),7,7);
  
  if (d >= (3*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina4); stroke(lina4);
 }
  if (d >= (4*(width/8))) {fill(lina4);stroke(lina4);
 } 
  rect(3*(width/8),4*(height/15),7,7);
  
  if (d >= (4*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina4); stroke(lina4);
 }
  if (d >= (5*(width/8))) {fill(lina4);stroke(lina4);
 } 
  rect(4*(width/8),4*(height/15),7,7);
  
  if (d >= (5*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina4); stroke(lina4);
 }
  if (d >= (6*(width/8))) {fill(lina4);stroke(lina4);
 } 
  rect(5*(width/8),4*(height/15),7,7);
  
  if (d >= (6*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina4); stroke(lina4);
 }
  if (d >= (7*(width/8))) {fill(lina4);stroke(lina4);
 } 
  rect(6*(width/8),4*(height/15),7,7);
  
   if (d >= (7*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina4); stroke(lina4);
 }
  rect(7*(width/8),4*(height/15),7,7);
  
  //Lina 7
  color lina5 = color(200,0,0);
  stroke(lina5);
  fill(lina5);
  
    if (e >= (1*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina5); stroke(lina5);
 }
  if (e >= (2*(width/8))) {fill(lina5);stroke(lina5);
 } 
  rect(1*(width/8),5*(height/15),7,7);
  
  if (e >= (2*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina5); stroke(lina5);
 }
  if (e >= (3*(width/8))) {fill(lina5);stroke(lina5);
 } 
  rect(2*(width/8),5*(height/15),7,7);
  
  if (e >= (3*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina5); stroke(lina5);
 }
  if (e >= (4*(width/8))) {fill(lina5);stroke(lina5);
 } 
  rect(3*(width/8),5*(height/15),7,7);
  
  if (e >= (4*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina5); stroke(lina5);
 }
  if (e >= (5*(width/8))) {fill(lina5);stroke(lina5);
 } 
  rect(4*(width/8),5*(height/15),7,7);
  
  if (e >= (5*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina5); stroke(lina5);
 }
  if (e >= (6*(width/8))) {fill(lina5);stroke(lina5);
 } 
  rect(5*(width/8),5*(height/15),7,7);
  
  if (e >= (6*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina5); stroke(lina5);
 }
  if (e >= (7*(width/8))) {fill(lina5);stroke(lina5);
 } 
  rect(6*(width/8),5*(height/15),7,7);
  
   if (e >= (7*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina5); stroke(lina5);
 }
  rect(7*(width/8),5*(height/15),7,7);
  
  //Lina 6
  color lina6 = color(400,100,0);
  stroke(lina6);
  fill(lina6);
  
  if (f >= (1*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina6); stroke(lina6);
 }
  if (f >= (2*(width/8))) {fill(lina6);stroke(lina6);
 } 
  rect(1*(width/8),6*(height/15),7,7);
  
    if (f >= (2*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina6); stroke(lina6);
 }
  if (f >= (3*(width/8))) {fill(lina6);stroke(lina6);
 } 
  rect(2*(width/8),6*(height/15),7,7);
  
    if (f >= (3*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina6); stroke(lina6);
 }
  if (f >= (4*(width/8))) {fill(lina6);stroke(lina6);
 } 
  rect(3*(width/8),6*(height/15),7,7);
  
    if (f >= (4*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina6); stroke(lina6);
 }
  if (f >= (5*(width/8))) {fill(lina6);stroke(lina6);
 } 
  rect(4*(width/8),6*(height/15),7,7);
  
    if (f >= (5*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina6); stroke(lina6);
 }
  if (f >= (6*(width/8))) {fill(lina6);stroke(lina6);
 } 
  rect(5*(width/8),6*(height/15),7,7);
  
    if (f >= (6*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina6); stroke(lina6);
 }
  if (f >= (7*(width/8))) {fill(lina6);stroke(lina6);
 } 
  rect(6*(width/8),6*(height/15),7,7);
  
   if (f >= (7*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina6); stroke(lina6);
 }
  rect(7*(width/8),6*(height/15),7,7);
  
  //Lina 7
  color lina7 = color(300,20,400);
  stroke(lina7);
  fill(lina7);
  
      if (g >= (1*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina7); stroke(lina7);
 }
  if (g >= (2*(width/8))) {fill(lina7);stroke(lina7);
 } 
  rect(1*(width/8),7*(height/15),7,7);
  
        if (g >= (2*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina7); stroke(lina7);
 }
  if (g >= (3*(width/8))) {fill(lina7);stroke(lina7);
 } 
  rect(2*(width/8),7*(height/15),7,7);
  
        if (g >= (3*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina7); stroke(lina7);
 }
  if (g >= (4*(width/8))) {fill(lina7);stroke(lina7);
 } 
  rect(3*(width/8),7*(height/15),7,7);
  
        if (g >= (4*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina7); stroke(lina7);
 }
  if (g >= (5*(width/8))) {fill(lina7);stroke(lina7);
 } 
  rect(4*(width/8),7*(height/15),7,7);
  
        if (g >= (5*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina7); stroke(lina7);
 }
  if (g >= (6*(width/8))) {fill(lina7);stroke(lina7);
 } 
  rect(5*(width/8),7*(height/15),7,7);
  
        if (g >= (6*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina7); stroke(lina7);
 }
  if (g >= (7*(width/8))) {fill(lina7);stroke(lina7);
 } 
  rect(6*(width/8),7*(height/15),7,7);
  
   if (g >= (7*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina7); stroke(lina7);
 }
  rect(7*(width/8),7*(height/15),7,7);
  
  //Lina 8
  color lina8 = color(20,300,400);
  stroke(lina8);
  fill(lina8);
  
          if (h >= (1*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina8); stroke(lina8);
 }
  if (h >= (2*(width/8))) {fill(lina8);stroke(lina8);
 } 
  rect(1*(width/8),8*(height/15),7,7);
  
            if (h >= (2*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina8); stroke(lina8);
 }
  if (h >= (3*(width/8))) {fill(lina8);stroke(lina8);
 } 
  rect(2*(width/8),8*(height/15),7,7);
  
            if (h >= (3*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina8); stroke(lina8);
 }
  if (h >= (4*(width/8))) {fill(lina8);stroke(lina8);
 } 
  rect(3*(width/8),8*(height/15),7,7);
  
            if (h >= (4*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina8); stroke(lina8);
 }
  if (h >= (5*(width/8))) {fill(lina8);stroke(lina8);
 } 
  rect(4*(width/8),8*(height/15),7,7);
  
            if (h >= (5*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina8); stroke(lina8);
 }
  if (h >= (7*(width/8))) {fill(lina8);stroke(lina8);
 } 
  rect(5*(width/8),8*(height/15),7,7);
  
            if (h >= (6*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina8); stroke(lina8);
 }
  if (h >= (7*(width/8))) {fill(lina8);stroke(lina8);
 } 
  rect(6*(width/8),8*(height/15),7,7);
  
   if (h >= (7*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina8); stroke(lina8);
 }
  rect(7*(width/8),8*(height/15),7,7);
  
  
  //Lina 9
  color lina9 = color(10,100,50);
  stroke(lina9);
  fill(lina9);
  
  if (i >= (1*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina9); stroke(lina9);
 }
  if (i >= (2*(width/8))) {fill(lina9);stroke(lina9);
 } 
  rect(1*(width/8),9*(height/15),7,7);
  
  if (i >= (2*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina9); stroke(lina9);
 }
  if (i >= (3*(width/8))) {fill(lina9);stroke(lina9);
 } 
  rect(2*(width/8),9*(height/15),7,7);
  
  if (i >= (3*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina9); stroke(lina9);
 }
  if (i >= (4*(width/8))) {fill(lina9);stroke(lina9);
 } 
  rect(3*(width/8),9*(height/15),7,7);
  
  if (i >= (4*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina9); stroke(lina9);
 }
  if (i >= (5*(width/8))) {fill(lina9);stroke(lina9);
 } 
  rect(4*(width/8),9*(height/15),7,7);
  
  if (i >= (5*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina9); stroke(lina9);
 }
  if (i >= (6*(width/8))) {fill(lina9);stroke(lina9);
 } 
  rect(5*(width/8),9*(height/15),7,7);
  
  if (i >= (6*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina9); stroke(lina9);
 }
  if (i >= (7*(width/8))) {fill(lina9);stroke(lina9);
 } 
  rect(6*(width/8),9*(height/15),7,7);
  
   if (i >= (7*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina9); stroke(lina9);
 }
  rect(7*(width/8),9*(height/15),7,7);
  
  //Lina 10
  color lina10 = color(70,0,200);
  stroke(lina10);
  fill(lina10);
  
  if (j >= (1*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina10); stroke(lina10);
 }
  if (j >= (2*(width/8))) {fill(lina10);stroke(lina10);
 } 
  rect(1*(width/8),10*(height/15),7,7);
  
  if (j >= (2*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina10); stroke(lina10);
 }
  if (j >= (3*(width/8))) {fill(lina10);stroke(lina10);
 } 
  rect(2*(width/8),10*(height/15),7,7);
  
  if (j >= (3*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina10); stroke(lina10);
 }
  if (j >= (4*(width/8))) {fill(lina10);stroke(lina10);
 } 
  rect(3*(width/8),10*(height/15),7,7);
  
  if (j >= (4*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina10); stroke(lina10);
 }
  if (j >= (5*(width/8))) {fill(lina10);stroke(lina10);
 } 
  rect(4*(width/8),10*(height/15),7,7);
  
  if (j >= (5*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina10); stroke(lina10);
 }
  if (j >= (6*(width/8))) {fill(lina10);stroke(lina10);
 } 
  rect(5*(width/8),10*(height/15),7,7);
  
  if (j >= (6*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina10); stroke(lina10);
 }
  if (j >= (7*(width/8))) {fill(lina10);stroke(lina10);
 } 
  rect(6*(width/8),10*(height/15),7,7);
  
  if (j >= (7*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina10); stroke(lina10);
 }
  rect(7*(width/8),10*(height/15),7,7);
  
  //Lina 11
  color lina11 = color(100,10,20);
  stroke(lina11);
  fill(lina11);
  
  if (k >= (1*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina11); stroke(lina11);
 }
  if (k >= (2*(width/8))) {fill(lina11);stroke(lina11);
 } 
  rect(1*(width/8),11*(height/15),7,7);
  
  if (k >= (2*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina11); stroke(lina11);
 }
  if (k >= (3*(width/8))) {fill(lina11);stroke(lina11);
 } 
  rect(2*(width/8),11*(height/15),7,7);
  
  if (k >= (3*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina11); stroke(lina11);
 }
  if (k >= (4*(width/8))) {fill(lina11);stroke(lina11);
 } 
  rect(3*(width/8),11*(height/15),7,7);
  
  if (k >= (4*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina11); stroke(lina11);
 }
  if (k >= (5*(width/8))) {fill(lina11);stroke(lina11);
 } 
  rect(4*(width/8),11*(height/15),7,7);
  
  if (k >= (5*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina11); stroke(lina11);
 }
  if (k >= (6*(width/8))) {fill(lina11);stroke(lina11);
 } 
  rect(5*(width/8),11*(height/15),7,7);
  
  if (k >= (6*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina11); stroke(lina11);
 }
  if (k >= (7*(width/8))) {fill(lina11);stroke(lina11);
 } 
  rect(6*(width/8),11*(height/15),7,7);
  
  if (k >= (7*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina11); stroke(lina11);
 }
  rect(7*(width/8),11*(height/15),7,7);
  
  //Lina 12
  color lina12 = color(50,100,200);
  stroke(lina12);
  fill(lina12);
  
  if (l >= (1*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina12); stroke(lina12);
 }
  if (l >= (2*(width/8))) {fill(lina12);stroke(lina12);
 } 
  rect(1*(width/8),12*(height/15),7,7);
  
  if (l >= (2*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina12); stroke(lina12);
 }
  if (l >= (3*(width/8))) {fill(lina12);stroke(lina12);
 } 
  rect(2*(width/8),12*(height/15),7,7);
  
  if (l >= (3*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina12); stroke(lina12);
 }
  if (l >= (4*(width/8))) {fill(lina12);stroke(lina12);
 } 
  rect(3*(width/8),12*(height/15),7,7);
  
  if (l >= (4*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina12); stroke(lina12);
 }
  if (l >= (5*(width/8))) {fill(lina12);stroke(lina12);
 } 
  rect(4*(width/8),12*(height/15),7,7);
  
  if (l >= (5*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina12); stroke(lina12);
 }
  if (l >= (6*(width/8))) {fill(lina12);stroke(lina12);
 } 
  rect(5*(width/8),12*(height/15),7,7);
  
  if (l >= (6*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina12); stroke(lina12);
 }
  if (l >= (7*(width/8))) {fill(lina12);stroke(lina12);
 } 
  rect(6*(width/8),12*(height/15),7,7);
  
  if (l >= (7*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina12); stroke(lina12);
 }
  rect(7*(width/8),12*(height/15),7,7);
  
  //Lina 13
  color lina13 = color(400,10,300);
  stroke(lina13);
  fill(lina13);
  
  if (m >= (1*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina13); stroke(lina13);
 }
  if (m >= (2*(width/8))) {fill(lina13);stroke(lina13);
 } 
  rect(1*(width/8),13*(height/15),7,7);
  
  if (m >= (2*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina13); stroke(lina13);
 }
  if (m >= (3*(width/8))) {fill(lina13);stroke(lina13);
 } 
  rect(2*(width/8),13*(height/15),7,7);
  
  if (m >= (3*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina13); stroke(lina13);
 }
  if (m >= (4*(width/8))) {fill(lina13);stroke(lina13);
 } 
  rect(3*(width/8),13*(height/15),7,7);
  
  if (m >= (4*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina13); stroke(lina13);
 }
  if (m >= (5*(width/8))) {fill(lina13);stroke(lina13);
 } 
  rect(4*(width/8),13*(height/15),7,7);
  
  if (m >= (5*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina13); stroke(lina13);
 }
  if (m >= (6*(width/8))) {fill(lina13);stroke(lina13);
 } 
  rect(5*(width/8),13*(height/15),7,7);
  
  if (m >= (6*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina13); stroke(lina13);
 }
  if (m >= (7*(width/8))) {fill(lina13);stroke(lina13);
 } 
  rect(6*(width/8),13*(height/15),7,7);
  
  if (m >= (7*(width/8))) {fill(blikk);stroke(blikk);
 } else {fill(lina13); stroke(lina13);
 }
  rect(7*(width/8),13*(height/15),7,7);  

  color hvitt = color(1000,1000,1000);
  stroke(hvitt);
  //Tempo Scale
  //1:1
  a = a + 1;
  line(a, 1.5*(height/30), a, 2.5*(height/30));
  //14:15 litil tviund
  b = b + 1.071428; 
  line(b, 3.5*(height/30),b, 4.5*(height/30));
  //8:9 stor tviund
  c = c + 1.125;
  line(c, 5.5*(height/30),c,6.5*(height/30));
  //5:6 litil thriund
  d = d + 1.2;
  line(d, 7.5*(height/30),d,8.5*(height/30));
  //4:5 stor thriund
  e = e + 1.25;
  line(e, 9.5*(height/30),e,10.5*(height/30));
  //3:4 Hrein ferund
  f = f + 1.3333333;
  line(f,11.5*(height/30),f,12.5*(height/30));
  //5:7 Staekkud ferund
  g = g + 1.4;
  line(g,13.5*(height/30),g,14.5*(height/30));
  //2:3 Hrein fimmund
  h = h + 1.5;
  line(h,15.5*(height/30),h,16.5*(height/30));
  //5:8 Litil sexund
  i = i + 1.6;
  line(i,17.5*(height/30),i,18.5*(height/30));
  //3:5 Stor sexund
  j = j + 1.66666666;
  line(j,19.5*(height/30),j,20.5*(height/30));
  //4:7 Litil sjound
  k = k + 1.75;
  line(k,21.5*(height/30),k,22.5*(height/30));
  //8:15 Stor sjound
  l = l + 1.875;
  line(l,23.5*(height/30),l,24.5*(height/30));
  //1:2 Hrein attund
  m = m + 2;
  line(m,25.5*(height/30),m,26.5*(height/30));

  if(a > width) {
    a = 0;
  }
  if(b > width) {
    b = 0;
  }
  if(c > width) {
    c = 0;
  }
  if(d > width) {
    d = 0;
  }
  if(e > width) {
    e = 0;
  }
  if(f > width) {
    f = 0;
  }
  if(g > width) {
    g = 0;
  }
  if(h > width) {
    h = 0;
  }
  if(i > width) {
    i = 0;
  }
  if(j > width) {
    j = 0;
  }
  if(k > width) {
    k = 0;
  }
  if(l > width) {
    l = 0;
  }
  if(m > width) {
    m = 0;
  }
}

/* Juni 2008 - Cy Twombly */

