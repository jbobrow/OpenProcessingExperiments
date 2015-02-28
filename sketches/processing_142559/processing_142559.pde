
void setup()
{
  size(500, 500);
  background (255);
}
void draw()
{
  background(255);
  noStroke();
  rectMode(CENTER);
  
    pushMatrix();
      float x2 = map(mouseY, mouseX, 500, 35, 100);
    // grau fest
  fill(200);
  //1
   fill(255, 242, 245);
  ellipse(50, 50, x2, x2);
  ellipse(180,  50, x2, x2);
  ellipse(310, 50, x2, x2);
   ellipse(440, 50, x2, x2);
   
   ellipse(50, 180, x2, x2);
  ellipse(50,  310, x2, x2);
  ellipse(50, 440, x2, x2);
  
  
 
  ellipse(180,  180, x2, x2);
  ellipse(310, 310, x2, x2);
   ellipse(440, 440, x2, x2);
   
   ellipse(180, 310, x2, x2);
  ellipse(440,  310, x2, x2);
  ellipse(440, 180, x2, x2);
  
    ellipse(180, 440, x2, x2);
  ellipse(310,  440, x2, x2);
  ellipse(310, 180, x2, x2);


   popMatrix();
   resetMatrix();
 
  pushMatrix();

  float x1 = map(mouseX, 0, 500, 35, 100);
  float r = map(mouseY, 0, 500, 35, 100);
 
  // grau
  fill(200);
  //1
  ellipse(mouseX, mouseY, x1, x1);
  ellipse(mouseX-10, mouseY-80, x1, x1);
  ellipse(mouseX-30, mouseY-140, x1, x1);
   ellipse(mouseX-30, mouseY-220, x1, x1);

   
  // dunkel
  fill(183, 9, 56);
  ellipse(mouseY+50, mouseX+50, r, r);
  ellipse(mouseY, mouseX, r, r);
  ellipse(mouseX, mouseY, r, r);
  
    //2
  ellipse(mouseX, mouseY, x1, x1);
  ellipse(mouseY-10, mouseX-80, x1, x1);
  ellipse(mouseY-30, mouseX-170, x1, x1);
  popMatrix();
  resetMatrix();
  
  // grau2
  fill(200);
  //3
  ellipse(mouseX, mouseY, x1, x1);
  ellipse(mouseX+10, mouseY+80, x1, x1);
  ellipse(mouseX+30, mouseY+140, x1, x1);
   ellipse(mouseX+30, mouseY+220, x1, x1);
   

 

   
     // dunkel
  fill(183, 9, 56);
  ellipse(mouseY+80, mouseX+140, r, r);
  ellipse(mouseY+70, mouseX+220, r, r);
  ellipse(mouseY+10, mouseX-230, r, r);
  
    //2
  ellipse(mouseX, mouseY, x1, x1);
  ellipse(mouseY-10, mouseX-80, x1, x1);
  ellipse(mouseY-30, mouseX-170, x1, x1);
  

   

}

