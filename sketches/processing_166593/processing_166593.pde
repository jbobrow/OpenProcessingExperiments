



void setup() {
  size(500,500) ;
  background(#B2B3B4) ;
  noStroke();
}

void draw() {
//rain
fill(#7CC2FA) ;
for (int y = 0 ; y < 30 ; y++) {
for (int x = 0 ; x < 30 ; x++) {
 ellipse(20*x, 30*y, 10, 15) ;
  }
}
//sun
fill(#E0B130);
ellipse(0, 0, 200, 200);
 

fill(#2E551B);
rect(248, 200, 5, 500);
 
fill(#890A2C);
ellipse(250, 170, 50, 40);
ellipse(220, 180, 50, 40);
ellipse(280, 180, 50, 40);
ellipse(210, 200, 50, 40);
ellipse(290, 200, 50, 40);
ellipse(220, 220, 50, 40);
ellipse(280, 220, 50, 40);
ellipse(250, 230, 50, 40);
 
//middle
fill(250, 255, 0);
ellipse(250, 200, 50, 50);
 
//petals
fill(#2E551B);
ellipse(225, 300, 50, 40);
ellipse(275, 300, 50, 40);

//grass
fill(#2E551B);
ellipse(250, 850, 800, 800);
}


