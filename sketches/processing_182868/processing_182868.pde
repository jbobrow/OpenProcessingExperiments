




void setup() {
  size(600, 360
  );
  noStroke();
}

void draw() {
  background(255);
  fill(255);
  stroke(0);
  size(630, 400);
  
fill(0);
for (int i = 0 ; i < 200; i++) {
  for (int j = 0 ; j < 200; j++) {
 
    ellipse(20*i, 20*j, 27, 19) ;
  }
}
fill(255);
  ellipse(320, 144, 200, 200);
  
  fill(0);
arc(300, 172, 80, 80, 0, PI+QUARTER_PI, CLOSE);


  fill(255);
  arc(295, 185, 50, 50, 0, PI+QUARTER_PI, CLOSE);

 // rect(295, 185, 50, 50);


//rect(295, 165, 50, 50, 50);
  

  fill(0);
  noStroke();
  ellipse(278, 99, 50, 50);

  fill(0);
  noStroke();
  ellipse(278, 99, 50, 50);
  
 
  fill(255);
  noStroke();
  ellipse(287, 90, 20, 20);


  fill(0);
  noStroke();
  ellipse(355, 99, 50, 50);

 fill(255);
 noStroke();
  ellipse(287, 90, 5, 5);
  

  fill(255);
  noStroke();
 ellipse(363, 90, 20, 20);

 //fill(0);
 //noStroke();
 // ellipse(366, 84, 5, 5);

  //fill(0);
 //noStroke();
  //ellipse(290, 83, 5, 5);
  
  //fill(204);
//triangle(18, 18, 18, 50, 50, 50);

  fill(0);
  text(mouseX + "," + mouseY, 20, 20);
}



