
size(500,500);
background(0);
noFill();
randomSeed(0);
strokeWeight(8);
stroke(150,200,150,150);
for (int i = 0; i < 560; i += 10) {
float begin = radians(i);
float end = begin + TWO_PI - HALF_PI;
arc(250, 250, i, i, begin, end);
}
strokeWeight(4);
stroke(150,200,250,50);
for (int i = 0; i < 560; i += 5) {
float begin = radians(i);
float end = begin + TWO_PI - HALF_PI;
arc(250, 250, i+90, i+90, begin, end);
}
strokeWeight(4);
stroke(250,100,50,50);
for (int i = 0; i < 560; i += 5) {
float begin = radians(i);
float end = begin + TWO_PI - HALF_PI;
arc(250, 250, i-90, i-90, begin, end);
}


