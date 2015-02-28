
size(600, 600);
background(#EA8202);
smooth();


for (int y = 0; y <= height; y += 100) {
  for (int x = 0; x <= width; x += 100) {
    //grigie//
    stroke(60, 40, 90);
    strokeWeight(8);
    line(x-30, y-60, x+30, y+60);
    line(x+30, y-60, x-30, y+60); 
    
    //rosso//
    fill(#1A5815);
    noStroke();
    ellipse(x, y, 30, 30);
    //verde//
    fill(#FFD500);
    ellipse(x, y, 20, 20);

   
  }
}


