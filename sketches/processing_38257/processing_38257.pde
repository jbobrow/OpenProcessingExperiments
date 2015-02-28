

size(300, 300);
smooth();
colorMode(HSB, 100);
background(60,50,50,50);
noStroke();
fill(50,50,50,50);


for (int x = 0; x <=  300; x= x+20) {//spaces the rows
  for (int y = 0; y <= 300; y = y+100) {//spaces the columns


    ellipse(x, y+10, 10, x);//increases the ellipse height to create a variance
  }
}


