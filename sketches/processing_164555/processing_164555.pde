
void setup()
{
  size(400, 600);
  background(0,0,0);
  strokeWeight (0);


}

 void draw()
 { 
   filter(BLUR);
   

   
    fill(random(250,252), random(249,245), random(175,84));
  rect(random(0, width/2.5), random(height/1.5, height), 3, 3);
  rect(random(0, width/4), random(height/2, height), 3, 3);
  rect(random(0, width/4), random(height/2, height), 3, 3);
  rect(random(0, width/4), random(height/2, height), 3, 3);
  rect(random(0, width/2.5), random(height/1.5, height), 3, 3);
  rect(random(0, width/2.5), random(height/1.5, height), 3, 3);
  rect(random(0, width/5), random(height/3,height),3,3);
  rect(random(0,width/6), random(height/4,height),3,3);
  rect(random(0,width/6), random(height/4,height),3,3);
   rect(random(0,width/7), random(height/4,height),3,3);
  fill(random(162,4), random(169,11), random(245,84));
  rect(random(0,width/7), random(height/4,height),3,3);
  
  if (mousePressed) {
    fill(252,245,20, random(140));
    ellipse(mouseX, mouseY, random(68), random(48));
    fill(250,247,170,random(140));
    ellipse(mouseX,mouseY,random(68),random(48));
    fill(250,217,120,random(130));
    ellipse(mouseX,mouseY,random(58),random(38));
    fill(247,188,111,random(135));
    ellipse(mouseX,mouseY,random(60),random(40));
  }
  
  
  

}

