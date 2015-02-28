
size (400, 400);
noFill();
smooth();
background(#FFFCCC);
for( int i=10; i<width; i=i+5) { stroke(255-i/2);
ellipse(width/2 , height/2, i,i);}


for( int i=25; i<width; i=i+5) { stroke(i/2);
ellipse(width/4 , height/2, i,i);}

