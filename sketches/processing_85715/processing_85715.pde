
size(500,500);
background(250);
stroke(45,70);
strokeWeight(0.5);

translate(50,0);
scale(1.2);


for (int x=0;x<500;x=x+1){
for (int y=0;y<500;y=y+1){



stroke(45,70);
rotate(PI/300);
line(x,y,x+50,y+50);

}
}


