
void setup()
{
  size (400, 400);
background(225, 225, 0);
smooth();
stroke(225, 250, 0);
//head
ellipse(200, 200, 300, 350);



//eyes
noFill();
strokeWeight(2);
stroke(0);
ellipse(140, 160, 60, 40);
ellipse(260, 160, 60, 40);
stroke(0, 200, 0);
strokeWeight(30);
point(140, 160);
point(260, 160);
stroke(0);
strokeWeight(10);
point(140, 160);
point (260, 160);
//nose
noFill();
strokeWeight(5);
stroke(255, 150, 170);
line(200, 145, 175, 250);
line(175, 250, 215, 250);
//mouth
 strokeWeight(30);
 stroke(255, 0, 0);
 ellipse(200, 300, 20, 20);

}
void draw()
{
  if (key=='g')
  {
    //groovy glasses
    stroke(200, 0, 0);
    fill(200, 0, 0);
    strokeWeight(15);
    ellipse(140, 160, 90, 80);
    ellipse(260, 160, 90, 80);
    line(170, 160, 220, 160);
    line(58, 150, 120, 160);
    line(310, 155, 340, 150);
    stroke(150, 0, 200);
    ellipse(140, 160, 70, 60);
    ellipse(260, 160, 70, 60);
    stroke(100, 0, 250);
    ellipse(140, 160, 50, 40);
    ellipse(260, 160, 50, 40);
    stroke(0, 0, 250);
    ellipse(140, 160, 30, 20);
    ellipse(260, 160, 30, 20);
    //groovy mouth
    stroke(255, 0, 0);
    strokeWeight(6);
    ellipse(200, 300, 40, 40);
  }
  if(key== 'd')
  {
    //dots
    stroke(0, 200, 100);
    strokeWeight(40);
    ellipse(360, 360, 5, 5);
     ellipse(10, 10, 10, 10);
    ellipse(360, 20, 15, 10);
    stroke(150, 0, 150);
    ellipse(50, 75, 10, 5);
   ellipse(40, 350, 15, 15);
   stroke(100, 100, 255);
   strokeWeight(60);
    ellipse(20, 370, 10, 10);
   ellipse(300, 365, 10, 5);
   ellipse(60, 85, 5, 5);
   stroke(210, 30, 30);
   ellipse (365, 350, 3, 3);
   ellipse(375, 20, 4, 4);
   ellipse(350, 50, 10, 5);
    
}
}

