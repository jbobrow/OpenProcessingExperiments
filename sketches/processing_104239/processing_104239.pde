
//copyright Mark Obeldobel July 2013

//Fix distances from game 5 on

float Test, p1x, p1y, v1x, v1y, p2x, p2y, v2x, v2y, p3x, p3y, v3x, v3y, p4x, p4y, v4x, v4y, d4x, d4y, d4mx, d4my, dis4, GO4, p5x, p5y, v5x, v5y, d5x, d5y, d5mx, d5my, dis5, GO5, p6x, p6y, v6x, v6y, da6x, da6y, db6x, db6y, dc6x, dc6y, da6mx, da6my, db6mx, db6my, dc6mx, dc6my, disa6, disb6, disc6, GO6, p7x, p7y, v7x, v7y, da7x, da7y, db7x, db7y, dc7x, dc7y, dd7x, dd7y, da7my, db7mx, dc7my, dd7my, disa7, disb7, disc7, disd7, GO7, p8x, p8y, v8x, v8y, da8x, da8y, db8x, db8y, dc8x, dc8y, dd8x, dd8y, da8mx, da8my, db8mx, db8my, dc8mx, dc8my, dd8mx, dd8my, disa8, disb8, disc8, disd8, GO8, p9x, p9y, va9x, va9y, vb9x, vb9y, da9x, da9y, db9x, db9y, dc9x, dc9y, da9mx, da9my, db9mx, db9my, dc9mx, dc9my, v9, disa9, disb9, disc9, GO9, p10x, p10y, va10x, va10y, vb10x, vb10y, vc10x, vc10y, vd10x, vd10y, d10x, d10y, d10mx, d10my, v10, dis10, GO10, p11x, p11y, va11x, va11y, vb11x, vb11y, vc11x, vc11y, da11x, da11y, db11x, db11y, da11mx, da11my, db11mx, db11my, v11, GO11, disa11, disb11, p12x, p12y, v12x, v12y, c12x, c12y, da12x, da12y, db12x, db12y, da12mx, da12my, db12mx, db12my, disa12, disb12, captured12, GO12, p13x, p13y, c13x, c13y, va13x, va13y, vb13x, vb13y, vc13x, vc13y, vd13x, vd13y, da13x, da13y, db13x, db13y, dc13x, dc13y, dd13x, da13mx, da13my, db13mx, db13my, dc13mx, dc13my, dd13mx, dd13my, disa13, disb13, disc13, captured13, GO13, v13, p14x, p14y, v14x, v14y, da14x, da14y, db14x, db14y, da14mx, da14my, db14mx, db14my, disa14, disb14, GO14, M14, tx, G;

int startTimer;

String message = "Good luck and have fun!";

void setup( )
{
size(600, 600);
Test = 0;
p1x = 50;
p1y = 570;
v1x = 50;
v1y = 70;
p2x = 660;
p2y = 550;
v2x = 1000;
v2y = 70;
p3x = 1560;
p3y = 500;
v3x = 1750;
v3y = 80;
p4x = 2000;
p4y = 60;
v4x = 2320;
v4y = 400;
d4x = 2350;
d4y = 350;
d4mx = 2.5;
d4my = 2.5;
GO4 = 0;
p5x = 2520;
p5y = 110;
v5x = 2860;
v5y = 410;
d5x = 2900;
d5y = 25;
d5mx = 2;
d5my = 2;
GO5 = 0;
p6x = 3050;
p6y = 40;
v6x = 3540;
v6y = 550;
da6x = 3100;
da6y = 450;
db6x = 3460;
db6y = 100;
dc6x = 3410;
dc6y = 330;
da6mx = 2;
da6my = 1.9;
db6mx = 2;
db6my = 1.9;
dc6mx = 2;
dc6my = 1.9;
GO6 = 0;
p7x = 3630;
p7y = 40;
v7x = 3940;
v7y = 520;
da7x = 3680;
da7y = 100;
db7x = 3900;
db7y = 150;
dc7x = 4170;
dc7y = 40;
dd7x = 4010;
dd7y = 70;
da7my = 1.3;
db7mx = 1.3;
dc7my = 1.3;
dd7my = 1.3;
GO7 = 0;
p8x = 4230;
p8y = 30;
v8x = 4770;
v8y = 510;
da8x = 4500;
da8y = 75;
db8x = 4300;
db8y = 430;
dc8x = 4640;
dc8y = 280;
dd8x = 4444;
dd8y = 340;
da8mx = 5;
da8my = 5;
db8mx = 5;
db8my = 5;
dc8mx = 5;
dc8my = 5;
dd8mx = 5;
dd8my = 5;
GO8 = 0;
p9x = 5000;
p9y = 95;
va9x = 5250;
va9y = 530;
vb9x = 4850;
vb9y = 320;
da9x = 5000;
da9y = 260;
db9x = 5260;
db9y = 150;
dc9x = 4900;
dc9y = 550;
da9mx = 2;
da9my = 2.2;
db9mx = 1.5;
db9my = -2.6;
dc9mx = -1.9;
dc9my = -2.4;
v9 = 0;
GO9 = 0;
p10x = 5450;
p10y = 45;
va10x = 5950;
va10y = 370;
vb10x = 5750;
vb10y = 450;
vc10x = 5650;
vc10y = 450;
vd10x = 5450;
vd10y = 370;
d10x = 5700;
d10y = 400;
d10mx = -1.2;
d10my = -1.2;
v10 = 0;
GO10 = 0;
p11x = 6300;
p11y = 300;
va11x = 6150;
va11y = 100;
vb11x = 6450;
vb11y = 100;
vc11x = 6300;
vc11y = 500;
da11x = 6450;
da11y = 550;
db11x = 6150;
db11y = 550;
da11mx = -2.4;
da11my = -2.4;
db11mx = 2.4;
db11my = -2.4;
v11 = 0;
GO11 = 0; 
p12x = 6660;
p12y = 50;
v12x = 6660;
v12y = 150;
c12x = 7050;
c12y = 490;
da12x = 6840;
da12y = 350;
db12x = 6970;
db12y = 405;
da12mx = 1.8;
da12my = 1.8;
db12mx = 1.8;
db12my = 1.8;
captured12 = 0;
GO12 = 0;
p13x = 7700;
p13y = 200;
c13x = 7270;
c13y = 480;
va13x = 7700;
va13y = 500;
vb13x = 7600;
vb13y = 400;
vc13x = 7500;
vc13y = 250;
vd13x = 7550;
vd13y = 100;
da13x = 7450;
da13y = 565;
db13x = 7500;
db13y = 400;
dc13x = 7340;
dc13y = 170;
da13mx = -1;
da13my = 1;
db13mx = 1;
db13my = -1;
dc13mx = 1;
dc13my = 1;
captured13 = 0;
GO13 = 0;
v13 = 0;
p14x = 8300;
p14y = 300;
v14x = 7900;
v14y = 300;
da14x = 8100;
da14y = 150;
db14x = 8150;
db14y = 500;
da14mx = -1;
da14my = 1.25;
db14mx = 1.1;
db14my = -1.1;
GO14 = 0;
tx = 0;
G = 1;
M14 = 0;
startTimer = millis();
}

