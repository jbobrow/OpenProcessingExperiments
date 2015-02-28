
size(500,500);
translate(width/2, height/2);
smooth();
for(int i=0; i<360; i+=30){
rotate(radians(30));
stroke(0);
fill(0);
triangle(54,51,52,46,48,51);
}
for(int i=0; i<360; i+=30){
  rotate(radians(30));
line(6,2,50,15);
fill(0);
triangle(50,15,59,11,57,20);

}
