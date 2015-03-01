
size (255, 255);
noStroke ();

for (int a=0; a<255.0; a+=1){
  fill (a,a*0.25,a*0.5, 5);
  stroke (a-255+127,a-255+200,a-255+219);
  line (a,0,a,255);
  
  noStroke();

beginShape (TRIANGLE_STRIP);
vertex(30, 190);
vertex(65, 40);
vertex(125,80);
vertex(80,200);
vertex(190,200);
vertex(235, 15);
endShape ();

beginShape (QUAD);
vertex(65, 40);
vertex(125,80);
vertex(80,200);
vertex(190,200);
endShape ();
}


fill (156,211,177,200);
beginShape (QUAD);
vertex(65, 40);
vertex(125,80);
vertex(180,210);
vertex(80,200);
endShape ();

fill (252,9,45,220);
noStroke ();
triangle (81,200,235,15,200,190);

fill (127,200,219,200);
noStroke ();
triangle (30, 190,65, 40,125,60);




