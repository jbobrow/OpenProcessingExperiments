
size(600, 600);
background(0);

//ellipses

for (int x=50; x<width; x+=100) {
  
  for (int y=50; y<height; y+=100) {
//changes the opacity of blood spot
    float fuck=map(x,0,width,255,0);
//face    
    fill(255, 231, 41);
    ellipse(x, y, 100, 100);
//eyes
  float shit=map(x,0,width,10,100);
  float cheese=map(x,0,width,20,150);
    fill(0);
    ellipse(x-15, y-20, shit, cheese);
    ellipse(x+15, y-20, shit, cheese);
//smile    
    noFill();
    strokeWeight(5);
    arc(x, y, 70, 70, radians(0), radians(180));
//blood    
    noStroke();
    fill(222, 32, 2, fuck);
    ellipse(x-30, y-30, 14, 14);
    strokeWeight(7);
    stroke(222, 32, 2, fuck);
    line(x-25, y-25, x-10, y-10);
    stroke(0);
    strokeWeight(4);
  }
}




