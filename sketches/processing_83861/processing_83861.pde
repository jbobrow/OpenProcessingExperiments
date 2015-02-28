
size(500,500);
translate(width/2, height/2);
for(int i=0; i<360; i+=30){
rotate(radians(60));
line(0,0,50,50);
fill(0);
triangle(50,50,54,51,50,55);
}
for(int i=0; i<360; i+=30){
  rotate(radians(60));
line(0,0,30,10);
fill(0);
triangle(30,10,32,10,31,13);
}
