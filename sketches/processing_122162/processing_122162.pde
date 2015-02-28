
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
 
  // cabeça
  stroke(0);
  fill(250, 225, 197);
  rect(width/2, height/2, width/2, height/2, height/15);
 
  // olhos
  pushMatrix();
  translate(width/2, height/2);
  rotate(-PI/4);
  fill(105, 40 , 0);
  text("•   •", 0, 0);
  fill(0);
  text("l", 0, 10);
  noFill();
  stroke(255, 255, 0);
  popMatrix();  

 
  //boca
  pushMatrix();
  translate(width*3/5, height*3/5);
  rotate(PI/4);
  fill(227, 0, 121);
  text(")", 0, 0);
  popMatrix();
 
  //cabelo
  pushMatrix();
  strokeWeight(1);
  stroke(105, 40, 0);
  translate(width/4+5, height/4+5);
  for (int i = 1; i<50; i++)
  {
    pushMatrix();
    rotate((i*PI/100));
    line(0, 0, width/2.3*(1-1*(mouseX+2.0)/width*sin(map(i, 2, 49, 0, PI))), 0);
    popMatrix();
  }
  popMatrix();
  
  //lacinho
  pushMatrix();
  translate(width*2/7, height*2/5);
  rotate(5.3);
  fill(181, 0, 247);
  text("♥", 0, 0);
  popMatrix();
   
  fill(247,0,161);
  text("emilias", width/2, height-30);
}
