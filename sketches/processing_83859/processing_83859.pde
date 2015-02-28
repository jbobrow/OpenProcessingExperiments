
size(500,500);
smooth();
translate(width/2, height/2);
for(int i=0; i<360; i+=30){
rotate(radians(30));
line(0,0,50,50);
fill(0);
triangle(50,50,54,51,50,55);
}
