
size(800,800);
background(255);

for (int x=25; x<height; x+=180){
for(int y=25; y<width; y+=60){ 
 fill(255,50); 
  strokeWeight(random(01,2));
stroke(0,0,255);
ellipse(x,y,100,100);
noStroke();
stroke(255,214,3);
fill(random(123),random(12),random(2));

rect(x,y,x+20,y+20);

}}
