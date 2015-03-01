
color color1, color2, color3;



int circleX = width/8;
int circleA =width/8;
int circleB=width/8;
int circleC =width/8;
int circleD= width/8;
int circleE=width/8;
int circleF=width/8;
int circleG=width/8;
int circleH=width/8;




void setup() {
  size(600, 600);
  background(0, 0, 0);
  noiseSeed(10);
}
void draw() {
  color1=#2c4072;
  color2=#5be22b;
  color3=#049247;
  background(0, mouseY, 255);
  float sinOfTime = sin( millis() * 0.007 );
  float sinMappedX = map( sinOfTime, -1.0, 1.0, 5, 25 );
  float sinMappedY = map( sinOfTime, -1.0, 1.0, 5, 25 );

  float circA=20;
  float circX=20;
  float circB=20;
  float circC=20;
  float circD=20;
  float circE=20;
  float circF=20;
  float circG=20;
  float circH=20;





  if (mouseX>0 && mouseX <width/8 && mouseY>0 && mouseY<height/8)
  {
    if (mousePressed)
    {
      fill(color2);
      circA=circA*sinMappedX/10;
    } else fill(color3);
    circleA = circleA+5;
  }
  if (circleA > width) {
    circleA = width/8;
  }

  ellipse(circleA, height/16, circA, circA);
  stroke(color1);
  rect(0, 0, width/8, height/8);
  fill(color1);



  ////////////////////////////////////////////////////////////

  if (mouseX>0 && mouseX <width/8 && mouseY>height/8 && mouseY<2*height/8)
  { 
    if (mousePressed)
    {
      fill(color2);
      circX=circX*sinMappedX/10;
    } else fill(color3);

    circleX = circleX+10;
  }

  if (circleX > width) {
    circleX = width/8;
  }


  ellipse(circleX, 3*height/16, circX, circX);

  rect(0, height/8, width/8, height/8);
  fill(color1);
  stroke(color1);

  ////////////////////
  if (mouseX>0 && mouseX <width/8 && mouseY>2*height/8 && mouseY<3*height/8)
  {
    if (mousePressed)
    {
      fill(color2);
      circB=circB*sinMappedX/10;
    } else fill(color3);
    circleB = circleB+5;
  }
  if (circleB > width) {
    circleB = width/8;
  }
  ellipse(circleB, 5*height/16, circB, circB);
  rect(0, 2*height/8, width/8, height/8);
  stroke(color1);
  fill(color1);





  //////////////////////////////////////////////////////////////
  if (mouseX>0 && mouseX <width/8 && mouseY>2*height/8 && mouseY<3*height/8)
  {
    if (mousePressed)
    {
      fill(color2);

      circC=circC*sinMappedX/10;
    } else fill(color3);
    stroke(color3);
    circleC = circleC+5;
  }
  if (circleC > width) {
    circleC = width/8;
  }
  ellipse(circleC, 5*height/16, circC, circC);

  rect(0, 2*height/8, width/8, height/8);
  fill(color1);
  stroke(color1);



  ////////////////////////////////////////////////////////////
  if (mouseX>0 && mouseX <width/8 && mouseY>3*height/8 && mouseY<4*height/8)
  {
    if (mousePressed)
    {
      fill(color2);
      circD=circD*sinMappedX/10;
    } else fill(color3);
    circleD = circleD+10;
  }
  if (circleD > width) {
    circleD = width/8;
  }
  ellipse(circleD, 7*height/16, circD, circD);
  rect(0, 3*height/8, width/8, height/8);
  fill(color1);
  stroke(color1);



  /////////////////////////line/////////////
  if (mouseX>0 && mouseX <width/8 && mouseY>4*height/8 && mouseY<5*height/8)
  {
    if (mousePressed)
    {
      fill(color2);

      circE=circE*sinMappedX/10;
    } else fill(color3);
    circleE = circleE+5;
  }
  if (circleE > width) {
    circleE = width/8;
  }




  ellipse(circleE, 9*height/16, circE, circE);
  stroke(color1);
  rect(0, 4*height/8, width/8, height/8);
  fill(color1);



  /////////////////////////line/////////////
  if (mouseX>0 && mouseX <width/8 && mouseY>5*height/8 && mouseY<6*height/8)
  {
    if (mousePressed)
    {
      fill(color2);

      circF=circF*sinMappedX/10;
    } else fill(color3);
    circleF = circleF+5;
  }
  if (circleF > width) {
    circleF = width/8;
  }



  ellipse(circleF, 11*height/16, circF, circF);

  rect(0, 5*height/8, width/8, height/8);
  fill(color1);
  stroke(color1);


  if (mouseX>0 && mouseX <width/8 && mouseY>6*height/8 && mouseY<7*height/8)
  {
    if (mousePressed)
    {
      fill(color2);
      circG=circG*sinMappedX/10;
    } else fill(color3);
    circleG = circleG+5;
  }
  if (circleG > width) {
    circleG = width/8;
  }
  ellipse(circleG, 13*height/16, circG, circG);
  rect(0, 6*height/8, width/8, height/8);
  stroke(color1);
  fill(color1);





  //////////////////////////////////////////////////////////////
  if (mouseX>0 && mouseX <width/8 && mouseY>7*height/8 && mouseY<8*height/8)
  {
    if (mousePressed)
    {
      fill(color2);
      circH=circH*sinMappedX/10;
    } else fill(color3);

    circleH = circleH+5;
  }
  if (circleH> width) {
    circleH = width/8;
  }
  ellipse(circleH, 15*height/16, circH, circH);

  rect(0, 7*height/8, width/8, height/8);
  fill(color1);
  stroke(color1);



  ////////////////////////////////////////////////////////////
}



