
size(200,200);
smooth();

 noFill();

 randomSeed(0);

 strokeWeight(10);

 stroke(0, 50);

 for (int i = 0; i < 10000; i += 50) {

 
 float begin = radians(i);

 float end = begin + PI;

 arc(100, 100, i/5, i/5, begin, end);
 
 }
