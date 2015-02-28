
size (250,250);
background (255,255,255,255);


int a = 10;
smooth();

for (a = 10; a<120 ; a = a+20)

{ 
line (125, a, a+130, 125);
line (125, a+130, a, 125);
line (125, 120-a, a, 125);
line (125, 250-a, a+130, 125);
}

