
size(1024,768);
smooth();
background(0);
noStroke();

for(int y=0; y <= height;y+=10){
for(int x=0; x <= width;x+=10){
fill( 77,77,77);
ellipse (x,y,40,40);
}}
for(int y=0; y <= height;y+=10){
for(int x=0; x <= width;x+=10){
fill( 255);
ellipse (x,y,40,15);
}}

for(int y=0; y <= height;y+=10){
for(int x=0; x <= width;x+=10){
fill( 5);
ellipse (x,y,10,10);
}}

saveFrame("2.png");

                
                
