
//Shela H. Repeating Shapes. CP1 mods 16-17

size(500,500);
background(155,17,38);
noFill();
smooth();
stroke(180,229,160);
int g=15;
while(g<400)
{
  bezier(200,10,20-g,100,300-g,300,250,500);
  g=g+15;
}

stroke(166,199,234);
int b=10;
while(b<400)
{
  bezier(0,100,200+b,250,150+b,450,300,500);
  b=b+10;
}

stroke(176,161,188);
int p=10;
while(p<400)
{
  bezier(500,100,200+p,250,150+p,450,0,470);
  p=p+10;
}
  
stroke(250,220,237);
int saku=5;
while(saku<250)
{
  bezier(220,55,70+saku,150,70+saku,130,270,200);
  saku=saku+5;
}

stroke(229,157,97);
int o=0;
while(o<300)
{
  ellipse(250,350,o,200);
  o=o+10;
}
