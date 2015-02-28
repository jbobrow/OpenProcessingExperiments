
size(700, 700);
background(0);
noFill();
//lines
for(int i=0; i<400; i=i+80){
stroke(i/4, i, i/2, 230);
strokeWeight(15);
line(i/2, 0, i/2, height);
}
//A
for (int i=0; i<400; i=i+2){

if (i<=200){
  strokeWeight(2);
  stroke(i, 2*i, 3*i);
  smooth();
ellipse (i, i, width, height);
} 

if (i>=401) { 
  stroke(0, i, i-3);
  line(i, i, width, height);
}
if (i>=400){
  stroke(3*i, i, 2*i);
  line(2*i, 2*i, width, height);
}
else {
  stroke(i/2, 4*i, 0);
  line(i/2, i, width, height);
}
}

for(int i=0; i<400; i=i+80){
stroke(i/4, i/2, i, 180);
strokeWeight(15);
line(i/2, 0, i/2, height);
}


