
size(200, 200);
noStroke();
for(int x= 20; x<180; x=x+20){
fill(0, 59, 59, 60*x/100);
ellipse(x, 50, 50, 50);
}
for(int y= -150; y<200; y=y+8){
strokeWeight(5);
stroke(0, 120, 96);
point(y+100, y*y/100 + 100);
}
