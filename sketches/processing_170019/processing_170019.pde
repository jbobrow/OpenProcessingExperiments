
size(600,600);
background(255,255,255);

textAlign(CENTER);
textSize(50);
fill(50,100,150);
text("Processing is fun!", width/2, height/2);

for(int x=0; x<600; x+=20) {
  line(x,0, 600,x);
  line(0,x, x,600);
  line(x,600, 600,600-x);
  line(600-x,0, 0,x);
}


