
float frankyX;
float frankyY;

float eyeR;
float eyeG;
float eyeB;

void setup() {
  size(300, 300);
  smooth();
  frameRate(20);
  
  frankyX= width/2;
  frankyY= height/2;
  
}

void draw() {
  background(255);
  rectMode(CENTER);
  ellipseMode(CENTER);

  //head
  fill(0, 150, 0);
  rect(frankyX, frankyY-60, 50, 100);

  //hair
  fill(0);
  noStroke();
  triangle(frankyX-25, frankyY-110, frankyX-30, frankyY-100, frankyX-15, frankyY-110);
  triangle(frankyX-15, frankyY-110, frankyX-20, frankyY-100, frankyX-5, frankyY-110);
  triangle(frankyX-5, frankyY-110, frankyX-10, frankyY-100, frankyX+5, frankyY-110);
  triangle(frankyX+5, frankyY-110, frankyX, frankyY-100, frankyX+15, frankyY-110);
  triangle(frankyX+15, frankyY-110, frankyX+10, frankyY-100, frankyX+25, frankyY-110);
   

    
    //mouth
    fill(255, 0, 0);
  stroke(0);
  ellipse(frankyX, frankyY-30, 10, 5);

  // bumbpy eyes
  fill(255);

  ellipse(frankyX-15, frankyY-50, 10, 10);
  ellipse(frankyX+15, frankyY-50, 10, 10);

  //eyes
  fill(frankyX, 0, frankyY);
  ellipse(frankyX-15, frankyY-50, 3, 3);
  ellipse(frankyX+15, frankyY-50, 3, 3);


  //torso
  fill(230, 168, 5);
  rect(frankyX, frankyY+5, 25, 30); 

  //tie
  fill(0);
  triangle(frankyX-3, frankyY-10, frankyX+3, frankyY-10, frankyX, frankyY-2);

  beginShape();

  vertex(frankyX, frankyY-2);
  vertex(frankyX-3, frankyY+5);
  vertex(frankyX, frankyY+12);
  vertex(frankyX+3, frankyY+5);
  endShape(CLOSE);

  //HANDS
  line(frankyX-12.5, frankyY-10, frankyX-27, frankyY+12);
  line(frankyX+12.5, frankyY-10, frankyX+27, frankyY+12);

  fill(0, 150, 0);
  ellipse(frankyX-27, frankyY+12, 4, 4);
  ellipse(frankyX+27, frankyY+12, 4, 4);

  //legs
  line(frankyX-5, frankyY+20, frankyX-5, frankyY+40);
  line(frankyX+5, frankyY+20, frankyX+5, frankyY+40);

  fill(200, 0, 0);
  ellipse(frankyX-9, frankyY+40, 12, 7);
  ellipse(frankyX+9, frankyY+40, 12, 7);
  
}



