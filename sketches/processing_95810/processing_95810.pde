
size(400,400);
background(255);
colorMode(HSB,255);
smooth();

for(int i=0; i<=width;i=i+40){
float h=map(i,0,width,0,255);
stroke(0);
strokeWeight(2);
line(0,i,i+80,height);
line(i,0,width,i+40);
line(0,height-i,i+40,0);
line(width,i,width-i,height);
}
for(int i=0; i<=width;i=i+10){
float h=map(i,0,width,0,255);
stroke(0);
line(i,0,height+10,i);
line(i,0,width,i+40);
line(0,height-i,i+40,0);
line(width,i,width-i,height);
}
for(int i=0; i<=width;i=i+60){
float h=map(i,0,width,0,255);
stroke(0);
line(0,i+60,height,0);
line(i,0,width,i+60);
line(0,height-i,i+60,0);
line(width,i,width-i,height);
}
if(mousePressed){
save("la media rota");
}