void draw( )
{
  dis4 = dist(p4x, p4y, d4x, d4y);
  dis5 = dist(p5x, p5y, d5x, d5y);
  disa6 = dist(p6x, p6y, da6x, da6y);
  disb6 = dist(p6x, p6y, db6x, db6y);
  disc6 = dist(p6x, p6y, dc6x, dc6y);
  disa7 = dist(p7x, p7y, da7x, da7y);
  disb7 = dist(p7x, p7y, db7x, db7y);
  disc7 = dist(p7x, p7y, dc7x, dc7y);
  disa8 = dist(p8x, p8y, da8x, da8y);
  disb8 = dist(p8x, p8y, db8x, db8y);
  disc8 = dist(p8x, p8y, dc8x, dc8y);
  disd8 = dist(p8x, p8y, dd8x, dd8y);
  disa9 = dist(p9x, p9y, da9x, da9y);
  disb9 = dist(p9x, p9y, db9x, db9y);
  disc9 = dist(p9x, p9y, dc9x, dc9y);
  dis10 = dist(p10x, p10y, d10x, d10y);
  disa11 = dist(p11x, p11y, da11x, da11y);
  disb11 = dist(p11x, p11y, db11x, db11y);
  disa12 = dist(p12x, p12y, da12x, da12y);
  disb12 = dist(p12x, p12y, db12x, db12y);
  disa13 = dist(p13x, p13y, da13x, da13y);
  disb13 = dist(p13x, p13y, db13x, db13y);
  disc13 = dist(p13x, p13y, dc13x, dc13y);
  disa14 = dist(p14x, p14y, da14x, da14y);
  disb14 = dist(p14x, p14y, db14x, db14y);

//Game 1
if (millis() - startTimer < 2500)
  {
  textSize(30);
  fill(0);
  text(message, 100, 100);
  
  }
  else
  {


background(250, 20, 39);
translate (tx, 0);
fill(250, 255, 3);
ellipse(p1x, p1y, 20, 20);
fill(3, 67, 255);
ellipse(v1x, v1y, 40, 40);
if (p1y + 10 >= height || p1y <= 0)
{
  p1y = 0;
}
if (key == CODED)
{
  if (keyCode == UP && G == 1)
  {
    p1y -= 2;
  }
}
if (p1y <= v1y + 30 && p1y >= v1y - 30)
{
//  message = "Level 1 complete!";
//  startTimer = millis();
  p1y = p1x = -10000; 
  tx = -600;
  G = 2;
}
//Game 2
fill(250, 255, 3);
ellipse(p2x, p2y, 50, 50);
fill(3, 67, 255);
ellipse(v2x, v2y, 20, 20);
if (p2y + 30 >= height)
{
  p2y -= 1;
}
if (p2y <= 30)
{
  p2y += 1;
}
if (p2x <= 630)
{
  p2x += 1;
}
if (p2x >= 1170)
{
  p2x -= 1;
}
if (key == CODED)
{
  if (keyCode == UP && G == 2)
  {
    p2y -= 1;
  }
  if (keyCode == RIGHT && G == 2)
  {
    p2x += 1;
  }
if (keyCode == LEFT && G == 2)
  {
    p2x -= 1;
  }
  if (keyCode == DOWN && G == 2)
  {
    p2y += 1;
  }
}
if (p2y <= v2y + 30 && p2y >= v2y - 30 && p2x <= v2x + 30 && p2x >= v2x - 30)
{
//  message = "Level 2 complete!";
//  startTimer = millis();
  p2y = p2x = -10000;
  tx = -1200;
  G = 3;
}
//Game 3
fill(250, 255, 3);
ellipse(p3x, p3y, 35, 35);
fill(3, 67, 255);
ellipse(v3x, v3y, 70, 15);
if (p3y + 30 >= height)
{
  p3y -= 1;
}
if (p3y <= 30)
{
  p3y += 10;
}
if (p3x <= 1230)
{
  p3x += 10;
}
if (p3x >= 1770)
{
  p3x -= 1;
}
if (key == CODED)
{
  if (keyCode == UP && G == 3)
  {
    p3y -= 10;
  }
  if (keyCode == RIGHT && G == 3)
  {
    p3x += 1;
  }
if (keyCode == LEFT && G == 3)
  {
    p3x -= 10;
  }
  if (keyCode == DOWN && G == 3)
  {
    p3y += 1;
  }
}
if (p3y <= v3y + 20 && p3y >= v3y - 20 && p3x <= v3x + 60 && p3x >= v3x - 60)
{
//  message = "Level 3 complete!";
//  startTimer = millis();
  p3y = p3x = -10000;
  tx = -1800;
  G = 4;
}
//Game 4
fill(250, 255, 3);
ellipse(p4x, p4y, 35, 35);
fill(3, 67, 255);
ellipse(v4x, v4y, 35, 35);
fill(41, 242, 32);
ellipse(d4x, d4y, 35, 35);
if (G == 4)
{
d4x = d4x + d4mx;
d4y = d4y + d4my;
}
if((d4x >= 2400 || d4x <= 1800) && (G == 4)) 
{
  d4mx = -d4mx;
}
if((d4y >= 600 || d4y <= 0) && (G == 4)) 
{
  d4my = -d4my;
}
if (p4y + 30 >= height)
{
  p4y -= 1;
}
if (p4y <= 30)
{
  p4y += 1;
}
if (p4x <= 1830)
{
  p4x += 1;
}
if (p4x >= 2370)
{
  p4x -= 1;
}
if (key == CODED)
{
  if (keyCode == UP && G == 4)
  {
    p4y -= 1;
  }
  if (keyCode == RIGHT && G == 4)
  {
    p4x += 1;
  }
if (keyCode == LEFT && G == 4)
  {
    p4x -= 1;
  }
  if (keyCode == DOWN && G == 4)
  {
    p4y += 1;
  }
}
dis4 = dist(p4x, p4y, d4x, d4y);
if ( dis4 <= ( 35 ) )
{
//  fill(8, 5, 5);
//  textSize(50);
//  message = "You lose.";
//  startTimer = millis();
  noLoop();
  GO4 = 1;
  
}

if (p4y <= v4y + 30 && p4y >= v4y - 30 && p4x <= v4x + 30 && p4x >= v4x - 30)
{
//  message = "Level 4 complete!\n You beat your first real level!";
//  startTimer = millis();
  p4y = p4x = -1000;
  tx = -2400;
  G = 5;
}

//Game 5
fill(250, 255, 3);
ellipse(p5x, p5y, 70, 70);
fill(3, 67, 255);
ellipse(v5x, v5y, 50, 50);
fill(41, 242, 32);
ellipse(d5x, d5y, 10, 10);
if (G == 5)
{
d5x = d5x + d5mx;
d5y = d5y + d5my;
}
if((d5x >= 3000 || d5x <= 2400) && (G == 5)) 
{
  d5mx = -d5mx;
}
if((d5y >= 600 || d5y <= 0) && (G == 5)) 
{
  d5my = -d5my;
}
if (p5y + 40 >= height)
{
  p5y -= 0.65;
}
if (p5y <= 40)
{
  p5y += 0.65;
}
if (p5x <= 2430)
{
  p5x += 0.65;
}
if (p5x >= 2970)
{
  p5x -= 0.65;
}
if (key == CODED)
{
  if (keyCode == UP && G == 5)
  {
    p5y -= 0.65;
  }
  if (keyCode == RIGHT && G == 5)
  {
    p5x += 0.65;
  }
if (keyCode == LEFT && G == 5)
  {
    p5x -= 0.65;
  }
  if (keyCode == DOWN && G == 5)
  {
    p5y += 0.65;
  }
}
if (dis5 <= (40))
{
//  fill(8, 5, 5);
//  textSize(50);
//  message = "You lose.";
//  startTimer = millis();
  noLoop();
  GO5 = 1;
}
if (p5y <= v5y + 60 && p5y >= v5y - 60 && p5x <= v5x + 60 && p5x >= v5x - 60)
{
//  message = "Level 5 complete!";
//  startTimer = millis();
  p5y = p5x = -1000;
  tx = -3000;
  G = 6;
}
//Game 6
fill(250, 255, 3);
ellipse(p6x, p6y, 35, 35);
fill(3, 67, 255);
ellipse(v6x, v6y, 35, 35);
fill(41, 242, 32);
ellipse(da6x, da6y, 25, 25);
ellipse(db6x, db6y, 25, 25);
ellipse(dc6x, dc6y, 25, 25);
if (G == 6)
{
da6x = da6x + da6mx;
da6y = da6y + da6my;
db6x = db6x + db6mx;
db6y = db6y + db6my;
dc6x = dc6x + dc6mx;
dc6y = dc6y + dc6my;
}
if((da6x >= 3600 || da6x <= 3000) && (G == 6)) 
{
  da6mx = -da6mx;
}
if((da6y >= 600 || da6y <= 0) && (G == 6)) 
{
  da6my = -da6my;
}
if((db6x >= 3600 || db6x <= 3000) && (G == 6)) 
{
  db6mx = -db6mx;
}
if((db6y >= 600 || db6y <= 0) && (G == 6)) 
{
  db6my = -db6my;
}
if((dc6x >= 3600 || dc6x <= 3000) && (G == 6)) 
{
  dc6mx = -dc6mx;
}
if((dc6y >= 600 || dc6y <= 0) && (G == 6)) 
{
  dc6my = -dc6my;
}
if (p6y + 25 >= height)
{
  p6y -= 1.25;
}
if (p6y <= 40)
{
  p6y += 1.25;
}
if (p6x <= 3030)
{
  p6x += 1.25;
}
if (p6x >= 3570)
{
  p6x -= 1.25;
}
if (key == CODED)
  {
  if (keyCode == UP && G == 6)
  {
    p6y -= 1.25;
  }
  if (keyCode == RIGHT && G == 6)
  {
    p6x += 1.25;
  }
  if (keyCode == LEFT && G == 6)
  {
    p6x -= 1.25;
  }
  if (keyCode == DOWN && G == 6)
  {
    p6y += 1.25;
  }
}
if (disa6 <= (30))
{
//  fill(8, 5, 5);
//  textSize(50);
//  message = "You lose.";
//  startTimer = millis();
  noLoop();
  GO6 = 1;
}
if (disb6 <= (30))
{
//  fill(8, 5, 5);
//  message = "You lose.";
//  startTimer = millis();
  noLoop();
  GO6 = 1;
}
if (disc6 <= (30))
{
//  fill(8, 5, 5);
//  message = "You lose.";
//  startTimer = millis();
  noLoop();
  GO6 = 1;
}
if (p6y <= v6y + 30 && p6y >= v6y - 30 && p6x <= v6x + 30 && p6x >= v6x - 30)
{
//  message = "Level 6 complete!";
//  startTimer = millis();
  p6y = p6x = -1000;
  tx = -4200;
  G = 8;
}
////Game 7
//fill(250, 255, 3);
//ellipse(p7x, p7y, 35, 35);
//fill(3, 67, 255);
//ellipse(v7x, v7y, 35, 35);
//fill(41, 242, 32);
//ellipse(da7x, da7y, 25, 25);
//ellipse(db7x, db7y, 25, 25);
//ellipse(dc7x, dc7y, 25, 25);
//ellipse(dd7x, dd7y, 25, 25);
//if (G == 7)
//{
//  da7y = da7y + da7my;
//  db7x = db7x + db7mx;
//  dc7y = dc7y + dc7my;
//  dd7y = dd7y + dd7my;
//}
//if((da7y >= 600 || da7y <= 0) && (G == 7)) 
//{
//  da7my = -da7my;
//}
//if((db7x >= 4200 || db7x <= 3600) && (G == 7)) 
//{
//  db7mx = -db7mx;
//}
//if((dc7y >= 600 || dc7y <= 0) && (G == 7)) 
//{
//  dc7my = -dc7my;
//}
//if((dd7y >= 600 || dd7y <= 0) && (G == 7)) 
//{
//  dd7my = -dd7my;
//}
//if (p7y + 25 >= height)
//{
//  p7y -= 1.75;
//}
//if (p7y <= 40)
//{
//  p7y += 1.75;
//}
//if (p7x <= 3630)
//{
//  p7x += 1.75;
//}
//if (p7x >= 4170)
//{
//  p7x -= 1.75;
//}
//if (key == CODED)
//  {
//  if (keyCode == UP && G == 7)
//  {
//    p7y -= 1.75;
//  }
//  if (keyCode == RIGHT && G == 7)
//  {
//    p7x += 1.75;
//  }
//  if (keyCode == LEFT && G == 7)
//  {
//    p7x -= 1.75;
//  }
//  if (keyCode == DOWN && G == 7)
//  {
//    p7y += 1.75;
//  }
//}
//if (disa7 <= (30))
//{
////  fill(8, 5, 5);
////  message = "You lose.";
////  startTimer = millis();
//  noLoop();
//  GO7 = 1;
//}
//if (disb7 <= (30))
//{
////  fill(8, 5, 5);
////  message = "You lose.";
////  startTimer = millis();
//  noLoop();
//  GO7 = 1;
//}
//if (disc7 <= (30))
//{
////  fill(8, 5, 5);
////  message = "You lose.";
////  startTimer = millis();
//  noLoop();
//  GO7 = 1;
//}
//if (disd7 <= (30))
//{
////  fill(8, 5, 5);
////  message = "You lose.";
////  startTimer = millis();
//  noLoop();
//  GO7 = 1;
//}
//if (p7y <= v7y + 30 && p7y >= v7y - 30 && p7x <= v7x + 30 && p7x >= v7x - 30)
//{
////  message = "Level 7 complete!";
////  startTimer = millis();
//  p7y = p7x = -1000;
//  tx = -4200;
//  G = 8;
//}
//Game 8
fill(250, 255, 3);
ellipse(p8x, p8y, 25, 25);
fill(3, 67, 255);
ellipse(v8x, v8y, 25, 25);
fill(41, 242, 32);
ellipse(da8x, da8y, 25, 25);
ellipse(db8x, db8y, 25, 25);
ellipse(dc8x, dc8y, 25, 25);
ellipse(dd8x, dd8y, 25, 25);
line(4260, 0, 4260, 600);
line(4320, 0, 4320, 600);
line(4380, 0, 4380, 600);
line(4440, 0, 4440, 600);
line(4500, 0, 4500, 600);
line(4560, 0, 4560, 600);
line(4620, 0, 4620, 600);
line(4680, 0, 4680, 600);
line(4740, 0, 4740, 600);
line(4200, 60, 4800, 60);
line(4200, 120, 4800, 120);
line(4200, 180, 4800, 180);
line(4200, 240, 4800, 240);
line(4200, 300, 4800, 300);
line(4200, 360, 4800, 360);
line(4200, 420, 4800, 420);
line(4200, 480, 4800, 480);
line(4200, 540, 4800, 540);
if (G == 8)
{
  da8x = da8x + da8mx;
  da8y = da8y + da8my;
  db8x = db8x + db8mx;
  db8y = db8y + db8my;
  dc8x = dc8x + dc8mx;
  dc8y = dc8y + dc8my;
  dd8x = dd8x + dd8mx;
  dd8y = dd8y + dd8my;
}
if((da8x >= 4800 || da8x <= 4200) && (G == 8)) 
{
  da8mx = -da8mx;
}
if((da8y >= 600 || da8y <= 0) && (G == 8)) 
{
  da8my = -da8my;
}
if((db8x >= 4800 || db8x <= 4200) && (G == 8)) 
{
  db8mx = -db8mx;
}
if((db8y >= 600 || db8y <= 0) && (G == 8)) 
{
  db8my = -db8my;
}
if((dc8x >= 4800 || dc8x <= 4200) && (G == 8)) 
{
  dc8mx = -dc8mx;
}
if((dc8y >= 600 || dc8y <= 0) && (G == 8)) 
{
  dc8my = -dc8my;
}
if((dd8x >= 4800 || dd8x <= 4200) && (G == 8)) 
{
  dd8mx = -dd8mx;
}
if((dd8y >= 600 || dd8y <= 0) && (G == 8)) 
{
  dd8my = -dd8my;
}
if (p8y + 25 >= height)
{
  p8y = 575;
}
if (p8y <= 25)
{
  p8y = 25;
}
if (p8x <= 4230)
{
  p8x = 4230;
}
if (p8x >= 4770)
{
  p8x = 4770;
}
if (disa8 <= (25))
{
//  fill(8, 5, 5);
//  textSize(50);
//  message = "You lose.\nWHA????";
//  startTimer = millis();
  noLoop();
  GO8 = 1;
}
if (disb8 <= (25))
{
//  fill(8, 5, 5);
//  textSize(50);
//  message = "You lose.\nWHA????";
//  startTimer = millis();
  noLoop();
  GO8 = 1;
}
if (disc8 <= (25))
{
//  fill(8, 5, 5);
//  textSize(50);
//  message = "You lose.\nWHA????";
//  startTimer = millis();
  noLoop();
  GO8 = 1;
}
if (disd8 <= (25))
{
//  fill(8, 5, 5);
//  textSize(50);
//  message = "You lose.\nWHA????";
//  startTimer = millis();
  noLoop();
  GO8 = 1;
}
if (p8y <= v8y + 25 && p8y >= v8y - 25 && p8x <= v8x + 25 && p8x >= v8x - 25)
{
//  message = "Level 8 complete!/n*Trumpet horn*";
//  startTimer = millis();
  p8y = p8x = -1000;
  tx = -4800;
  G = 9;
}
  
//Game 9
fill(250, 255, 3);
ellipse(p9x, p9y, 25, 25);
fill(3, 67, 255);
ellipse(va9x, va9y, 25, 25);
ellipse(vb9x, vb9y, 25, 25);
fill(41, 242, 32);
ellipse(da9x, da9y, 25, 25);
ellipse(db9x, db9y, 25, 25);
ellipse(dc9x, dc9y, 25, 25);
if (G == 9)
{
  da9x = da9x + da9mx;
  da9y = da9y + da9my;
  db9x = db9x + db9mx;
  db9y = db9y + db9my;
  dc9x = dc9x + dc9mx;
  dc9y = dc9y + dc9my;
}
if((da9x >= 5400 || da9x <= 4800) && (G == 9)) 
{
  da9mx = -da9mx;
}
if((da9y >= 600 || da9y <= 0) && (G == 9)) 
{
  da9my = -da9my;
}
if((db9x >= 5400 || db9x <= 4800) && (G == 9)) 
{
  db9mx = -db9mx;
}
if((db9y >= 600 || db9y <= 0) && (G == 9)) 
{
  db9my = -db9my;
}
if((dc9x >= 5400 || dc9x <= 4800) && (G == 9)) 
{
  dc9mx = -dc9mx;
}
if((dc9y >= 600 || dc9y <= 0) && (G == 9)) 
{
  dc9my = -dc9my;
}
if (p9y + 25 >= height)
{
  p9y = 575;
}
if (p9y <= 25)
{
  p9y = 25;
}
if (p9x <= 4830)
{
  p9x = 4830;
}
if (p9x >= 5470)
{
  p9x = 5470;
}
if (key == CODED)
{
  if (keyCode == UP && G == 9)
  {
    p9y -= 1.8;
  }
  if (keyCode == RIGHT && G == 9)
  {
    p9x += 1.8;
  }
  if (keyCode == LEFT && G == 9)
  {
    p9x -= 1.8;
  }
  if (keyCode == DOWN && G == 9)
  {
    p9y += 1.8;
  }
}
if (disa9 <= (25))
{
//  fill(8, 5, 5);
//  textSize(50);
//  message = "You lose.\nMUAHAHAHAHAHAHA!";
//  startTimer = millis();
  noLoop();
  GO9 = 1;
}
if (disb9 <= (25))
{
//  fill(8, 5, 5);
//  textSize(50);
//  message = "You lose.\nMUAHAHAHAHAHAHA!";
//  startTimer = millis();
  noLoop();
  GO9 = 1;
}
if (disc9 <= (25))
{
//  fill(8, 5, 5);
//  textSize(50);
//  message = "You lose.\nMUAHAHAHAHAHAHA!";
//  startTimer = millis();
  noLoop();
  GO9 = 1;
}
if (p9y <= va9y + 25 && p9y >= va9y - 25 && p9x <= va9x + 25 && p9x >= va9x - 25)
{
  v9 = v9 + 1;
  va9x = va9y = -1000;
  if (v9 == 2)
  {
//  message = "Level 9 complete!";
//  startTimer = millis();
  p9y = p9x = -1000;
  tx = -5400;
  G = 10;
  v9 = 0;
  }
}
  if (p9y <= vb9y + 25 && p9y >= vb9y - 25 && p9x <= vb9x + 25 && p9x >= vb9x - 25)
{
  v9 = v9 + 1;
  vb9x = vb9y = -1000;
  if (v9 == 2)
  {
//    message = "Level 9 complete!";
//    startTimer = millis();
    p9y = p9x = -1000;
    tx = -5400;
    G = 10;
    v9 = 0;
  }
}

//Game 10
fill(250, 255, 3);
ellipse(p10x, p10y, 30, 30);
fill(3, 67, 255);
ellipse(va10x, va10y, 30, 30);
ellipse(vb10x, vb10y, 30, 30);
ellipse(vc10x, vc10y, 30, 30);
ellipse(vd10x, vd10y, 30, 30);
fill(41, 242, 32);
ellipse(d10x, d10y, 200, 200);
if (G == 10)
{
d10x = d10x + d10mx;
d10y = d10y + d10my;
}
if((d10x >= 6000 || d10x <= 5400) && (G == 10)) 
{
  d10mx = -d10mx;
}
if((d10y >= 600 || d10y <= 0) && (G == 10)) 
{
  d10my = -d10my;
}
if (p10y + 30 >= height)
{
  p10y = 570;
}
if (p10y <= 30)
{
  p10y = 30;
}
if (p10x <= 5430)
{
  p10x = 5430;
}
if (p10x >= 5970)
{
  p10x = 5970;
}
if (key == CODED)
{
  if (keyCode == UP && G == 10)
  {
    p10y -= 1;
  }
  if (keyCode == RIGHT && G == 10)
  {
    p10x += 1;
  }
if (keyCode == LEFT && G == 10)
  {
    p10x -= 1;
  }
  if (keyCode == DOWN && G == 10)
  {
    p10y += 1;
  }
}
if (dis10 <= (105))
{
//  fill(8, 5, 5);
//  textSize(20);
//  message = "You lose to the/clutches of Voldemort!";
//  startTimer = millis();
  noLoop();
  GO10 = 1;
}
if (p10y <= va10y + 30 && p10y >= va10y - 30 && p10x <= va10x + 30 && p10x >= va10x - 30)
{
  v10 = v10 + 1;
  va10x = va10y = -1000;
  if (v10 == 4)
  {
//  message = "Level 10 complete!";
//  startTimer = millis();
  p10y = p10x = -1000;
  tx = -6000;
  G = 11;
  v10 = 0;
  }
}
  if (p10y <= vb10y + 30 && p10y >= vb10y - 30 && p10x <= vb10x + 30 && p10x >= vb10x - 30)
{
  v10 = v10 + 1;
  vb10x = vb10y = -1000;
  if (v10 == 4)
  {
//  message = "Level 10 complete!";
//  startTimer = millis();
  p10y = p10x = -1000;
  tx = -6000;
  G = 11;
  v10 = 0;
  }
}
  if (p10y <= vc10y + 30 && p10y >= vc10y - 30 && p10x <= vc10x + 30 && p10x >= vc10x - 30)
{
  v10 = v10 + 1;
  vc10x = vc10y = -1000;
  if (v10 == 4)
  {
//  message = "Level 10 complete!";
//  startTimer = millis();
  p10y = p10x = -1000;
  tx = -6000;
  G = 11;
  v10 = 0;
  }
}
  if (p10y <= vd10y + 30 && p10y >= vd10y - 30 && p10x <= vd10x + 30 && p10x >= vd10x - 30)
{
  v10 = v10 + 1;
  vd10x = vd10y = -1000;
  if (v10 == 4)
  {
//  message = "Level 10 complete!";
//  startTimer = millis();
  p10y = p10x = -1000;
  tx = -6000;
  G = 11;
  v10 = 0;
  }
}
//Game 11
fill(250, 255, 3);
ellipse(p11x, p11y, 30, 30);
fill(3, 67, 255);
ellipse(va11x, va11y, 30, 30);
ellipse(vb11x, vb11y, 30, 30);
ellipse(vc11x, vc11y, 30, 30);
fill(41, 242, 32);
ellipse(da11x, da11y, 30, 30);
ellipse(db11x, db11y, 30, 30);
if (G == 11)
{
  da11x = da11x + da11mx;
  da11y = da11y + da11my;
  db11x = db11x + db11mx;
  db11y = db11y + db11my;
}
if((da11x >= 6600 || da11x <= 6000) && (G == 11)) 
{
  da11mx = -da11mx;
}
if((da11y >= 600 || da11y <= 0) && (G == 11)) 
{
  da11my = -da11my;
}
if((db11x >= 6600 || db11x <= 6000) && (G == 11)) 
{
  db11mx = -db11mx;
}
if((db11y >= 600 || db11y <= 0) && (G == 11)) 
{
  db11my = -db11my;
}
if (p11y + 30 >= height)
{
  p11y = 570;
}
if (p11y <= 30)
{
  p11y = 30;
}
if (p11x <= 6030)
{
  p11x = 6030;
}
if (p11x >= 6570)
{
  p11x = 6570;
}
if (key == CODED)
{
  if (keyCode == UP && G == 11)
  {
    p11y -= 1.2;
  }
  if (keyCode == RIGHT && G == 11)
  {
    p11x += 1.2;
  }
if (keyCode == LEFT && G == 11)
  {
    p11x -= 1.2;
  }
  if (keyCode == DOWN && G == 11)
  {
    p11y += 1.2;
  }
}
if (disa11 <= (30))
{
//  fill(8, 5, 5);
//  textSize(50);
//  message = "You lose.\nSucker!!!\nDon't quit your day job!";
//  startTimer = millis();
  noLoop();
  GO11 = 1;
}
if (disb11 <= (30))
{
//  fill(8, 5, 5);
//  textSize(50);
//  message = "You lose.\nSucker!!!\nDon't quit your day job!";
//  startTimer = millis();
  noLoop();
  GO11 = 1;
}
if (p11y <= va11y + 30 && p11y >= va11y - 30 && p11x <= va11x + 30 && p11x >= va11x - 30)
{
  v11 = v11 + 1;
  va11x = va11y = -1000;
  if (v11 == 3)
  {
//  message = "Level 11 complete!";
//  startTimer = millis();
  p11y = p11x = -1000;
  tx = -6600;
  G = 12;
  v11 = 0;
  }
}
  if (p11y <= vb11y + 30 && p11y >= vb11y - 30 && p11x <= vb11x + 30 && p11x >= vb11x - 30)
{
  v11 = v11 + 1;
  vb11x = vb11y = -1000;
  if (v11 == 3)
  {
//  message = "Level 11 complete!";
//  startTimer = millis();
  p11y = p11x = -1000;
  tx = -6600;
  G = 12;
  v11 = 0; 
  }
}
  if (p11y <= vc11y + 30 && p11y >= vc11y - 30 && p11x <= vc11x + 30 && p11x >= vc11x - 30)
{
  v11 = v11 + 1;
  vc11x = vc11y = -1000;
  if (v11 == 3)
  {
//  message = "Level 11 complete!";
//  startTimer = millis();
  p11y = p11x = -1000;
  tx = -6600;
  G = 12;
  v11 = 0;
  }
}

//Game 12
fill(250, 255, 3);
ellipse(p12x, p12y, 30, 30);
fill(3, 67, 255);
ellipse(c12x, c12y, 30, 30);
println(captured12);
if (int(captured12) == 0)
 {
  fill(41, 242, 32);
 }
else if (int(captured12) == 1)
 {
   fill(3, 67, 255);
 }
ellipse(v12x, v12y, 30, 30);
fill(41, 242, 32);
ellipse(da12x, da12y, 30, 30);
ellipse(db12x, db12y, 30, 30);
if (G == 12)
{
  da12x = da12x + da12mx;
  da12y = da12y + da12my;
  db12x = db12x + db12mx;
  db12y = db12y + db12my;
}
if((da12x >= 7200 || da12x <= 6600) && (G == 12)) 
{
  da12mx = -da12mx;
}
if((da12y >= 600 || da12y <= 0) && (G == 12)) 
{
  da12my = -da12my;
}
if((db12x >= 7200 || db12x <= 6600) && (G == 12)) 
{
  db12mx = -db12mx;
}
if((db12y >= 600 || db12y <= 0) && (G == 12)) 
{
  db12my = -db12my;
}
if (p12y + 30 >= height)
{
  p12y = 570;
}
if (p12y <= 30)
{
  p12y = 30;
}
if (p12x <= 6630)
{
  p12x = 6630;
}
if (p12x >= 7170)
{
  p12x = 7170;
}
if (key == CODED)
{
  if (keyCode == UP && G == 12)
  {
    p12y -= 1.6;
  }
  if (keyCode == RIGHT && G == 12)
  {
    p12x += 1.6;
  }
if (keyCode == LEFT && G == 12)
  {
    p12x -= 1.6;
  }
  if (keyCode == DOWN && G == 12)
  {
    p12y += 1.6;
  }
}
if (disa12 <= (30))
{
//  fill(8, 5, 5);
//  textSize(50);
//  message = "You lose.";
//  startTimer = millis();
  noLoop( );
  GO12 = 1;
}
if (disb12 <= (30))
{
//  fill(8, 5, 5);
//  textSize(50);
//  message = "You lose.";
//  startTimer = millis();
  noLoop();
  GO12 = 1;
}
if (p12y <= v12y + 30 && p12y >= v12y - 30 && p12x <= v12x + 30 && p12x >= v12x - 30 && captured12 == 1)
{
  v12x = v12y = -1000;
  {
//  message = "Level 12 complete!";
//  startTimer = millis();
  p12y = p12x = -1000;
  tx = -7200;
  G = 13;
  }
}
if (p12y <= v12y + 30 && p12y >= v12y - 30 && p12x <= v12x + 30 && p12x >= v12x - 30 && captured12 == 0)
{
  p12x = p12y = -10000;
//  fill(8, 5, 5);
//  textSize(50);
//  message = "You lose.";
//  startTimer = millis();
  noLoop();
  GO12 = 1;
  }
  if (p12y <= c12y + 30 && p12y >= c12y - 30 && p12x <= c12x + 30 && p12x >= c12x - 30)
{
  c12x = c12y = -1000;
  captured12 = 1;
//  fill(8, 5, 5);
//  textSize(20);
//  message = "You captured a civilian!\nRun to the goal!";
//  startTimer = millis();
}
//Game 13
fill(250, 255, 3);
ellipse(p13x, p13y, 30, 30);
fill(3, 67, 255);
ellipse(c13x, c13y, 30, 30);
println(captured13 + "  " + frameCount);
if (int(captured13) == 0)
 {
  fill(41, 242, 32);
 }
else if (int(captured13) == 1)
 {
   fill(3, 67, 255);
 }
ellipse(va13x, va13y, 30, 30);
ellipse(vb13x, vb13y, 30, 30);
ellipse(vc13x, vc13y, 30, 30);
ellipse(vd13x, vd13y, 30, 30);
fill(41, 242, 32);
ellipse(da13x, da13y, 30, 30);
ellipse(db13x, db13y, 30, 30);
ellipse(dc13x, dc13y, 30, 30);
if (G == 13)
{
  da13x = da13x + da13mx;
  da13y = da13y + da13my;
  db13x = db13x + db13mx;
  db13y = db13y + db13my;
  dc13x = dc13x + dc13mx;
  dc13y = dc13y + dc13my;
}
if((da13x >= 7800 || da13x <= 7200) && (G == 13)) 
{
  da13mx = -1.1*da13mx;
}
if((da13y >= 600 || da13y <= 0) && (G == 13)) 
{
  da13my = -1.1*da13my;
}
if((db13x >= 7800 || db13x <= 7200) && (G == 13)) 
{
  db13mx = -1.1*db13mx;
}
if((db13y >= 600 || db13y <= 0) && (G == 13)) 
{
  db13my = -1.1*db13my;
}
if((dc13x >= 7800 || dc13x <= 7200) && (G == 13))
{
  dc13mx = -1.1*dc13mx;
}
if((dc13y >= 600 || dc13y <= 0) && (G == 13)) 
{
  dc13my = -1.1*dc13my;
}
if (p13y + 30 >= height)
{
  p13y = 570;
}
if (p13y <= 30)
{
  p13y = 30;
}
if (p13x <= 7230)
{
  p13x = 7230;
}
if (p13x >= 7770)
{
  p13x = 7770;
}
if (key == CODED)
{
  if (keyCode == UP && G == 13)
  {
    p13y -= 2;
  }
  if (keyCode == RIGHT && G == 13)
  {
    p13x += 2;
  }
  if (keyCode == LEFT && G == 13)
  {
    p13x -= 2;
  }
  if (keyCode == DOWN && G == 13)
  {
    p13y += 2;
  }
}
if (disa13 <= (30))
{
//  fill(8, 5, 5);
//  textSize(50);
//  message = "You lose.";
//  startTimer = millis();
  noLoop( );
  GO13 = 1;
}
if (disb13 <= (30))
{
//  fill(8, 5, 5);
//  textSize(50);
//  message = "You lose.";
//  startTimer = millis();
  noLoop();
  GO13 = 1;
}
if (disc13 <= (30))
{
//  fill(8, 5, 5);
//  textSize(50);
//  message = "You lose.";
//  startTimer = millis();
  noLoop();
  GO13 = 1;
}
if (p13y <= va13y + 30 && p13y >= va13y - 30 && p13x <= va13x + 30 && p13x >= va13x - 30 && captured13 == 1)
{
  va13x = va13y = -1000;
  v13 = v13 + 1;
  if (v13 == 4)
  {
//  message = "Level 12 complete!";
//  startTimer = millis();
  p13y = p13x = -1000;
  tx = -7800;
  G = 14;
  }
}
if (p13y <= vb13y + 30 && p13y >= vb13y - 30 && p13x <= vb13x + 30 && p13x >= vb13x - 30 && captured13 == 1)
{
  vb13x = vb13y = -1000;
  v13 = v13 + 1;
  if (v13 == 4)
  {
//  message = "Level 12 complete!";
//  startTimer = millis();
  p13y = p13x = -1000;
  tx = -7800;
  G = 14;
  }
}
if (p13y <= vc13y + 30 && p13y >= vc13y - 30 && p13x <= vc13x + 30 && p13x >= vc13x - 30 && captured13 == 1)
{
  vc13x = vc13y = -1000;
  v13 = v13 + 1;
  if (v13 == 4)
  {
//  message = "Level 12 complete!";
//  startTimer = millis();
  p13y = p13x = -1000;
  tx = -7800;
  G = 14;
  }
}
if (p13y <= vd13y + 30 && p13y >= vd13y - 30 && p13x <= vd13x + 30 && p13x >= vd13x - 30 && captured13 == 1)
{
  vd13x = vd13y = -1000;
  v13 = v13 + 1;
  if (v13 == 4)
  {
//  message = "Level 12 complete!";
//  startTimer = millis();
  p13y = p13x = -1000;
  tx = -7800;
  G = 14;
  }
}
if (p13y <= va13y + 30 && p13y >= va13y - 30 && p13x <= va13x + 30 && p13x >= va13x - 30 && captured13 == 0)
{
  p13x = p13y = -10000;
//  fill(8, 5, 5);
//  textSize(50);
//  message = "You lose.";
//  startTimer = millis();
  noLoop();
  GO13 = 1;
  }
if (p13y <= vb13y + 30 && p13y >= vb13y - 30 && p13x <= vb13x + 30 && p13x >= vb13x - 30 && captured13 == 0)
{
  p13x = p13y = -10000;
//  fill(8, 5, 5);
//  textSize(50);
//  message = "You lose.";
//  startTimer = millis();
  noLoop();
  GO13 = 1;
  }
  if (p13y <= vc13y + 30 && p13y >= vc13y - 30 && p13x <= vc13x + 30 && p13x >= vc13x - 30 && captured13 == 0)
{
  p13x = p13y = -10000;
//  fill(8, 5, 5);
//  textSize(50);
//  message = "You lose.";
//  startTimer = millis();
  noLoop();
  GO13 = 1;
  }
  if (p13y <= vd13y + 30 && p13y >= vd13y - 30 && p13x <= vd13x + 30 && p13x >= vd13x - 30 && captured13 == 0)
{
//  fill(8, 5, 5);
//  textSize(50);
//  message = "You lose.";
//  startTimer = millis();
  noLoop();
  GO13 = 1;
  }
  if (p13y <= c13y + 30 && p13y >= c13y - 30 && p13x <= c13x + 30 && p13x >= c13x - 30)
{
  c13x = c13y = -1000;
  captured13 = 1;
//  fill(8, 5, 5);
//  textSize(20);
//  message = "You captured a civilian!\nRun to the goals!";
//  startTimer = millis();
}
//Game 14
fill(250, 255, 3);
ellipse(p14x, p14y, 30, 30);
fill(3, 67, 255);
ellipse(v14x, v14y, 30, 30);
fill(41, 242, 32);
ellipse(da14x, da14y, 30, 30);
ellipse(db14x, db14y, 30, 30);
if (G == 14)
{
da14x = da14x + da14mx;
da14y = da14y + da14my;
db14x = db14x + db14mx;
db14y = db14y + db14my;
}
if((da14x >= 8400 || da14x <= 7800) && (G == 14)) 
{
  da14mx = -1.1*da14mx;
}
if((da14y >= 600 || da14y <= 0) && (G == 14)) 
{
  da14my = -1.1*da14my;
}
if((db14x >= 8400 || db14x <= 7800) && (G == 14)) 
{
  db14mx = -1.1*db14mx;
}
if((db14y >= 600 || db14y <= 0) && (G == 14)) 
{
  db14my = -1.1*db14my;
}
if (p14y + 30 >= height)
{
  p14y = 570;
}
if (p14y <= 30)
{
  p14y = 30;
}
if (p14x <= 7830)
{
  p14x = 7830;
}
if (p14x >= 8370)
{
  p14x = 8370;
}
println( "***** " + key + "  " + keyCode );
if (key == CODED)
{
      println( "Key Pressed ");
  if (keyCode == UP && G == 14)
  {

    p14y -= 1.7;
  }
  if (keyCode == RIGHT && G == 14)
  {
    p14x += 1.7;
  }
if (keyCode == LEFT && G == 14)
  {
    p14x -= 1.7;
  }
  if (keyCode == DOWN && G == 14)
  {
    p14y += 1.7;
  }
}
if ( disa14 <= ( 35 ) )
{
//  fill(8, 5, 5);
//  textSize(50);
//  message = "You lose.";
//  startTimer = millis();
  noLoop();
  GO14 = 1;
}
if ( disb14 <= ( 35 ) )
{
//  fill(8, 5, 5);
//  textSize(50);
//  message = "You lose.";
//  startTimer = millis();
  noLoop();
  GO14 = 1;  
}
if (p14y <= v14y + 30 && p14y >= v14y - 30 && p14x <= v14x + 30 && p14x >= v14x - 30)
{
//  message = "Level 4 complete!\n You beat your first real level!";
//  startTimer = millis();
  p14y = p14x = -1000;
  tx = -2400;
  G = 5;
}
if (p14y <= v14y + 50 && p14y >= v14y - 50 && p14x <= v14x + 50 && p14x >= v14x - 50 && M14 == 0)
{
  v14x = v14x + 400;
  M14 = 1;
}
if (p14y <= v14y + 50 && p14y >= v14y - 50 && p14x <= v14x + 50 && p14x >= v14x - 50 && M14 == 1)
{
  v14x = v14x - 200;
  v14y = v14y - 200;
  M14 = 2;
}
if (p14y <= v14y + 50 && p14y >= v14y - 50 && p14x <= v14x + 50 && p14x >= v14x - 50 && M14 == 2)
{
  
  v14y = v14y + 400;
  M14 = 3;
}
if (p14y <= v14y + 50 && p14y >= v14y - 50 && p14x <= v14x + 50 && p14x >= v14x - 50 && M14 == 3)
{  
  v14x = v14x - 200;
  v14y = v14y - 200;
  M14 = 4;
}
}
}



