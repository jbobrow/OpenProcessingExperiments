
//Emerging Tech Boy
//cc Austin S. Lee 1/25/2015

void setup(){
  size(400,400);
  background(255);
}

void draw(){
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  stroke(60,200,300);
  fill(60,200,300);
  triangle(200,160,170,260,220,260);
  
  //head
  fill(255);
  stroke(60,200,300);
  ellipse(200,150,100,100);
  strokeWeight(0);
  //legs
  line(210,260,215,305);
  line(180,260,175,305);
  //left arm
  line(210,205,235,280-55);
  line(285-50,225,260-50,300-55);
  //right arm
  line(190,205,60+70,175);
  
   fill(10);
  ellipse(215,150, 6,17 );
  ellipse(185,150, 7,16 );
  noFill();
  stroke(60,60,60);
  strokeWeight(1);
  arc(198, 173, 11, 16, HALF_PI, PI);
  arc(198, 173, 20, 16,0, HALF_PI);
 // arc(195, 165, 40, 40, PI, PI+QUARTER_PI);

 //line(30,20,75,85);
 
  
  strokeWeight(0);
  stroke(60,60,60);
  //arc(50, 55, 50, 50, 0, HALF_PI);
  noFill();
 
 // arc(50, 55, 70, 70, PI, PI+QUARTER_PI);
 // arc(50, 55, 80, 80, PI+QUARTER_PI, TWO_PI);
  
}


