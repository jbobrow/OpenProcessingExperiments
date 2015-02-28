
void setup(){
  size(200,200);
  smooth();
  
}
void draw(){
  
  float m = millis();
  fill(m % 206,128,153,20);
  noStroke();
  ellipse(mouseX,mouseY,50,50);
  

  rectMode(CENTER);
  //pants
  noStroke();
  fill(28,115,201);
  rect(100,180,90,78);
  //lowerbelly
  noStroke();
  fill(84,201,80);
  ellipse(100,150,110,90);
  //left arm
  fill(84,201,80);
  rect(50,125,35,20);
  //right arm
  fill(84,201,80);
  rect(147,125,35,20);
  //hands
  fill(247,213,154);
  noStroke();
  ellipse(30,125,22,22);
  //hands
  fill(247,213,154);
  noStroke();
  ellipse(168,125,22,22);
  //belly
  fill(84,201,80);
  noStroke();
  ellipse(100,130,90,90);
  //face
  fill(247,213,154);
  noStroke();
  ellipse(100,70,60,60);
  ellipse(100,90,70,70);
  //eyes
  fill(255);
  stroke(1);
  ellipse(87,70,14,20);
  ellipse(110,70,14,20);
  //pupils
  if (mousePressed == true){
    fill(0);
    ellipse(87,70,6,6);
    ellipse(110,70,6,6);
  } else {
  fill(0);
  ellipse(87,70,4,4);
  ellipse(110,70,4,4);
  }
  //mouth
  if (mousePressed == true){
    fill(0);
    ellipse(100,90,10,10);
  } else {
  line(90,90,110,90);
  }
  //belly
  fill(84,201,80);
  
}



