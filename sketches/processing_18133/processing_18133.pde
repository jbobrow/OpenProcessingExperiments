
size(250,250);
background(254,209,255);
smooth();

strokeWeight(9);
stroke(0,0,0,5);
fill(44,133,255,10);
ellipse(230,10,210,210);

strokeWeight(9);
stroke(0,0,0,5);
fill(44,133,255,10);
ellipse(150,80,50,50);


fill(254,209,255);
stroke(41,60,255,20);
//thick blue lines
strokeWeight(8);
for(int y=20; y<=250; y+=60){
for(int x=20; x<=250; x+=30){
bezier(0,250,30,y,145,x,250,250);
}
}
noFill();
stroke(216,98,222,20);
//thick purple lines
strokeWeight(8);
for(int y=20; y<=250; y+=30){
for(int x=30; x<=250; x+=30){
bezier(0,250,x,y,50,x,250,0);
}
}
stroke(255,153,44,20);
//thick orange lines
strokeWeight(6);
for(int y=30; y<=250; y+=50){
for(int x=30; x<=250; x+=40){
bezier(0,0,x,50,y,150,250,250);
}
}
stroke(106,255,251,20);
//thick aqua blue lines
strokeWeight(9);
for(int y=20; y<=250; y+=60){
for(int x=20; x<=250; x+=30){
bezier(0,250,30,y,145,x,250,250);
}
}
stroke(0,0,0,5);
fill(44,133,255,20);
ellipse(0,200,100,100);

