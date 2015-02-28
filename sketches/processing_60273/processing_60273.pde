
size(400,400);
colorMode(HSB);
background(100,255,200);
smooth();
noFill();
randomSeed(0);
strokeWeight(10);
//stroke(0,150);
for(int i =0; i<450; i +=10){
 float hugh = map(i,0,450,0,100);
 stroke(hugh,255,200,200); 
 float begin = radians(i);
 float end = begin + HALF_PI;
 arc(270,180, i, i, begin, end*1.5); 
}



