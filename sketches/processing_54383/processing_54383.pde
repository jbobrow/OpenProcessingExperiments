
//Processing Sketch by Karen Vertierra//

size(250, 250);
background (#E2F4BE);
smooth ();

scale(1.25);
rotate(75);
for(int x=0; x<130; x+= 10) 

{
stroke (#9FBE51);
line (125, x, 100-x, 150);
line (125, x, x+150, 150);
stroke (#64B051);
line (125, 250-x, 100-x, 150);
line (125, 250-x, x+150, 150);
}

translate (30, 300);
scale(.6);
rotate(180);

for(int x=0; x<130; x+= 10) 

{
stroke (#E8D75E);
line (100, x, 100-x, 125);
line (100, x, x+150, 125);
stroke (#DC993F);
line (100, 250-x, 100-x, 125);
line (100, 250-x, x+150, 125);
}


translate (480, 200);
scale(1.2);
rotate(90);

for(int x=0; x<130; x+= 10) 

{
stroke (#99A3D4);
line (100, x, 100-x, 125);
line (100, x, x+150, 125);
stroke (#D8A3D4);
line (100, 250-x, 100-x, 125);
line (100, 250-x, x+150, 125);
}



