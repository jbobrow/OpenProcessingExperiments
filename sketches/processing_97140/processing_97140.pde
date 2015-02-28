
size(200, 200);
noStroke();
for(int x= 30; x<170; x=x+30){
fill(255, 48, 48, 50*x/80);
ellipse(x, 50, 50, 50); 
}
for(int y= -100; y<190; y=y+10){
strokeWeight(4);
stroke(255, 114, 86);
point(y+100, y*y/100 + 100);
}


