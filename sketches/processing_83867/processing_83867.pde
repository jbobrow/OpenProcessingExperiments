
size(500,500);
translate(width/2, height/2);
smooth();
for(int i=0; i<360; i+=30){
rotate(radians(60));
noStroke();
fill(0);
quad(0,0,30,15,50,50,20,40);
fill(255);
quad(0,0,20,5,30,20,10,30);
}
for(int i=0; i<360; i+=30){
  rotate(radians(60));
line(0,0,50,15);
fill(0);
ellipse(50,15,5,5);
}
