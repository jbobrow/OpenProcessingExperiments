
void setup(){size(400,400);
background(0);
 
fill(255,255,255,0);
 
stroke(0,255,0);
strokeWeight(5);
  
strokeWeight(5);
stroke(0,255,0);
for (int y = 30; y<400; y= y+20){
if (y >= 100) {
  line(200, 200, y/3, y/3);
}
 
else {
  ellipse(200, 200, y*2, y);
}
}
}

for (int x=10; x<400; x=x+20){
if (x>=100) {
  ellipse(200, 200, x*2, x);
