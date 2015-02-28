
void setup() {

  smooth();
  size(450, 400); 
  background(255);
}

void draw() {

  noStroke();
  fill(0);
  //REIHE 1 - 3eck - schwarz

  triangle(100, 0, 125, 50, 150, 0);
  triangle(200, 0, 225, 50, 250, 0);
  triangle(300, 0, 325, 50, 350, 0);


  noStroke();
  fill(255, 120, 0);
  //REIHE 1 - 3eck - orange
  triangle( 50, 0, 75, 50, 100, 0);
  triangle(150, 0, 175, 50, 200, 0);
  triangle(250, 0, 275, 50, 300, 0);
  triangle(350, 0, 375, 50, 400, 0);



  noStroke();

  fill(255, 120, 0);
  //REIHE 1 - 3eck - orange - gespieglt

  triangle(100, 400, 125, 350, 150, 400);
  triangle(200, 400, 225, 350, 250, 400);
  triangle(300, 400, 325, 350, 350, 400);


  noStroke();
  fill(0);
  //REIHE 1 - 3eck - schwarz - gespieglt
  triangle( 50, 400, 75, 350, 100, 400);
  triangle(150, 400, 175, 350, 200, 400);
  triangle(250, 400, 275, 350, 300, 400);
  triangle(350, 400, 375, 350, 400, 400);







  noStroke();
  fill(0);
  //4eck - schwarz
  rect( 75, 50, 50, 50);
  rect( 25, 100, 50, 50);
  rect(125, 100, 50, 50);
  rect( 75, 150, 50, 50);

  noStroke();
  fill(255, 120, 0);
  //4eck - orange - gespiegelt
  rect( 75, 200, 50, 50);
  rect( 25, 250, 50, 50);
  rect(125, 250, 50, 50);
  rect( 75, 300, 50, 50);





  noStroke();
  fill(255);
  //4eck - 2.Reihe - weiß !!!!
  rect(175, 50, 50, 50);
  rect(225, 50, 50, 50);

  //3eck - 2.Reihe - weiß !!!!
  triangle(175, 50, 175, 100, 225, 50);
  triangle(275, 100, 225, 50, 275, 50);




  //3eck - 2.Reihe - orange
  fill(255, 120, 0);
  triangle(125, 50, 125, 100, 175, 50);
  triangle(325, 100, 275, 50, 325, 50);






  noStroke();
  fill(255, 120, 0);
  //Kreis - orange
  ellipse(100, 125, 50, 50);


  noStroke();
  fill(0);
  //Kreis - schwarz - gespiegelt
  ellipse(100, 275, 50, 50);



  noStroke();
  fill(0);
  //3eck - schwarz
  triangle(175, 150, 175, 100, 225, 125);
  triangle(275, 150, 275, 100, 225, 125);


  noStroke();
  fill(255, 120, 0);
  //3eck - orange - gespiegelt
  triangle(175, 300, 175, 250, 225, 275);
  triangle(275, 300, 275, 250, 225, 275);



  noStroke();
  fill(0);
  //4eck - schwarz
  rect(325, 50, 50, 50);
  rect(275, 100, 50, 50);
  rect(375, 100, 50, 50);
  rect(325, 150, 50, 50);


  noStroke();
  fill(255, 120, 0);
  //4eck - orange - gespiegelt
  rect(325, 200, 50, 50);
  rect(275, 250, 50, 50);
  rect(375, 250, 50, 50);
  rect(325, 300, 50, 50);






  noStroke();
  fill(255, 120, 0);
  //Kreis - orange
  ellipse(350, 125, 50, 50);

  noStroke();
  fill(0);
  //Kreis - schwarz - gespiegelt
  ellipse(350, 275, 50, 50);



  noStroke();
  fill(0);
  //3eck - schwarz
  triangle(175, 200, 175, 150, 125, 200);
  triangle(275, 200, 275, 150, 325, 200);

  noStroke();
  fill(0);
  //3eck - orange - gespiegelt    
  triangle(175, 350, 125, 300, 125, 350);
  triangle(275, 350, 325, 300, 325, 350);



  noStroke();
  fill(255, 120, 0);
  //3eck - orange
  triangle(175, 200, 175, 250, 125, 200);
  triangle(275, 200, 275, 250, 325, 200);




  //3eck - schwarz
  fill(0);
  triangle(225, 250, 175, 250, 225, 200);
  triangle(225, 250, 275, 250, 225, 200);


  noStroke();
  fill(255, 120, 0);
  triangle(225, 150, 175, 150, 225, 200);
  triangle(225, 150, 275, 150, 225, 200);




  //3eck - orange
  fill(255, 120, 0);
  triangle(225, 100, 175, 100, 225, 50);
  triangle(225, 100, 275, 100, 225, 50);


  noStroke();
  fill(0);
  triangle(225, 300, 175, 300, 225, 350);
  triangle(225, 300, 275, 300, 225, 350);
}
