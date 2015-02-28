

size(500, 500);
smooth();
 
background(#FFFFFF);





noStroke();
fill(#ff0000,80);

for (int i=-10; i<=width; i+=50)
{
  for (int j=-10; j<=height; j+=50)
  {
     
   beginShape();
vertex(i, j);
bezierVertex(i+20, j+30, i+20, j+20, i+30, j+75);
bezierVertex(i+50, j+80, i+70, j+25, i+30, j+20);
endShape();

  }
}



fill(#402a00,50);
noStroke();

for(float y = 0; y <500; y +=50) {
  for(float x= 0; x < 500; x +=50) {

beginShape();
vertex(x*0.7, y*0.7);
vertex(x/0.7, y/0.7);
vertex((x+y)/1.2, (x+y)/1.2);
vertex(x*1.2, y*1.2);
vertex(x+15, y+25);
vertex(x+7, y+7);

endShape(CLOSE);

  }
}


