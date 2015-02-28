

  size (200, 600);
  
  background (15, 63, 40);

for (int a=0; a<600; a+=6){
for (int b=234; b<600; b+=6){

fill (random (255));
strokeWeight (1);
ellipse (a, b, 2 , 2);
}
}

fill (20, 67, 30, 150);
stroke (4, 61, 90, 150);
strokeWeight (3);
ellipse (100, 100, 150,150);


noStroke ();
fill (4, 61, 90, 150);
rect (0, 100, 200, 100);
rectMode (CORNER);


strokeWeight (0.5);
stroke (70);
line (30, 100, 170, 100);
line (0, 100, 23, 100);
line (173, 100, 100,200);



