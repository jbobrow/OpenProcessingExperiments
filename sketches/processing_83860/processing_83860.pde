
size(500,500);
translate(width/2, height/2);
for(int i=0; i<360; i+=30){
rotate(radians(60));
line(0,0,30,30);
fill(0);
triangle(30,30,32,31,31,32);
}
for(int i=0; i<360; i+=30){
  rotate(radians(60));
line(0,0,50,15);
fill(0);
triangle(50,15,56,14,52,20);
}
