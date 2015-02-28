
//screen size
size(250,250);
//background screen colour
background(255);
//smooth edges
smooth();
translate(125,125);
//removes strokes around object
for(int i=180; i>0;i-=10){
fill((190-70),(i-200)*-1,(220-i));
noStroke();
triangle (1, 1, 1, i, i, i);
rotate (0.4);
}
        
