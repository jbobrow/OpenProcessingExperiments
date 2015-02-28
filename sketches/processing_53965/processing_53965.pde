
size (250,250);
background (0);

stroke (255,255,150,150);
for (int x1=140; x1<250; x1+=20)

for (int y1=0; y1<250; y1+=20)
{
stroke (x1,255,255,y1+30);
line (width/2,y1,x1,height/2);
}

for (int x2=0; x2<125; x2+=20)
for (int y2=0; y2<250; y2+=20)
{
stroke (y2,255,255,x2);
line (width/2,y2,x2,height/2);
}


