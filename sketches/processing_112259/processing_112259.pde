
size(500,500);
background(0);
smooth();

 
for (int x=0;x<=height;x+=160) {
for (int y=0;y<=width; y+=200){

stroke(246,255,0);
strokeWeight(20);
ellipse(x,y,50,50);

}
 
}

for (int x=0;x<=height;x+=50) {
for (int y=0;y<=width; y+=100){
strokeWeight(0);
fill(245,121,204);
ellipse(x,y,20,20);
}
 
}



