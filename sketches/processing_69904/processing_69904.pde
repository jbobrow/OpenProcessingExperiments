

void setup()
{
  size(650,420);
}

void draw()

{
  strokeWeight(0);
  smooth();
  fill(#2B5CAA);
  
  int i=0;
  for(i=0;i<250;i++)
  {
    stroke(1*i,0+i,240);
    line(0,i,650,i);
  }

   beginShape(); 
   vertex(0,280);
   vertex(250,273);
   vertex(350,275); 
   vertex(650,265);
   vertex(650,420);
   vertex(0,420);
   endShape();
   endShape(CLOSE);
  
   beginShape();
   fill(#0D315F);
   vertex(5,225);
   vertex(10,225);
   vertex(20,230);
   vertex(25,227);
   vertex(30,227);
   vertex(40,230);
   vertex(150,180);
   vertex(155,180);
   vertex(160,180);
   vertex(180,165);
   vertex(280,140);
   vertex(330,100);
   vertex(335,97);
   vertex(340,97);
   vertex(350,100);
   vertex(450,170);
   vertex(550,220);
   vertex(600,235);
   vertex(625,238);
   vertex(650,243);
   vertex(650,265);
   vertex(350,275); 
   vertex(250,273);
   vertex(0,280);
   vertex(0,225);
   endShape();
   endShape(CLOSE);
  
   beginShape();
   fill(#FAFBFC);
   vertex(155,180);
   vertex(190,175);
   vertex(220,175);
   vertex(235,180);
   vertex(280,175);
   vertex(310,178);
   vertex(350,180);
   vertex(360,185);
   vertex(390,175);
   vertex(410,175);
   vertex(450,170);
   vertex(350,100);
   vertex(340,97);
   vertex(335,97);
   vertex(330,100);
   vertex(280,140);
   vertex(180,165);
   vertex(160,180);
   vertex(155,180);
   endShape();
   endShape(CLOSE);
 }