void mousePressed()
  {
  if (GO4 == 1 && G == 4)
  {
      p4x = 2000;
      p4y = 60;
      v4x = 2320;
      v4y = 400;
      d4x = 2350;
      d4y = 350;
      d4mx = 2.5;
      d4my = 2.5;
      GO4 = 0;
      loop( );
  } 
  if (GO5 == 1 && G == 5)
  {
    p5x = 2520;
    p5y = 110;
    v5x = 2860;
    v5y = 410;
    d5x = 2900;
    d5y = 25;
    d5mx = 2;
    d5my = 2;
    GO5 = 0;
    loop();
  }
  if (GO6 == 1 && G == 6)
  {
    p6x = 3050;
    p6y = 40;
    v6x = 3540;
    v6y = 550;
    da6x = 3100;
    da6y = 450;
    db6x = 3460;
    db6y = 100;
    dc6x = 3410;
    dc6y = 330;
    da6mx = 2;
    da6my = 1.9;
    db6mx = 2;
    db6my = 1.9;
    dc6mx = 2;
    dc6my = 1.9;
    GO6 = 0;
    loop();
  }
  if (GO7 == 1 && G == 7)
  {
    p7x = 3630;
    p7y = 40;
    v7x = 3940;
    v7y = 520;
    da7x = 3680;
    da7y = 100;
    db7x = 3900;
    db7y = 150;
    dc7x = 4170;
    dc7y = 40;
    dd7x = 4010;
    dd7y = 70;
    da7my = 1.3;
    db7mx = 1.3;
    dc7my = 1.3;
    dd7my = 1.3;
    GO7 = 0; 
    loop();
  }
  if (GO8 == 1 && G == 8)
  {
    p8x = 4230;
    p8y = 30;
    v8x = 4770;
    v8y = 510;
    da8x = 4500;
    da8y = 75;
    db8x = 4300;
    db8y = 430;
    dc8x = 4640;
    dc8y = 280;
    dd8x = 4444;
    dd8y = 340;
    da8mx = 5;
    da8my = 5;
    db8mx = 5;
    db8my = 5;
    dc8mx = 5;
    dc8my = 5;
    dd8mx = 5;
    dd8my = 5;
    GO8 = 0; 
    loop();
  }
  if (GO9 == 1 && G == 9)
  {
    p9x = 5000;
    p9y = 95;
    va9x = 5250;
    va9y = 530;
    vb9x = 4850;
    vb9y = 320;
    da9x = 5000;
    da9y = 260;
    db9x = 5260;
    db9y = 150;
    dc9x = 4900;
    dc9y = 550;
    da9mx = 2;
    da9my = 2.2;
    db9mx = 1.5;
    db9my = -2.6;
    dc9mx = -1.9;
    dc9my = -2.4;
    v9 = 0;
    GO9 = 0; 
    loop();
  }
  if (GO10 == 1 && G == 10)
  {
    p10x = 5450;
    p10y = 45;
    va10x = 5950;
    va10y = 370;
    vb10x = 5750;
    vb10y = 450;
    vc10x = 5650;
    vc10y = 450;
    vd10x = 5450;
    vd10y = 370;
    d10x = 5700;
    d10y = 400;
    d10mx = -1.2;
    d10my = -1.2;
    v10 = 0;
    GO10 = 0; 
    loop();
  }
  if (GO11 == 1 && G == 11)
  {
    p11x = 6300;
    p11y = 300;
    va11x = 6150;
    va11y = 100;
    vb11x = 6450;
    vb11y = 100;
    vc11x = 6300;
    vc11y = 500;
    da11x = 6450;
    da11y = 550;
    db11x = 6150;
    db11y = 550;
    da11mx = -2.4;
    da11my = -2.4;
    db11mx = 2.4;
    db11my = -2.4;
    v11 = 0;
    GO11 = 0; 
    loop();
  }
  if (GO12 == 1 && G == 12)
  {
  p12x = 6660;
  p12y = 50;
  v12x = 6660;
  v12y = 150;
  c12x = 7050;
  c12y = 490;
  da12x = 6840;
  da12y = 350;
  db12x = 6970;
  db12y = 405;
  da12mx = 1.8;
  da12my = 1.8;
  db12mx = 1.8;
  db12my = 1.8;
  loop();
  }
  if (GO13 == 1 && G == 12)
  {
  p13x = 7700;
  p13y = 200;
  c13x = 7270;
  c13y = 480;
  va13x = 7700;
  va13y = 500;
  vb13x = 7600;
  vb13y = 400;
  vc13x = 7500;
  vc13y = 250;
  vd13x = 7550;
  vd13y = 100;
  da13x = 7450;
  da13y = 565;
  db13x = 7500;
  db13y = 400;
  dc13x = 7340;
  dc13y = 170;
  da13mx = -1;
  da13my = 1;
  db13mx = 1;
  db13my = -1;
  dc13mx = 1;
  dc13my = 1;
  captured13 = 0;
  GO13 = 0; 
  loop();
  }
  if (GO14 == 1 && G == 14)
  {
  p14x = 8300;
  p14y = 300;
  v14x = 7900;
  v14y = 300;
  da14x = 8100;
  da14y = 150;
  db14x = 8150;
  db14y = 500;
  da14mx = -1;
  da14my = 1.25;
  db14mx = 1.1;
  db14my = -1.1;
  disa14 = dist(p14x, p14y, da14x, da14y);
  disb14 = dist(p14x, p14y, db14x, db14y);
  GO14 = 0;
  loop();
  }
  }


//
//
//
//
//
//
//
//
//
//
//
//
//
//
//

void keyPressed ( )
  {
  if (keyCode == UP && G == 8)
  {
    p8y = p8y - 60;
  }
  if (keyCode == RIGHT && G == 8)
  {
    p8x = p8x + 60;
  }
  if (keyCode == LEFT && G == 8)
  {
    p8x = p8x - 60;
  }
  if (keyCode == DOWN && G == 8)
  {
    p8y = p8y + 60;
  }
  }
  
  void keyReleased()
  {
    loop();
  }


