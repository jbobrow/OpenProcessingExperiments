
size(500,500);
background(250);
stroke(255,10,10,70);
strokeWeight(0.5);

translate(50,0);
scale(1.2);


for (int x=0;x<500;x=x+1){
for (int y=0;y<500;y=y+1){



stroke(220,80,60,80);
rotate(PI/300);
line(x*15,y*15,x,y);

}
}


