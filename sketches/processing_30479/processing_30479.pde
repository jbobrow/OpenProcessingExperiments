
size(1024,768);
smooth();
background(0);
noStroke();

for(int y=0; y <= height;y+=90){
for(int x=0; x <= width;x+=90){
fill( 77,77,77);
ellipse (x,y,80,80);
}}
for(int y=0; y <= height;y+=90){
for(int x=0; x <= width;x+=90){
fill( 255);
ellipse (x,y,80,30);
}}

for(int y=0; y <= height;y+=90){
for(int x=0; x <= width;x+=90){
fill( 5);
ellipse (x,y,20,20);
}}

saveFrame("2.png");

                
                
