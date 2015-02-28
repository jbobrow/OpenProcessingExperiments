
float angle = 0.0;

void setup()
{
  size (900,900);
  smooth();
  background(0);
  strokeWeight(3);
//  noLoop();
  fill(0);
  
/////////////////////////////////////////// SCREEN SEGMENTATION
  for (int i = 300; i < 900; i += 300)
  {
    for (int j = 300; j < 900; j += 300)
     {
        //stroke(0, 0, 0, 25);
       // line(i, 0, i, height);
        //line(0, j, width, j);
     }
  }
  
  
}

void mousePressed()
{
   setup();
}
/////////////////////////////////////////// VOID DRAW
void draw()
{
   //arc(width/2, height/2, 100, 100, 0, PI);
   //rect
   
   //rotate(angle);
   
   for (int i = 150; i < 900; i += 300)
  {
    for (int j = 150; j < 900; j += 300)
     {
      // ellipse(i, j, 300, 300);
       //stroke(0, 0, 0, 25);
       
       
       float randWidth = random(10, 280);
       float randHeight = random(10, 280);
       
       float randStartArc = radians(random(0, 360)+180);
       float randStopArc = radians(random(0, 360)+ 180);
       
       float randStroke = random(5);
      // float randColor(random(255), random(255), random(255));
       
       fill(random(255), random(255), random(255), 50);
//       float randStartArc = radians(random
       //float randStartArc = random
       pushMatrix();
       //drawArc(i, j, randWidth, randHeight, radians(0), radians(180) );
       translate (i, j);
       rotate(angle);

       drawArc(0, 0, randWidth, randHeight, randStartArc, randStopArc );
       popMatrix();
     }
  }
 
  angle += 0.1;
  rectMode(CENTER);
  noStroke();
fill(0,0,0, 5);
  rect(width/2, height/2, 300, 300);

fill(0,0,0, 35);
  rect(450,150,900,300);
  rect(450, 750, 900,300);
  rect(150,450,300,300);
  rect(750,450,300,300); 
 
  
}


//Define Functions here

//void drawArcs(float xPos, float yPos, float w, float h, float start, float stop)
//void drawArcs(float float arcColor, arcStroke float , float arcAlpha)

void drawArc(float xPos, float yPos, float w, float h, float start, float stop)

{
  stroke(0);
  pushMatrix();
  //translate(xPos, yPos);
//  noStroke();
  stroke(255,255,255, 25);
  strokeWeight(2);
  arc(xPos, yPos, w, h, start, stop);

  popMatrix(); 
}

