
size(400,400);
smooth();
background(255,3,108);
stroke(13,37,129,50);
line(0,300, 400,300);
line(0,280, 400,280);
line(0,240, 400,240);
line(0,310, 400,310);
stroke(255,150);
beginShape();
noFill();
for (int y=10; y <380; y +=30) { 
for(int x=100; x<380; x +=100) {
vertex(100,10);
bezierVertex(100,y,150,x,300,390);
}
}
endShape();
beginShape();
for (int r=390; r>20; r -=30){
for(int t=300; t>20; t -=100){
vertex(300,10);
bezierVertex(300,r,250,t,100,390);
}
}
endShape();
line(300,10,390,10);
line(390,10,390,390);
line(390,390,300,390);
line(10,10,100,10);
line(10,10,10,390);
line(10,390,100,390);


