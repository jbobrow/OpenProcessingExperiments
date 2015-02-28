
size(400,400);
background(255);

for(int x=0;x<width;x += 10){
  line(x,0,x,height);
}
for(int y=0;y<height;y += 10){
  line(0,y,width,y);
}


noStroke();
smooth();

fill(204, 102, 0,180);
arc(200, 200, 100, 100, 0.52, 5.76);

fill(255);
ellipse(200,180,10,10);
