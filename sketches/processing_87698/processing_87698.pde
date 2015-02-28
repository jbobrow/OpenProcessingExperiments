
/*
Pearlyn Lii
 ID 3 - Spring 2013
 1/31/13
 */

//setup -----

size(800, 800);
background(0);
smooth();
colorMode(HSB, 360, 100, 100);

//draw -----

for (int i = 0; i<width; i+=3){
  for (int j = 2; j<=height; j+=2){
    float a = map(j, 0, width, 0, 100);
    float b = map(j, 0, width, .5, 10);
  fill(165, a, a);
  rect(j, 0, b, i);
  rect(i, 30, j, 40);
  rotate(100);

}
}


