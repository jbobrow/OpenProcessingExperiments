
//nested loop..inception loooooop

size(250, 250);
background(255, 0, 50);
smooth();

//base circle
for(int y=20; y<=height; y+=30){
  for(int x=20; x<=width; x+=30){
    noStroke();
    fill(233, 236, 22, 175);
    ellipse(x, y, 30, 30);
  }
}

//pink pattern
for(int x = 0; x < height; x += 10){
 for(int y = 0; y < width; y += 10){
   noFill();
   stroke(236, 22, 183);
   strokeWeight(0.7);
   ellipse(x, y, 30, 30);}
   
}

   
//xtra pattern
for(int ex = 20; ex < 250; ex += 30){
  for(int ey = 20; ey < 250; ey += 30){
    stroke(255, 100);
    strokeWeight(0.5);
    ellipse(ex, ey, 150, 150);}
}


