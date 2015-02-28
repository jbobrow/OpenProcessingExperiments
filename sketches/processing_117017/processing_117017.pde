
size(510,510);
background(255);
smooth();

for(int a=0; a<=255; a+=2){
for(int x=0; x<=width; x+=100){
for(int y=0; y<=height; y+=100){
noStroke();
fill(width-x/3,height-y/2,y/2);
ellipse(x,y,100,100);

strokeWeight(1);
stroke(255-a*3,255-a/2,255);
line(0,a*3,width,a*3);
}
}
}


