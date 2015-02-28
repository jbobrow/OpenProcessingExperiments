
PImage img;
//VOLTORB//
int y=1;
//NAVI//
int z=100;
int a=0;
int b=5;
//BOO//
int c=5;
//KIRBY//
int d=5;
//NEWS//
int e=-100;
void setup() 
{
  size(550, 510);
  img = loadImage("Lowell.jpg");
}

void draw() 
{
  background(0);
  image(img, 0, 0);
  frameRate(20);
  smooth();
  portals();
  voltorb();
  navi();
  boo();
  kirby();
  news();
  live();
}
void voltorb()
{
  fill(255, 0, 0);
  stroke(0);
  strokeWeight(2);
  ellipse(200, y, 50, 50);
  fill(255);
  arc(200, y, 50, 50, 0, PI);
  stroke(0);
  line(175, y, 225, y);
  fill(255);
  strokeWeight(1);
  triangle(185, y-13, 200, y-3, 185, y-8);
  triangle(220, y-13, 210, y-3, 220, y-8);
  fill(0);
  ellipse(191, y-7, 1, 1);
  ellipse(217, y-7, 1, 1);
  y=y+15;
  if (y>=500)
  {
    y=0;
  }
}
void navi()
{
  fill(140, 177, 193);
  stroke(140, 177, 193);
  triangle(a, z, a-20, z-45, a-20, z-20);
  triangle(a+20, z+5, a+80, z-15, a+55, z+5);
  triangle(a, z+15, a-20, z+15, a-5, z+25);
  triangle(a+15, z+15, a+25, z+30, a+15, z+30);
  stroke(82, 162, 198);
  fill(82, 162, 198);
  ellipse(a+10, z+5, 30, 30);
  ellipse(a+5, z+35, 10, 10);
  ellipse(a-5, z+55, 10, 10);
  stroke(20, 175, 245);
  fill(20, 175, 245);
  ellipse(a+10, z+5, 25, 25);
  fill(255);
  stroke(255);
  ellipse(a+10, z+5, 20, 20);
  ellipse(a+5, z+35, 7, 7);
  ellipse(a-5, z+55, 7, 7);
  z=z+b;
  a=a+25;
  if (a>600)
  {
    a=0;
  }
  if (z<150)
  {
    b=b+5;
  }
  if (z>=100)
  {
    b=b-5;
  }
}
void portals()
{
  fill(255);
  strokeWeight(3);
  stroke(255, 97, 5);
  ellipse(545, 125, 20, 200);
  ellipse(4, 380, 20, 200);
  ellipse(200, 475, 110, 10);
  ellipse(350, 5, 110, 10);
  stroke(5, 97, 255);
  ellipse(4, 125, 20, 200);
  ellipse(545, 380, 20, 200);
  ellipse(200, 5, 110, 10);
  ellipse(350, 475, 110, 10);
}
void boo()
{
  fill(255);
  stroke(255);
  ellipse(c, 400, 110, 110);
  beginShape();
  curveVertex(c-20, 422);
  curveVertex(c-20, 422);
  curveVertex(c+70, 412);
  curveVertex(c+20, 452);
  curveVertex(c+20, 452);
  endShape();
  stroke(0);
  beginShape();
  curveVertex(c-10, 410);
  curveVertex(c-10, 410);
  curveVertex(c+5, 395);
  curveVertex(c, 425);
  curveVertex(c, 425);
  endShape();
  fill(0);
  ellipse(c-50, 410, 5, 10);
  fill(255);
  beginShape();
  curveVertex(c-55, 395);
  curveVertex(c-55, 395);
  curveVertex(c-55, 410);
  curveVertex(c-40, 395);
  curveVertex(c-40, 395);
  endShape();
  stroke(229, 67, 97);
  fill(229, 67, 97);
  beginShape();
  curveVertex(c-48, 427);
  curveVertex(c-48, 427);
  curveVertex(c-20, 425);
  curveVertex(c-30, 447);
  curveVertex(c-43, 437);
  curveVertex(c-43, 437);
  endShape();
  fill(255);
  stroke(0);
  beginShape();
  curveVertex(c-40, 426);
  curveVertex(c-40, 426);
  curveVertex(c-35, 436);
  curveVertex(c-30, 425);
  curveVertex(c-30, 425);
  endShape();
  beginShape();
  curveVertex(c-40, 426);
  curveVertex(c-40, 426);
  curveVertex(c-45, 432);
  curveVertex(c-49, 427);
  curveVertex(c-49, 427);
  endShape();
  c=c-10;
  if (c<-50)
  {
    c=600;
  }
}
void kirby()
{
  fill(245, 230, 67);
  stroke(245, 230, 67);
  beginShape();
  curveVertex(320, d);
  curveVertex(325, d);
  curveVertex(350, d-15);
  curveVertex(380, d);
  curveVertex(375, d-35);
  curveVertex(390, d-65);
  curveVertex(363, d-70);
  curveVertex(350, d-105);
  curveVertex(333, d-70);
  curveVertex(310, d-65);
  curveVertex(325, d-35);
  curveVertex(320, d);
  curveVertex(330, d);
  endShape();
  fill(211, 23, 39);
  stroke(211, 23, 39);
  ellipse(340, d+70, 20, 60);
  ellipse(360, d+70, 20, 60);
  fill(252, 189, 227);
  stroke(252, 189, 227);
  ellipse(350, d+40, 70, 70);
  ellipse(320, d+20, 15, 50);
  ellipse(380, d+20, 15, 50);
  fill(240, 87, 181);
  stroke(240, 87, 181);
  ellipse(335, d+40, 10, 5);
  ellipse(365, d+40, 10, 5);
  fill(4, 22, 124);
  stroke(4, 22, 124);
  ellipse(344, d+25, 5, 15);
  ellipse(356, d+25, 5, 15);
  fill(0);
  stroke(0);
  ellipse(344, d+25, 3, 7);
  ellipse(356, d+25, 3, 7);
  fill(255);
  stroke(255);
  ellipse(344, d+20, 1, 5);
  ellipse(356, d+20, 1, 5);
  fill(211, 23, 39);
  stroke(211, 23, 39);
  ellipse(350, d+50, 5, 5);
  d=d-25;
  if (d<-120)
  {
    d=500;
  }
}
void news()
{
  fill(0);
  stroke(0);
  quad(0, 478, 550, 478, 550, 510, 0, 510);
  fill(245, 230, 67);
  textSize(20);
  text("ALBERT WESKER, DANTE, AND MORRIGAN AENSLAND DEFEAT GALACTUS.", e-4900, 500); 
  text("OLYMPICS: SONIC BEATS WARIO IN TRACK.", e-4130, 500);
  text("HEAVY WEARS ALL THE HATS.", e-3650, 500);
  text("KATE MCREARY KILLED AT BELLIC WEDDING.", e-3300, 500);
  text("BRUCE WAYNE IMPRISONED IN ARKHAM CITY.", e-2800, 500);
  text("JOHN MARSTON KILLED AT HIS HOME.", e-2300, 500);
  text("COLE PHELPS PROMOTED TO TRAFFIC.", e-1870, 500);
  text("SHAO KHAN DEFEATED BY RAIDEN.", e-1450, 500); 
  text("PAC-MAN AND MRS. PAC-MAN HAVE A CHILD.", e-1050, 500); 
  text("CAPTAIN OLIMAR LANDS ON MYSTERIOUS PLANET.", e-550, 500); 
  text("CAPTAIN FALCON LOSES F-ZERO RACE.", e, 500);
  e=e+5;
  if (e>5350)
  {
    e=-500;
  }
  fill(255, 0, 0);
  stroke(255, 0, 0);
  quad(450, 478, 550, 478, 550, 510, 450, 510);
  fill(10, 255, 100);
  text("LOL NEWS", 451, 500);
}
void live()
{
  fill(0, 0, 255);
  stroke(0, 0, 255);
  quad(0, 0, 60, 0, 60, 30, 0, 30);
  fill(255);
  text("LIVE", 10, 23);
} 


