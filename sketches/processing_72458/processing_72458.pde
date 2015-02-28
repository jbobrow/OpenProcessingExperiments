
float circleA = 0;
float circleB = 150;
float circleC = 500;
float circleD = 150;
float circleE = 0;
float circleF = 0;
float circleX = 500;
float circleY = 0;



void setup() {

  size(1000, 300); 
  background(0);
  smooth();
  frameRate(20);
}

void draw() {
  background(0);
  //noStroke();
  //fill(0);

  //lines
  fill(#426e80, 15);
  stroke(random(#426e80));
  strokeWeight(random(.5));
  //rect(random(1000),random(300), random(1000),random(300));
  rect(pmouseX, pmouseY, random(1000), random(300));

  //moving circles
  
  ellipseMode(CENTER);
  
  //center
  fill(#1063fc, 20);
  ellipse(500, 150, random(150), random(150));
  ellipse(500, 150, random(200), random(200));
  ellipse(500, 150, random(200), random(100));
  
  fill(#1063fc, 20);
  ellipse(300, 110, random(150), random(150));
  ellipse(300, 110, random(200), random(200));
  ellipse(300, 110, random(200), random(100));
  
  fill(#1063fc, 20);
  ellipse(100, 150, random(150), random(150));
  ellipse(100, 150, random(200), random(200));
  ellipse(100, 150, random(200), random(100));
  
    fill(#1063fc, 20);
  ellipse(700, 110, random(150), random(150));
  ellipse(700, 110, random(200), random(200));
  ellipse(700, 110, random(200), random(100));
  
  fill(#1063fc, 20);
  ellipse(900, 150, random(150), random(150));
  ellipse(900, 150, random(200), random(200));
  ellipse(900, 150, random(200), random(100));

  //moving ball across the screen
  fill(#fff7d9, 10);
  ellipse(circleA%1000, random(500), 250, 250);
  fill(#fff7d9, 15);
  ellipse(circleE%1000, circleB, 250, 250);
  fill(#fff7d9, 15);
  ellipse(circleF%1000, circleB, 250, 250);

  fill(#f45c00, 150);
  ellipse(circleE%1000, circleB, 25, 25);

  fill(#ffc018, 150);
  ellipse(circleF%1000, circleB, 25, 25);

  fill(#f45c00, 150);
  ellipse(circleX, circleY%300, 25, 25);
    fill(#f45c00, 140);
  ellipse(circleX-200, circleY%320, 25, 25);
    fill(#f45c00, 160);
  ellipse(circleX-400, circleY%340, 25, 25);
    fill(#f45c00, 120);
  ellipse(circleX+200, circleY%320, 25, 25);
  fill(#f45c00, 110);
  ellipse(circleX+400, circleY%340, 25, 25);







  //outter rectangels
  rectMode(CENTER);
  noStroke();
 fill(#000000, 20);
  rect(500,150,1000,25);



  


  fill(255);
  rectMode(CENTER);

  
  rect(500, 220, 25, 5);
   rect(500, 240, 25, 5);
    rect(500, 260, 25, 5);
     rect(500, 280, 25, 5);
      rect(500, 300, 25, 5);
      
      rect(100, 220, 25, 5);
   rect(100, 240, 25, 5);
    rect(100, 260, 25, 5);
     rect(100, 280, 25, 5);
      rect(100, 300, 25, 5);
      
      rect(900, 220, 25, 5);
   rect(900, 240, 25, 5);
    rect(900, 260, 25, 5);
     rect(900, 280, 25, 5);
      rect(900, 300, 25, 5);
      
      rect(300, 300, 25, 5);
      rect(300, 280, 25, 5);
      rect(300, 260, 25, 5);
      rect(300, 240, 25, 5);
      rect(300, 220, 25, 5);
      rect(300, 200, 25, 5);
      rect(300, 180, 25, 5);
      
      rect(700, 300, 25, 5);
      rect(700, 280, 25, 5);
      rect(700, 260, 25, 5);
      rect(700, 240, 25, 5);
      rect(700, 220, 25, 5);
      rect(700, 200, 25, 5);
      rect(700, 180, 25, 5);
      
      stroke(#fcd810,100);
      strokeWeight(.5);
      line(0,0,1000,0);
      line(0,5,1000,5);
      line(0,10,1000,10);
      line(0,15,1000,15);
      line(0,20,1000,20);
      line(0,25,1000,25);
      line(0,30,1000,30);
      line(0,35,1000,35);
      line(0,40,1000,40);
      line(0,45,1000,45);
      line(0,50,1000,50);
      

  circleA = circleA + 5.2;
  circleE = circleE + 5.2;
  circleF = circleF + 5.4;
  circleY = circleY + 5;


  //circleB = circleB + 1;
  //circleC = circleC* 2;
  //circleD = circleD*2;
}

void mousePressed() {
  background(0);
}


