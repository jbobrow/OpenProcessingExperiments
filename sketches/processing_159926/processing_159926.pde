

void setup() {
  size(500, 500) ;
  background(#aaaaff);
}

void draw() {

  
   noStroke() ;
  fill(#ffffcc) ;
  for (int y = 0; y < 30; y++) {
    for (int x = 0; x < 30; x++) {
      rect(30*x, 30*y, 26, 26) ;
    }
  }
  
  
  fill(#666666, 100) ;
  ellipse(310, 305, 200, 210);
  
  triangle(325, 410, 370, 390, 325, 610);
  
  triangle(300, 410, 255, 390, 300, 610);
  
  triangle(370, 330, 380, 270, 450, 380);
  
  triangle(158, 220, 243, 270, 238, 320);
  
  ellipse(165, 230, 40, 40);
  
  ellipse(441, 377, 40, 40);
  
  rect(165, 55, 8, 200);
  
  rect(173, 60, 140, 100);
  
  ellipse(287, 510, 40, 40);
  
  ellipse(338, 510, 40, 40);
  
  
  
  fill(#ff8822) ;
  ellipse(300, 300, 200, 210);
  
  triangle(315, 400, 360, 380, 315, 600);
  
  triangle(290, 400, 245, 380, 290, 600);
  
  triangle(360, 330, 370, 270, 440, 380);
  
  triangle(145, 220, 230, 270, 225, 320);
  
  ellipse(160, 230, 40, 40);
  
  ellipse(434, 373, 40, 40);
  
  ellipse(277, 505, 40, 40);
  
  ellipse(328, 505, 40, 40);
  
  fill(#ffffff);
  ellipse(260, 280, 60, 50);
  
  ellipse(340, 280, 60, 50);
  
  fill(#ff8822);
  ellipse(260, 300, 70, 20);
  
  ellipse(340, 300, 70, 20);
  
  fill(#33cc33);
  ellipse(260, 277, 25, 25);
  
  ellipse(340, 277, 25, 25);
  
  fill(#000000);
  ellipse(260, 277, 15, 15);
  
  ellipse(340, 277, 15, 15);
  
  fill(#ffffff);
  ellipse(267, 270, 10, 10);
  
  ellipse(347, 270, 10, 10);
  
  noFill();
  stroke(#aa3300);
  strokeWeight(3);
  arc(300, 325, 70, 40, 0, HALF_PI);
  
  noStroke();
  fill(#773300);
  rect(155, 50, 8, 200);
  
  fill(#ffffff);
  rect(163, 50, 140, 100);
  
  fill(#ff2222);
  ellipse(233, 100, 50, 50);
  
}



