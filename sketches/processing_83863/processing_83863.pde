
size(500,500);
translate(width/2, height/2);
smooth();
for(int i=0; i<360; i+=30){
rotate(radians(60));
line(0,0,20,20);
fill(0);
triangle(30,30,32,31,31,32);
}
for(int i=0; i<360; i+=30){
  rotate(radians(60));
line(0,0,50,15);
noFill();
triangle(50,15,66,12,54,21);
}
