
size(600, 600);
background(0);

//ellipses

for (int x=50; x<width; x+=100) {
  for (int y=50; y<height; y+=100) {
//face    
    fill(255, 231, 41);
    ellipse(x, y, 100, 100);
//eyes
    fill(0);
    ellipse(x-15, y-20, 10, 20);
    ellipse(x+15, y-20, 10, 20);
//smile    
    noFill();
    strokeWeight(4);
    arc(x, y, 70, 70, radians(0), radians(180));
//blood    
    noStroke();
    fill(222, 32, 2);
    ellipse(x-30, y-30, 14, 14);
    strokeWeight(7);
    stroke(222, 32, 2);
    line(x-25, y-25, x-10, y-10);
    stroke(0);
    strokeWeight(4);
  }
}






//noStroke();
//fill(222, 32, 2);
//ellipse(20, 20, 14, 14);

//strokeWeight(7);
//stroke(222, 32, 2);
//line(25, 25, 40, 40);




