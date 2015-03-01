
size (200,200);
background (0);
stroke (255);


for (int y= 10; y < 200; y += 10){
  for (int x =10 ; x < 200; x +=10){
    point (x,y);
  }
}

fill (174,221,60);
beginShape ();
vertex (40,100);
vertex (100,50);
vertex (40,10);
endShape ();

fill (95,95,227);
beginShape ();
vertex (170,40);
vertex (170,120);
vertex (100,40);
endShape ();



