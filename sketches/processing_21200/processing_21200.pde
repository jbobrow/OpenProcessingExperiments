

void setup()
{
 size (300,300);
 smooth();
}

void draw()
{

 strokeWeight(2); 
 line(100,0,100,300);
 line(200,0,200,300);
 line(0,100,300,100);
 line(0,200,300,200);
 drawY2 (50,50,2,255,255,255,0,1);
}
 void drawY2 (float xPos, float yPos, int weight, int R, int B, int G, float rot, float a)
 {
 pushMatrix();
 translate(xPos, yPos);
 stroke(R,B,G);
 strokeWeight(weight);
 rotate(rot);
 line(0, 0, -30*a,-30*a);
 line(0, 0, 30*a, -30*a);
 line(0, 0, 0, 40*a);
 popMatrix();
 }
void mousePressed()
{
  stroke(0, 0, 0);
  background(random(255),random(255), random(255));
  strokeWeight(2); 
  line(100,0,100,300);
  line(200,0,200,300);
  line(0,100,300,100);
  line(0,200,300,200);
 
  if(mouseX >100 && mouseX<200 && mouseY>0 && mouseY<100) //2
  {
   drawY2 (150,50,25,0,0,0,0,1);
     }
     
  if (mouseX>200 && mouseX<300 && mouseY>0 && mouseY<100) //3
  { 
   noFill();
   strokeWeight(5);
   stroke(random(255), random(255),random(255));
   rect(220,20,60,60);
   ellipse (250,50,90,90);
   drawY2 (250,50,4,20,250,40,0,1);
  }
  
  if (mouseX>0 && mouseX<100 && mouseY>100 && mouseY<200) //4
  {
   noFill();
   strokeWeight(5);
   stroke(random(255), random(255),random(255));
   ellipse(50,150,80,80);
   triangle (10,190,50,110,90,190);
   drawY2 (50,150,5,100,50,140,PI,1);
  }
  
  if (mouseX>100 && mouseX<200 && mouseY>100 && mouseY<200) //5
  {
   noFill();
   strokeWeight(5);
   stroke(random(255), random(255),random(255));
   rect(110,110,80,80);
   ellipse (150,150,80,80);
   drawY2(150, 150, 4, 255, 0, 0, PI/2,1);
  }
  
  if (mouseX>200 && mouseX<300 && mouseY>100 && mouseY<200) //6
  {
   noFill();
   strokeWeight(10);
   stroke(random(255), random(255),random(255));
   ellipse (250,150,50,50);
   ellipse (250,150,90,90);
   drawY2 (250,150,4,250,93,3,0,0.5);
  }
  
  if (mouseX>0 && mouseX<100 && mouseY>200 && mouseY<300) //7
  {
    drawY2 (50,220,4,22,9,180,0,0.2);  
    drawY2 (50,250,4,22,9,180,0,1);
    drawY2 (20,275,4,22,9,180,0,0.6);
    drawY2 (70,260,4,22,9,180,0,0.8);

  }
  
  if (mouseX>100 && mouseX<200 && mouseY>200 && mouseY<300) //8
  {
    for (int i=0;i<20; i=i+5)
    {
      for (int j=0;j<20; j= j+5)
      {
        drawY2 (143+i,260-j,2,241,137,247,0,1);
      }
    }
  }
  
  if (mouseX>200 && mouseX<300 && mouseY>200 && mouseY<300) //9
  {
    noStroke();
    rect(200,200,100,100);
    fill(random(255));
    drawY2 (250,250,4,34,154,242,0,1);
  }
  
  }

