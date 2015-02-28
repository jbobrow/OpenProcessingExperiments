

size(500, 500);
smooth();
 
background(#FFFFFF);





fill(#000a91,50);


for (int x=-20; x<=700; x+=50)
{
  for (int y=-20; y<=700; y+=50)
  {

beginShape();
vertex(x+60, y+20);
vertex(x+40, y+20);
vertex(x+40, y+40);
vertex(x+60, y+40);
vertex(x+60, y+60);
vertex(x+20,y+ 90);
endShape(CLOSE);



beginShape();
vertex(x-60, y-20);
vertex(x-40, y-20);
vertex(x-40, y-40);
vertex(x-60, y-40);
vertex(x-60, y-60);
vertex(x-20,y-90);
endShape(CLOSE);

  }
}






