
size(400,400);
//background
int x = 302;
while(x<401)
{
  stroke(162,113,20);
  line(0,x,400,x);
  x = x + 1;
}
int y = 0;
while(y<301)
{
  stroke(117,242,224);
  line(0,y,400,y);
  y = y + 1;
}
//head
stroke(0);
fill(229,223,37);
ellipse(100,100,100,100);
//body
ellipse(150,191,125,112);
//head feathers
arc(118,131,22,15,10*PI/8,2*PI);
arc(116,129,22,15,0,6*PI/8);
arc(105,65,70,56,17*PI/16,50*PI/32);
arc(92,39,36,37,0,PI/2);
arc(143,75,55,50,35*PI/28,10*PI/6);
arc(131,54,50,55,0,1*PI/3);
arc(150,80,50,25,14*PI/12,19*PI/10);
arc(152,76,40,40,0,7*PI/9);
//tail feathers
arc(255,160,150,150,PI,25*PI/16);
arc(197,116,150,150,-2*PI/16,PI/2);
arc(255,180,150,150,PI,25*PI/16);
arc(197,136,150,150,-2*PI/16,PI/2);
arc(255,200,150,150,PI,25*PI/16);
arc(197,156,150,150,-2*PI/16,PI/2);
//wing and feathers
ellipse(163,191,100,95);
arc(205,160,50,50,18*PI/16,26*PI/16);
arc(196,150,45,40,-3*PI/16,PI/2);
arc(212,182,50,50,19*PI/16,17*PI/10);
arc(206,167,40,30,-1*PI/10,5*PI/8);
arc(206,200,40,40,23*PI/16,2*PI);
arc(211,193,35,30,3*PI/16,16*PI/18);
//beak
fill(240,166,29);
arc(70,130,56,56,PI/4,5*PI/4);
fill(117,242,224);
arc(81,158,30,22,15*PI/16,7*PI/4);
//legs
fill(211,110,9);
beginShape();
vertex(169,244);
vertex(159,265);
vertex(169,280);
vertex(184,239);
endShape();
fill(237,206,165);
arc(165,302,70,70,PI,2*PI);
fill(211,110,9);
arc(160,302,68,75,PI,2*PI);
fill(237,206,165);
arc(145,302,50,65,PI,2*PI);
line(120,302,200,302);
//eye and cheek
fill(255);
ellipse(80,110,20,35);
fill(21,138,232);
ellipse(76,110,10,25);
fill(11,69,160);
ellipse(77,106,8,15);
fill(255);
ellipse(75,104,6,8);
//cheek
fill(237,167,62);
ellipse(97,128,8,6);
//collar
fill(227,48,48);
beginShape();
vertex(150,135);
vertex(90,160);
vertex(88,156);
vertex(147,131);
endShape();
