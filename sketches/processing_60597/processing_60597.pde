
void setup() {
  size(400, 400);
  background(255);
  smooth();
}
 
void draw() {
 
  //Koerper
  stroke(0);
  strokeWeight(7);
  fill(0);
  ellipse(200, 350, 300, 450);
  
  //MASKE
  noStroke();
  fill(0);
  ellipse(200, 170, 200, 150);
  ellipse(200, 160, 200, 100);
  ellipse(200, 150, 200, 100);
  ellipse(200, 140, 200, 100);
  ellipse(200, 130, 200, 100);
  ellipse(200, 120, 200, 100);
  ellipse(200, 100, 200,  80);
  ellipse(200, 110, 200,  80);
  ellipse(200, 120, 200,  50);
  ellipse(200,  90, 200,  50);
  
  //OHREN
  ellipse(113, 110, 25, 150);
  ellipse(287, 110, 25, 150);

    //MUND > AUSSEN > weiss
  noStroke();
  fill(255);
  ellipse(200, 190, 140, 80);
  ellipse(200, 185, 140, 70);
  ellipse(200, 180, 140, 70);  
  ellipse(200, 175, 140,100);
  ellipse(200, 170, 140,100);

  //MUND > AUSSEN > schwarz
  noStroke();
  fill(0);
  ellipse(200, 152, 170, 10);
  ellipse(200, 142, 170, 20);
  ellipse(200, 132, 170, 25);

  //AUGEN > MASKE
  noStroke();
  fill(255);
  ellipse(150, 120, 30, 16);
  ellipse(250, 120, 30, 16);
 
  //AUGEN 
  stroke(0);
  strokeWeight(3);
  noFill();
  ellipse(150, 121, 18,  8);
  ellipse(250, 120, 16, 10);
  
  //AUGEN > IRIS
  noStroke();
  fill(0);
  ellipse(150, 121,  5, 7);
  ellipse(250, 120,  6, 9);
  
  //NASE
  noStroke();
  fill(255);
  ellipse(199, 150, 15, 10);
  ellipse(201, 150, 15, 10);
  ellipse(199, 145, 10, 15);

   //MUND
  stroke(0);
  strokeWeight(4);
  fill(255);
  ellipse(200, 185, 61, 11);

   //ZAEHNE
  stroke(0);
  strokeWeight(3);
  noFill();
  ellipse(224, 185, 5,  7);
  ellipse(213, 185, 6,  9);
  ellipse(200, 185, 6, 10);
  ellipse(187, 185, 6,  9);
  ellipse(176, 185, 5,  7);
  
  //MUNDWINKEL 
  stroke(0);
  strokeWeight(4);
  noFill();
  ellipse(153, 184, 30, 25);
  ellipse(247, 184, 30, 25);
  
  noStroke();
  fill(255);
  ellipse(152, 184, 30, 45);
  ellipse(249, 184, 30, 45);
  
  //BACKEN 
  noStroke();
  fill(255,220,220);
  ellipse(147, 178, 30, 30);
  ellipse(253, 178, 30, 30);
 
}
