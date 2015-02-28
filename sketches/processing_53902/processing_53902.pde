
//determines size of window
size (250,250);
//determines color of background
background (255);
//for: determines loop structure, int: integer a:value
for(int a=10; a<120;a+=20)  
{
//placements of the four lines
line (125,a, a+130, 125);
line (125,a+130,a,125);
line (125,-a+120,a,125);
line(a+130,125,125,250-a);
}

