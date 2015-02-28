
size(600,600);
background(255);
for(int x=10;x<600;x+=20){
for(int y =50;y<600;y+=30){
fill(141,10,(x+y-600)*0.6,40);
beginShape(QUADS);
noStroke();
vertex(x,y);
vertex(x+10,y+10);
vertex(x-2,y-2);
vertex(x+7,y+10);
vertex(x+5,y-5);
vertex(x*.8,y*.9);
vertex(x*.04,y*.07);
vertex(x*.09,y*.4);
endShape();
}
}
                
                
