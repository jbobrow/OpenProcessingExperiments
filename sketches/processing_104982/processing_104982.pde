
int screenW = 800;
int screenH = 800;
color myColor=color(20,153,0);
color my2ndcolor = color(154,177,80);
size(screenW,screenH);
background(200);
fill(myColor);
rectMode(CENTER);
rect(screenW/2,screenH/2,screenW/2,screenH/2);
fill(my2ndcolor);
rect(screenW/2,screenH/2,width/4,height/4);
println(screenW/2);
