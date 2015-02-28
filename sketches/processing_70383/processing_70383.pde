
//Alina Vakutin, Functions and Animation, CP 1, mods 16,17
int x = 0;
int y = 250;
int bubble = 5;
int a = 75;
void setup()
{
  size(500,500);
}
void draw()
{
  fish();
  plants();
}
void fish()
{
  background(52,176,232);
  noStroke();
  fill(232,145,52);
  ellipse(x,250,150,100);
  triangle(x-75-50,200,x-75,250,x-75-50,300);
  stroke(0);
  strokeWeight(8);
  point(x+55,235);
  x = x + 10;
  frameRate(8);
   if (x > 300)
   {
     frameRate(30);
     x = 300;
     strokeWeight(1);
     fill(15,112,206);
     ellipse(x+75,y,25 + bubble,25 + bubble);
     y = y - 5; 
     bubble = bubble + 2;
     if (y < 1)
     {
      bubble = 5;
      y = 250;
      strokeWeight(1);
      fill(15,112,206);
      ellipse(x+75,y,25 + bubble,25 + bubble);
      y = y - 5; 
      bubble = bubble + 2;
   }
}
}
void plants()
{
  noStroke();
  fill(29,152,21);
  beginShape();
  curveVertex(50,400);
  curveVertex(50,400);
  curveVertex(30,425);
  curveVertex(75, 500);
  curveVertex(50,600);
  curveVertex(50,600);
  endShape();
  beginShape();
  curveVertex(50+a,400);
  curveVertex(50+a,400);
  curveVertex(30+a,425);
  curveVertex(75+a, 500);
  curveVertex(50+a,600);
  curveVertex(50+a,600);
  endShape();
  beginShape();
  curveVertex(50+2*a,400);
  curveVertex(50+2*a,400);
  curveVertex(30+2*a,425);
  curveVertex(75+2*a, 500);
  curveVertex(50+2*a,600);
  curveVertex(50+2*a,600);
  endShape();
  beginShape();
  curveVertex(50+3*a,400);
  curveVertex(50+3*a,400);
  curveVertex(75+3*a,425);
  curveVertex(30+3*a, 500);
  curveVertex(50+3*a,600);
  curveVertex(50+3*a,600);
  endShape();
  beginShape();
  curveVertex(50+4*a,400);
  curveVertex(50+4*a,400);
  curveVertex(75+4*a,425);
  curveVertex(30+4*a, 500);
  curveVertex(50+4*a,600);
  curveVertex(50+4*a,600);
  endShape();
  beginShape();
  curveVertex(50+5*a,400);
  curveVertex(50+5*a,400);
  curveVertex(75+5*a,425);
  curveVertex(30+5*a, 500);
  curveVertex(50+5*a,600);
  curveVertex(50+5*a,600);
  endShape();
}
