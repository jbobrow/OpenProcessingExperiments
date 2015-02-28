
size(600,600);
background(255);
for(int x=10;x<600;x+=10){
for(int y =50;y<600;y+=10){
fill(133,(x+y-600)*.7,(x+y-600)*1.4,100);
beginShape(QUADS);
noStroke();
vertex(x,y);
vertex(x+10,y+10);
vertex(x-2,y-2);
vertex(x*.09,y*.4);
vertex(x*.8,y*.9);
vertex(x*.04,y*.07);
endShape();
}
}                
                
