
size(500,400);
color ruby= color(242,204,47,160);
color pink=color(237,159,176);
background(139,216,207);
noStroke();

for(int i =0;i<500;i+=10){
fill(ruby,i*0.3+20);
rect(i,0,80,80);
fill(pink,255-i*5);
rect(i,80,80,80);
fill(ruby,i*5-100);
rect(i,160,80,80);
fill(pink,100-1);
rect(i,240,80,80);
fill(ruby,255-i*5);
rect(i,320,80,80);
fill(pink,i/5+50);
rect(i,400,80,80);

}



