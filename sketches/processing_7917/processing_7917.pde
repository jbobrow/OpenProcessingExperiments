

ArrayList sqs = new ArrayList(); 
float basesquare= 10;
float startX, startY;
PFont arial16;
int currtype=1;
PGraphics buffer;

void setup()
{
  size(800, 800);
  background(0);
  noStroke();
  smooth();
  rectMode(CENTER);
  arial16 = loadFont("ArialMT-16.vlw");
  textFont(arial16, 16);
  buffer=createGraphics(width,height,P2D);
  buffer.beginDraw();
  buffer.background(0);
  buffer.endDraw();
}


void draw()
{
  int n = sqs.size();  
  background(buffer);
  if(sqs.size()>0)
  {
    for(int i=0; i<n; i++) 
    {  
      getsquare(i).move();
      getsquare(i).render(); 
      
    }
       
      
  }

  if(mousePressed && mouseY<height-40)
  {
    noFill();
    strokeWeight(1);
    stroke(255, 100);
    rectMode(CORNER);
    rect(startX, startY, mouseX-startX, mouseX-startX); //draw transparent rectangle when dragging to show where new square will go
  }
  noStroke();
  fill(255);
  rectMode(CORNER);
  rect(0, height-40, width, 40); // this is the menu bar at the bottom
  
  //draw the buttons
  
  // ice button
  fill(#90D5FF);
  rect(450, height-35, 50, 30);
  if(currtype==1) 
  {  
    noFill();
    stroke(203, 43, 43);
    strokeWeight(3);
    rect(448, height-35, 52, 29);
  }
   fill(0);
  text("Ice", 465, height-15);
  
  //stone button
  fill(#AFAFAF);
  noStroke();
  rect(510, height-35, 50, 30);
  if(currtype==2) 
  {  
     noFill();
     stroke(203, 43, 43);
     strokeWeight(3);
     rect(508, height-35, 52, 29);
  }
  fill(0);
  text("Stone", 515, height-15);
  
  
 //steel button
  fill(#8D9EBC);
  noStroke();
  rect(570, height-35, 50, 30);
  if(currtype==3) 
  {  
     noFill();
     stroke(203, 43, 43);
     strokeWeight(3);
     rect(568, height-35, 52, 29);
  }
  fill(0);
  text("Steel", 575, height-15);
  
  
  //lead button
  fill(#555555);
  noStroke();
  rect(630, height-35, 50, 30);
  if(currtype==4) 
  {  
     noFill();
     stroke(203, 43, 43);
     strokeWeight(3);
     rect(628, height-35, 52, 29);
  }
  fill(0);
  text("Lead", 635, height-15);
  
  //Earthquake button
  fill(#DE3333);
  noStroke();
  rect(20, height-35, 90, 30);
  fill(0);
  text("Earthquake", 25, height-15);
  
  //Freeze Button
  fill(#3E31FF);
  noStroke();
  rect(120, height-35, 90, 30);
  fill(0);
  text("Freezethaw", 123, height-15);
  
  //reset button
  fill(#FFAD31);
  noStroke();
  rect(290, height-35, 50, 30);
  fill(0);
  text("Reset", 295, height-15);
  
  //if(frameCount%10==0) println(frameRate);
}


square getsquare(int i) 
{ 
  return (square)sqs.get(i); 
} 



void mousePressed()
{
  if(mouseY<height-40)
  {
    startX= mouseX;
    startY=mouseY;
  }
}

void mouseReleased()
{
  if(mouseY<height-40)
  {
    sqs.add(new square(currtype, abs((mouseX-startX)/basesquare), startX+(mouseX-startX)/2,
           startY+(mouseX-startX)/2, 0, 0, 0, 0));
  }
}

void mouseClicked()
{
  int n = sqs.size();
  if(mouseY>height-40)
  {
    if (mouseX>510 && mouseX<560 &&mouseY>height-35 && mouseY<height-5)//stone button
    {
      currtype=2;
    }
    else if (mouseX>450 && mouseX<500 &&mouseY>height-35 && mouseY<height-5)// ice button
    {
      currtype=1;
    }
    else if (mouseX>570 && mouseX<620 &&mouseY>height-35 && mouseY<height-5) //steel button
    {
      currtype=3;
    }
    else if (mouseX>630 && mouseX<680 &&mouseY>height-35 && mouseY<height-5)//lead
    {
      currtype=4;
    }
    else if (mouseX>20 && mouseX<110 &&mouseY>height-35 && mouseY<height-5)//earthquake
    {
      fill(255,255,255, 200);
      rect(20, height-35, 90, 30); //makes button flash when clicked 
      for(int i=0; i<n; i++) 
      {    
        getsquare(n-i-1).earthquake(n-i-1);
      } 
    }
     else if (mouseX>120 && mouseX<210 &&mouseY>height-35 && mouseY<height-5)//freezethaw
    {
        fill(255,255,255, 200);
        rect(120, height-35, 90, 30); //makes button flash when clicked
        for(int i=0; i<n; i++) 
      {    
        getsquare(n-i-1).freeze(n-i-1);
      } 
    }
    else if (mouseX>290 && mouseX<340 &&mouseY>height-35 && mouseY<height-5)//reset
    {
      fill(255,255,255, 200);
      rect(290, height-35, 50, 30); //makes button flash when clicked 
      if (sqs.size()>0)
      {
        for(int i=0; i<n; i++) 
        {    
           sqs.clear();
        }
      } 
        buffer.beginDraw();
        buffer.background(0);
        buffer.endDraw();
    }
   if (sqs.size()>0)
   {
     for(int i=0; i<n; i++) 
      {    
        if(getsquare(i).sidelength<0.2)
          {
              buffer.beginDraw();
                pushMatrix();
                  translate(getsquare(i).xpos, getsquare(i).ypos);
                  rotate(getsquare(i).angle);
                  buffer.noStroke();
                  buffer.fill(getsquare(i).colour);
                  buffer.rect(getsquare(i).xpos, getsquare(i).ypos ,getsquare(i).sidelength*basesquare, getsquare(i).sidelength*basesquare);
                popMatrix();
              buffer.endDraw();
              sqs.remove(i);
              if(i!=sqs.size()-1)
              {
                getsquare(i).move();
                getsquare(i).render(); 
              }
              n--;
            
          }
      }
   }
 }
}
  
  void keyPressed()
  {
    if(key=='h')
    {
      int n = sqs.size();
       for(int i=0; i<n; i++) 
      {    
        getsquare(n-i-1).hurricane(n-i-1);
      } 
   }
  }
   
  

