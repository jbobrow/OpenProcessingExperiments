
size(700,700);
background(255);
for(int y = -50;y<=700;y+=10){
for(int x = -50;x<=700;x+=20){
noStroke();
fill(random(100),random(206),220,50);
ellipse(x,y,random(40),40);
}
}                
                
