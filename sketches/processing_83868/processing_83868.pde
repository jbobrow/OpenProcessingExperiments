
size(500,500);
translate(width/2, height/2);
smooth();
for(int i=0; i<360; i+=30){
rotate(radians(60));
noStroke();

fill(255);
quad(0,0,10,20,15,20,10,3);
}
for(int i=0; i<360; i+=30){
  rotate(radians(60));
line(0,0,50,15);
ellipse(50,15,7,7);
fill(0);
ellipse(20,20,2,2);
stroke(0);
line(0,0,45,30);
ellipse(45,30,10,5);
}
