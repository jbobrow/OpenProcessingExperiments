
size(500,500);
translate(width/2, height/2);
smooth();
for(int i=0; i<360; i+=30){
rotate(radians(60));
line(0,0,50,50);
fill(255);
ellipse(55,55,10,10);
}
for(int i=0; i<360; i+=30){
  rotate(radians(60));
line(0,0,30,10);
line(0,0,25,20);
fill(0);
triangle(30,10,32,10,31,13);
}
