
//Author: Luiz Ernesto Merkle

PFont feicoes;
void setup()
{
  size(200, 200);
  smooth();
  rectMode(CENTER);
  strokeWeight(4);
  strokeCap(ROUND);
  feicoes = loadFont("LMSans10-Bold-48.vlw");
  textFont(feicoes, 30);
  textAlign(CENTER, CENTER);
  // noLoop();
}

void draw()
{ 

  background(0);
  fill(255);

  // head
  stroke(0);
  fill(200);
  rect(width/2, height/2, width/2, height/2, height/15);

  // eyes
  pushMatrix();
  translate(width/2, height/2);
  rotate(-PI/4);
  fill(0);
  text("+ l +", 0, 0);
  noFill();
  stroke(255, 255, 0);
  popMatrix();

  //mouth
  pushMatrix();
  translate(width*3/5, height*3/5);
  rotate(PI/4);
  fill(255, 0, 0);
  text(")", 0, 0);
  popMatrix();

  //hair
  pushMatrix();
  strokeWeight(1);
  stroke(255, 100, 10);
  translate(width/4+5, height/4+5);
  for (int i = 1; i<50; i++)
  {
    pushMatrix();
    rotate((i*PI/100));
    line(0, 0, width/2.3*(1-1.5*(mouseX+1.0)/width*sin(map(i, 1, 49, 0, PI))), 0);
    popMatrix();
  }
  popMatrix();
  
  fill(255,255,0);
  text("emili@s", width/2, height-30);
}



