
int eSize = 10;
size(400, 400);
background(255);
smooth();


noStroke();
colorMode(HSB, 200);
for (int i = 0; i < 400; i++) {
  for (int j = 0; j < 400; j++) {
    stroke(i, j, 100);
    point(i, j);
  }
}

smooth(); 

fill(40, 150, 167);
for (int y=0; y<=400; y+=50) {
  for (int x=0; x<=400; x+=50) {

    if (x < width/2 && y < height/2) {  
      fill(x);
    }   
    if (x >= width/2 && y < height/2) {  
      fill(y);
    }

    rect(x, y, 40, 40);
    println("x=" + x + ", y=" + y); //
  }
}



stroke(0, 0, 0);
fill(40, 150, 255, 255);
arc(200, 220, 310, 310, 0, HALF_PI);
arc(200, 220, 320, 320, HALF_PI, PI);
arc(200, 220, 330, 330, PI, PI+QUARTER_PI);
arc(190, 220, 340, 340, PI+QUARTER_PI, TWO_PI);

stroke(0);
fill(40, 255, 255, 255);
arc(200, 220, 240, 240, 0, HALF_PI);
arc(200, 220, 250, 250, HALF_PI, PI);
arc(200, 220, 260, 260, PI, PI+QUARTER_PI);
arc(190, 220, 270, 270, PI+QUARTER_PI, TWO_PI);

stroke(0);
fill(60, 255, 255);
arc(200, 220, 140, 140, 0, HALF_PI);
arc(200, 220, 150, 150, HALF_PI, PI);
arc(200, 220, 160, 160, PI, PI+QUARTER_PI);
arc(190, 220, 170, 170, PI+QUARTER_PI, TWO_PI);



noStroke();
colorMode(RGB, 400);
for (int i = 0; i < 400; i++) {
  for (int j = 0; j < 400; j++) {
    stroke(i, j, 100,250);
    point(i, j);
  }
}



smooth();  

for (int y=0; y<=height; y+=20) {
  for (int x=0; x<=width; x+=20) {

    if (x > 50 && x < 350) { 
      fill(255);
    } else {   
      fill(0);
    }
    ellipse(x, y, 0, eSize);
    println("x=" + x + ", y=" + y);
  }
}


