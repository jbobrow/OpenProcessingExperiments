
// © Laura Tjho Jan 29 2013
// 60-257 Hw Assignment 4

//space bar to reveal smoke
//mouse click to reveal coffee 
//mouse click to reveal color change in coaster


void setup ()
{
  size (400,400);
  smooth();

  frameRate(10);
}

void draw ()
{
  background(160, 53, 87);
  
  noStroke();
  fill(255, 30);
  ellipse(mouseX+25, mouseY, 250, 250);
  fill(255, 98, 0, 80);
  ellipse(mouseX+57, mouseY, (mouseX-pmouseY), (mouseY-pmouseY) );
  fill(234, 118, 118, 70);
  ellipse(mouseX+57, mouseY-5, 100, 100 );
  

  //cup body
  line(mouseX, mouseY, mouseX+114.1, mouseY);
  fill(242, 225, 225);
  strokeWeight(2);
  stroke(255);
  beginShape();
    curveVertex(mouseX, mouseY+1); //controlpoint
    curveVertex(mouseX, mouseY);
    curveVertex(mouseX+15.2, mouseY+43.4);
    curveVertex(mouseX+57, mouseY+64.5);
    curveVertex(mouseX+97.3, mouseY+43.4);
    curveVertex(mouseX+114.1, mouseY);
    curveVertex(mouseX+114.1, mouseY+1); //controlpoint
  endShape();
  
  //coaster
  if(mousePressed) {
    fill(random(255));
    rect(mouseX, mouseY+72.6, 109.2, 6.2);
  }
  else{
    fill(242, 225, 225);
    rect(mouseX, mouseY+72.6, 109.2, 6.2);
  }
  
  //coffee
  if(mousePressed) {
    fill(77, 42, 42);
    arc(mouseX+57, mouseY+7.6, 100, 100, 0, PI);
  }
  else{
    fill(242, 225, 225);
  }
  
  //cup holder
  strokeWeight(5);
  stroke(242, 225, 225);
  noFill();
  arc(mouseX-9.7, mouseY+22.5, 45, 45, PI/3, TWO_PI-PI/3);
}

void keyPressed()
{
  //smoke
  if (key == ' ') {
    strokeWeight(3);
    stroke(139, 186, 222, 90);
    beginShape();
      curveVertex(mouseX+40, mouseY-12.4); //controlpoint
      curveVertex(mouseX+41.5, mouseY-15.5); 
      curveVertex(mouseX+50, mouseY-31);
      curveVertex(mouseX+51.3, mouseY-38.3); //first vertex
      curveVertex(mouseX+49, mouseY-48.4);
      curveVertex(mouseX+43.3, mouseY-56.3);
      curveVertex(mouseX+33.4, mouseY-68.8);
      curveVertex(mouseX+30, mouseY-77.3); //second vertex
      curveVertex(mouseX+33.4, mouseY-90.7);
      curveVertex(mouseX+38.8, mouseY-99);
      curveVertex(mouseX+40, mouseY-103); //controlpoint
    endShape();
    
    beginShape();
      curveVertex(mouseX+40+16, mouseY-12.4-14); //controlpoint
      curveVertex(mouseX+41.5+16, mouseY-15.5-14); 
      curveVertex(mouseX+50+16, mouseY-31-14);
      curveVertex(mouseX+51.3+16, mouseY-38.3-14); //first vertex
      curveVertex(mouseX+49+16, mouseY-48.4-14);
      curveVertex(mouseX+43.3+16, mouseY-56.3-14);
      curveVertex(mouseX+33.4+16, mouseY-68.8-14);
      curveVertex(mouseX+30+16, mouseY-77.3-14); //second vertex
      curveVertex(mouseX+33.4+16, mouseY-90.7-14);
      curveVertex(mouseX+38.8+16, mouseY-99-14);
      curveVertex(mouseX+40+16, mouseY-103-14); //controlpoint
   endShape();

  }
}



