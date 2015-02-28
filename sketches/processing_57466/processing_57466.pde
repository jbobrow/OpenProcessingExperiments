
size(400, 300);
strokeWeight(5);
for(int i=0; i<width; i+=1) {
  stroke(lerpColor(color(188,79,0), color(82,207,255), 1.0*i/width));
  line(0, i, width, i);
}
strokeWeight(1);      
for(int i=0; i<width; i+=1) {
  stroke(random(116,168), random(33,52), random(33,52));
  line(i, i, random(i),random(i));
}
for(int i=width; i>0; i-=1) {
  stroke(random(77,160), random(128,255), random(77,255));
  line(i,i,random(i),random(i));
}
