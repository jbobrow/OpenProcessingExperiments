
void setup()
{
  size(900,400);
  background(#ADD8E6);
  noFill();
  smooth();
}
void draw()
{
  beginShape();
  smooth();
  fill(#000033);
  vertex(0,350);  
  vertex(0,320); 
  vertex(0,117);
  vertex(0,110);
  vertex(45,120);
  vertex(66,100); 
  vertex(68,96);  
  vertex(63,90);  
  vertex(56,75);  
  vertex(58,70);  
  vertex(65,60);  
  vertex(75,65);  
  vertex(84,74);  
  vertex(88,79);  
  vertex(92,89);
  vertex(140,77);
  vertex(145,80);
  vertex(150,82);
  vertex(170,84);
  vertex(190,86);
  vertex(230,92);
  vertex(245,105);
  vertex(260,110);
  vertex(300,125);
  vertex(320,116);
  vertex(330,125);
  vertex(370,160);
  vertex(400,178);
  vertex(430,185);
  vertex(450,180);
  vertex(470,188);
  vertex(490,175);
  vertex(530,164);
  vertex(570,145);
  vertex(590,136);
  vertex(610,126);
  vertex(640,100);
  vertex(670,80);
  vertex(700,65);
  vertex(730,23);
  vertex(760,36);
  vertex(765,49);
  vertex(775,67);
  vertex(799,75);
  vertex(820,86);
  vertex(840,97);
  vertex(860,110);
  vertex(900,150);
  vertex(900,350);
  endShape();//hasta aqui son los volcanes
  
  beginShape();
  fill(#996633);
  vertex(0,400);
  vertex(0,300);
  vertex(35,293);
  vertex(60,266);
  vertex(100,250);
  vertex(149,245);
  vertex(160,260);
  vertex(230,255);
  vertex(480,275);
  vertex(520,260);
  vertex(580,250);
  vertex(740,277);
  vertex(820,300);
  vertex(856,330);
  vertex(880,300);
  vertex(900,295);
  vertex(900,400);
  endShape();//cerros cafes
  
  beginShape();
  fill(0,0,0);
  vertex(0,400);
  vertex(80,360);
  vertex(90,365);
  vertex(160,361);
  vertex(290,370);
  vertex(450,385);
  vertex(490,377);
  vertex(585,340);
  vertex(684,355);
  vertex(812,350);
  vertex(850,365);
  vertex(900,380);
  vertex(900,400);
  endShape();//capa negra
}

