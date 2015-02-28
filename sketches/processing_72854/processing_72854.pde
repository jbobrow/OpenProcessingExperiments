
void setup()
{
  size (500, 500);
}
void draw()
{
  float changex=0;
  float changey=0;
  
  background (0);
  
  strokeWeight(4);
  stroke(20,36,15);
  noFill();
  ellipse(250,250,140,140);
  
  noStroke();
 
  fill(100,100,0);
  ellipse(295,260,6,6);
  ellipse(375,245,30,30);
  fill(21,12,150);
  ellipse(306,240,6,6);
  ellipse(490,250,25,25);
  fill(75,2,6);
  ellipse(280,250,3,3);
  ellipse(315,255,5,5);
  fill(150,200,40);
  ellipse(435,260,20,20);
  stroke(150,4,12);
  ellipse(375,245,30,1);
  stroke(50,100,75);
  ellipse(435,260,20,.2);
  noStroke();
  
  
  if (mousePressed == true)
  {
  
    changex = random(-16,16);
    changey = random(-6,6);
    fill(300-random(150,256),0+random(0,30),0);
    ellipse(250+changex,250+changey,150,150);
    fill(200+random(0,55),30+random(0,200),45,65);
    ellipse(250,250,600+random(-201,201),600+random(-201,201));
    fill(200+random(0,55),30,45,45);
    ellipse (250,250,400+random(-41,41),400+random(-21,21));
    
  }
  
  fill(255);
  ellipse(random(1,500),random(1,500), 5, 5);
  fill(255,150-random(0-150),15);
  ellipse(250+changex,250+changey,50,50);
  
  
  
  
}
