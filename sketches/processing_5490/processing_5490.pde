
// edited from original: moiré's ocean by Jeremy Awon, 
// licensed under Creative Commons Attribution-Share Alike 3.0 license. 
// Work: http://www.openprocessing.org/visuals/?visualID=4326. 
// License: http://creativecommons.org/licenses/by-sa/3.0/ ] 
float e,x,t;
void setup(){size(400,400);
// size of sketched changes to suit my brief from 600x600 to 400x400
smooth();
noFill();}void draw(){background(20,0,252);
//background colour changed
for(e=6;e<2000;e/=.99){beginShape();
// e numerical values changed 
for(;x<4;x+=.1,curveVertex(x*100,e+e*noise(x,t+e/50)/4));
//expression slightly changed
endShape();t+=x=1E-5;}} 




