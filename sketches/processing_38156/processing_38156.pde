
//an overlapping set of nested ellipses and rectangles that change opacity and color

size (400, 400);
smooth();
rectMode (CENTER);


for (int a = 30; a < width; a+=30) {
  for (int b = 30; b < height; b+=30) {
    fill (20, random(255), random(255), random(200));   
    strokeWeight(1);
    stroke (random(111));               
    rect (a, b, 60, 30);
//set of rectangles that overlap
    for (int c = 0; c < width; c+=30) {
      fill (230, random(255), random(255), random(20));     
      ellipse(a, c, 60, 60);
    }
  }
}
//set of scale ellipses 

