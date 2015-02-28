
void setup(){
  size(400, 400);
  background (255, 100, 0);
}

void draw(){
  smooth();
  strokeWeight(1);

  //Lizard Man Body
  fill(255,200,0);
  beginShape();
  vertex(150,100);
  vertex(200,50);
  vertex(275,50);
  vertex(325,125);
  vertex(300,150);
  
  vertex(250,150);
  vertex(250,300);
  vertex(300,350);
  vertex(200,350);
  vertex(200,300);
  
  vertex(150,350);
  vertex(100,350);
  vertex(75,325);
  vertex(100,325);
  vertex(150,275);
  
  vertex(150,100);
  endShape();
  
  //Lizard Man Arm
  line(175,175,175,275);
  line(175,275,187.05,262.05);
  line(187.05,262.05,200,275);
  
  line(200,275,212.05,262.05);
  line(212.50,262.05,225,275);
  line(225,275,225,250);
  
  line(225,250,237.05,250);
  line(237.05,250,225,225);
  
  line(225,225,225,175);
  
  //Lizard Man Claws
  fill(255,255,255);
  beginShape();
  vertex(175,262.05);
  vertex(175,275);
  
  vertex(187.05,262.05);
  vertex(200,275);
  vertex(212.05,262.05);
  
  vertex(225,275);
  vertex(225,262.05);
  vertex(175,262.05);
  endShape();
  
  //Lizard Man Thumb
  beginShape();
  vertex(225,250);
  vertex(237.05,250);
  vertex(231,237.05);
  vertex(225,250);
  endShape();
  
  //Lizard Man Glasses Frame
  line(225,125,225,100);
  line(225,100,308,100);
  
  //Lizard Man Glass
  fill(255,255,255);
  beginShape();
  vertex(275,100);
  vertex(275,125);
  vertex(300,125);
  vertex(300,100);
  vertex(275,100);
  endShape();
  
  //Lizard Man Belly
  fill(255,255,0);
  beginShape();
  vertex(250,150);
  vertex(275,175);
  vertex(275,275);
  vertex(250,300);
  vertex(250,150);
  endShape();
  
  //Lizard Man Back
  fill(255,255,0);
  beginShape();
  vertex(150,275);
  vertex(125,250);
  vertex(150,225);
  
  vertex(150,225);
  vertex(125,200);
  vertex(150,175);
  
  vertex(150,175);
  vertex(125,150);
  vertex(150,125);
  endShape();
  
  //Lizard Man Feet
  fill(255,255,255);
  beginShape();
  vertex(275,325);
  vertex(300,350);
  vertex(275,350);
  vertex(275,325);
  endShape();
  
}

