
void setup(){
size(700, 700);
background(178, 255, 112);
}
 
void draw (){
  noStroke();
  
  fill(0, 10);
  rect(0, 0, width, height);

  fill(random(255), random(255), random(255));
  ellipse(random(width), random(height), 20, 20);
  
  //hoodie
  fill(0,100,0); //outside
  rect(180, 450, 355, 400);
  
  fill(143,188,143); //black shirt
  rect(240, 450, 230, 300);
   
  fill(46,139,87); //Shirt
  ellipse(355, 450, 200, 300);
  
  fill(255, 255, 255); //collar
  ellipse(300, 450, 135, 105);
  ellipse(405, 450, 135, 105);
  
  fill(127,255,0); //hood
  ellipse(355, 320, 305, 340);
  
  fill(0); //tie
  ellipse(355, 500, 50, 50);
  ellipse(400, 500, 70, 60);
  ellipse(310, 500, 70, 60);
   
  //head
  fill(239, 216, 162);
  ellipse(355, 325, 280, 300);
   
  //mouth
  fill(255,182,193);
  ellipse(355, 420, 73, 14);
   
  //eyes white
  fill(255, 239, 200);
  ellipse(300, 310, 85, 62);
  ellipse(420, 310, 85, 62);
   
  //eye ball
  fill(139,69,19);
  ellipse(300, 310, 40, 40);
  ellipse(420, 310, 40, 40);
   
  fill(239, 216, 162);
  ellipse(300, 290, 85, 32);
  fill(239, 216, 162);
  ellipse(422, 290, 85, 32);
   
  //hair
  fill(100,149,237);
  ellipse(200, 310, 40, 50);
  ellipse(210, 280, 40, 40);
  ellipse(200, 270, 40, 40);
  ellipse(220, 250, 40, 40);
  ellipse(235, 230, 30, 30);
  ellipse(245, 215, 40, 40);
  ellipse(260, 200, 40, 50);
  ellipse(280, 190, 30, 30);
  ellipse(295, 180, 40, 40);
  ellipse(340, 200, 150, 80);
  ellipse(410, 230, 140, 80);
  ellipse(470, 260, 80, 60);
  ellipse(500, 290, 60, 60);
  ellipse(340, 165, 100, 40);
  ellipse(400, 180, 70, 70);
  ellipse(430, 200, 70, 70);
  ellipse(480, 250, 100, 90);
  ellipse(485, 210, 50, 50);
   
}


