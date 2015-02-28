
size(500,500);
translate(width/2, height/2);
smooth();
for(int i=0; i<360; i+=30){
rotate(radians(30));
stroke(0);
fill(0);
triangle(50,50,40,51,50,58);
}
for(int i=0; i<360; i+=30){
  rotate(radians(30));
line(0,0,50,15);
fill(0);
triangle(50,15,60,14,52,20);
}
