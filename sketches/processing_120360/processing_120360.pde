
void setup()
{
  size(500, 500);
}

void draw()
{
  background(255);
  //linien horizontal
  fill(100);
  noStroke();
  rect(0, 0, 500, 20);
  rect(0, 100, 500, 20);
  rect(0, 200, 500, 20);

 

  //linien minuten
  fill(191, 10, 37);
  stroke(191, 10, 37);
  line(34, 100, 34, 160); //5 -L1     +34
  rect(68, 100, 1, 60); //10
  //+36
  line(104, 100, 104, 160); //15 -L3
  rect(138, 100, 1, 60); //20
  //+36
  line(174, 100, 174, 160); //25 -L5
  rect(208, 100, 1, 60); //30

    line(244, 100, 244, 160); //35 -L7
  rect(278, 100, 1, 60); //40

    line(314, 100, 314, 160); //45 -L9
  rect(348, 100, 1, 60); //50

    line(384, 100, 384, 160); //55 -L11
    rect(418, 100, 1, 60); //60



  translate(0, 100);
  fill(191, 10, 37);
  stroke(191, 10, 37);

  //linien sekunden
  fill(191, 10, 37);
  stroke(191, 10, 37);
  line(34, 100, 34, 160); //5 -L1     +34
  rect(68, 100, 1, 60); //10
  //+36
  line(104, 100, 104, 160); //15 -L3
  rect(138, 100, 1, 60); //20
  //+36
  line(174, 100, 174, 160); //25 -L5
  rect(208, 100, 1, 60); //30

    line(244, 100, 244, 160); //35 -L7
  rect(278, 100, 1, 60); //40

    line(314, 100, 314, 160); //45 -L9
  rect(348, 100, 1, 60); //50

    line(384, 100, 384, 160); //55 -L11
    rect(418, 100, 1, 60); //60

  translate(0, -100);

  fill(0);
  stroke(0);
  
  
  translate(10, 0);


  pushMatrix();
  {
    int h=hour();
    for (int i=0; i<h*20; i+=20) 
    {
      ellipse(i, 50, 20, 20);
    }
  } 
  popMatrix();


  translate(-10, 0);
  
  translate(2.5, 0);
  pushMatrix();
  int m=minute();
  for (int i=0; i<m*5; i+=7) 
  {
    ellipse(i, 150, 5, 5);
  }
  popMatrix();


  pushMatrix();
  int s=second();
  for (int i=0; i<s*5; i+=7) 
  {
    ellipse(i, 250, 5, 5);
  }
  popMatrix();
}
