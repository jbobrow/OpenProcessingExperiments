
//Copyright Colleen Clifford 8 Sept. 2013 Pittsburgh, PA


  float x, y, wd, ht;
void setup()
{
  size(400, 400);
  rectMode(CENTER);
  background(211, 255, 247);
  frameRate (10);
  
  //variables
  x= width*.5;
  y= height*.5;
  wd= width*.5;
  ht= height*.5;
}

void draw()
{ 
  noStroke();
  fill(211, 255, 247);
  rect(x, y- height*.5, width*2, height*1.25);
  fill(28, 124, 0);
  rect(x, y+ height*.5, width*2, height*.5);
  
  fill(255, 183, 202);
  stroke(0, 0, 0);
  strokeWeight(2);
  
  wd= wd+.5;
  ht= ht+.5;
   
  //front leg
  quad(x+ wd*.45, y+ ht*.4, x+ wd*.25, y+ ht*.4,  x+ wd*.42, y+ ht*.65, x+ wd*.52, y+ ht*.65);
  //back leg
  quad(x- wd*.45, y+ ht*.4, x- wd*.25, y+ ht*.4,  x- wd*.2, y+ ht*.7, x- wd*.3, y+ ht*.7);
  //body
  ellipse(x, y+ ht*.25, wd, ht*.625);
  triangle(x+ wd*.25, y- ht*.3, x+ wd*.4, y- ht*.18, x+ wd*.2, y- ht*.1);
  triangle(x+ wd*.57, y- ht*.3, x+ wd*.62, y- ht*.05, x+ wd*.4, y- ht*.18);
  ellipse(x+ wd*.4, y, wd*.45, ht*.4);
  ellipse(x+ wd*.4, y+ ht*.02, wd*.2, ht*.16);
  fill(0, 0, 0);
  ellipse(x+ wd*.44, y+ ht*.015, wd*.05, ht*.04);
  ellipse(x+ wd*.36, y+ ht*.015, wd*.05, ht*.04);
  fill(255, 255, 255);
  ellipse(x+ wd*.33, y- ht*.1, wd*.1, ht*.1);
  ellipse(x+ wd*.47, y- ht*.1, wd*.1, ht*.1);
  ellipse(x+ wd*.33, y- ht*.08, wd*.015, ht*.015);
  ellipse(x+ wd*.47, y- ht*.08, wd*.015, ht*.015);
  //tail
  noFill();
  arc(x- wd*.47, y- ht*.055, wd*.1, ht*.1, 0, PI+HALF_PI);
  arc(x- wd*.42, y, wd*.125, ht*.125, QUARTER_PI, PI+HALF_PI);
  //backleg
  fill(255, 183, 202);
  noStroke();
  ellipse(x- wd*.35, y+ ht*.45, wd*.19, ht*.19);
  stroke(0, 0, 0);
  strokeWeight(2);
  arc(x- wd*.35, y+ ht*.4, wd*.35, ht*.35, -1.3, 1);
  arc(x- wd*.35, y+ ht*.4, wd*.2, ht*.3, HALF_PI, 3.4);
  //clouds
  noStroke();
  fill(255, 255, 255);
  ellipse(wd, y- height*.35, width*.25, height*.2);
  ellipse(wd+ width*.13, y- height*.32, width*.15, height*.1);
  ellipse(wd- width*.15, y- height*.38, width*.25, height*.21);
  ellipse(wd- width*.25, y- height*.34, width*.13, height*.12);
}

void mousePressed() //move legs
{
  noStroke();
  fill(211, 255, 247);
  rect(x, y- height*.5, width*2, height*1.25);
  fill(28, 124, 0);
  rect(x, y+ height*.5, width*2, height*.5);
  
  fill(255, 183, 202);
  stroke(0, 0, 0);
  strokeWeight(2);
  
  //front leg
  quad(x+ wd*.45, y+ ht*.4, x+ wd*.25, y+ ht*.4,  x+ wd*.22, y+ ht*.65, x+ wd*.32, y+ ht*.65);
  //back leg
  quad(x- wd*.45, y+ ht*.4, x- wd*.25, y+ ht*.4,  x- wd*.3, y+ ht*.7, x- wd*.4, y+ ht*.7);
  //body
  ellipse(x, y+ ht*.25, wd, ht*.625);
  triangle(x+ wd*.2, y- ht*.3, x+ wd*.4, y- ht*.18, x+ wd*.2, y- ht*.1);
  triangle(x+ wd*.57, y- ht*.3, x+ wd*.62, y- ht*.05, x+ wd*.4, y- ht*.18);
  ellipse(x+ wd*.4, y, wd*.45, ht*.4);
  ellipse(x+ wd*.4, y+ ht*.02, wd*.2, ht*.16);
  fill(0, 0, 0);
  ellipse(x+ wd*.44, y+ ht*.02, wd*.05, ht*.04);
  ellipse(x+ wd*.36, y+ ht*.02, wd*.05, ht*.04);
  fill(255, 255, 255);
  ellipse(x+ wd*.33, y- ht*.1, wd*.1, ht*.1);
  ellipse(x+ wd*.47, y- ht*.1, wd*.1, ht*.1);
  ellipse(x+ wd*.33, y- ht*.08, wd*.015, ht*.015);
  ellipse(x+ wd*.47, y- ht*.08, wd*.015, ht*.015);
  //tail
  noFill();
  arc(x- wd*.47, y- ht*.055, wd*.1, ht*.1, 0, PI+HALF_PI);
  arc(x- wd*.42, y, wd*.125, ht*.125, QUARTER_PI, PI+HALF_PI);
  //backleg
  fill(255, 183, 202);
  noStroke();
  ellipse(x- wd*.35, y+ ht*.45, wd*.19, ht*.19);
  stroke(0, 0, 0);
  strokeWeight(2);
  arc(x- wd*.35, y+ ht*.4, wd*.35, ht*.35, -1.3, 1);
  arc(x- wd*.35, y+ ht*.4, wd*.2, ht*.3, HALF_PI, 3.4);
   //clouds
  noStroke();
  fill(255, 255, 255);
  ellipse(wd, y- height*.35, width*.25, height*.2);
  ellipse(wd+ width*.13, y- height*.32, width*.15, height*.1);
  ellipse(wd- width*.15, y- height*.38, width*.25, height*.21);
  ellipse(wd- width*.25, y- height*.34, width*.13, height*.12);
}


