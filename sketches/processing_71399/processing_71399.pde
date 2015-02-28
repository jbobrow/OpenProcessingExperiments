
float circleA = 0;
float circleB = 150;
float circleC = 500;
float circleD = 150;



void setup() {
 
 size(1000,300); 
 background(0);
 smooth();
 frameRate(20);
  
}

void draw() {
  //background(0);
  //noStroke();
  //fill(0);
  
  //lines
  fill(#426e80,15);
stroke(random(#426e80));
strokeWeight(random(.5));
//rect(random(1000),random(300), random(1000),random(300));
rect(pmouseX,pmouseY, random(1000),random(300));
  
   //moving circles
   noStroke();
  //ellipse(pmouseX,pmouseY,100,100);
  ellipseMode(CENTER);
   //ellipse(circleA,circleB, random(100), random(100));
  
  //center
  fill(#fff7d9,50);
  ellipse(500, 150, random(150), random(150));
  ellipse(500, 150, random(200), random(200));
  ellipse(500, 150, random(200), random(100));
  
//moving ball across the screen
ellipse(circleA,circleB,25,25);
  
  
  

  
  //left
  fill(#f45c00,50);
  ellipse(200, 150, random(150), random(150));
  ellipse(200, 150, random(200), random(200));
  ellipse(200, 150, random(200), random(100));
  
  //right
  fill(#ffc018,50);
  ellipse(800, 150, random(150), random(150));
  ellipse(800, 150, random(200), random(200));
  ellipse(800, 150, random(200), random(100));
 
 
 //small circles
 fill(#288dff,50);
  ellipse(500,150,100,100);
   fill(#ffc018,50);
  ellipse(200,150,100,100);
  fill(#f45c00,50);
  ellipse(800,150,100,100);
  
  
  //outter rectangels
  rectMode(CENTER);
  fill(255,255,255,10);
  //rect(500,150,950,25);
  
 fill(0,0,0,50); 
  //rect(1000,300,900,200);
   
   //stroke(255);
   //strokeWeight(2);
   //ine(500,150,pmouseX,pmouseY);
   


  
  
 circleA = circleA + 5;
 //circleB = circleB + 1;
  //circleC = circleC* 2;
  //circleD = circleD*2;
}

void mousePressed() {
  background(0);


}

  

