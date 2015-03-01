
int flagW = 75;
int flagH = 50;

void setup() {
  background(129,163,208);
  size(400,400);
  
}

void draw () {
   
  strokeWeight(2);
  fill(248,227,190);
  triangle(width/2+38, 117, width/2-38, 117, width/2, 50);
  rectMode(CENTER);
  rect(width/2, (height/2+40), 75, 250);
  strokeWeight(.5);
  fill(108,127,74);
  ellipse(width/2, height, width, height/4);
  rect(80, 290, flagW, flagH);
  fill(178,34,52);
  rect(80,265, flagW, flagH/10);
  fill(255,255,255);
   rect(80,270, flagW, flagH/10);
   fill(178,34,52);
   rect(80,275, flagW, flagH/10);
  fill(255,255,255); 
   rect(80,280, flagW, flagH/10);
   fill(178,34,52);
    rect(80,285, flagW, flagH/10);
    fill(255,255,255);
     rect(80,290, flagW, flagH/10);
     fill(178,34,52);
      rect(80,295, flagW, flagH/10);
      fill(255,255,255);
       rect(80,300, flagW, flagH/10);
       fill(178,34,52);
        rect(80,305, flagW, flagH/10);
        fill(255,255,255);
         rect(80,310, flagW, flagH/10);
         fill(178,34,52);
          rect(80,315, flagW, flagH/10);
   fill(60,59,110);
   rectMode(CORNER);       
   rect(80, 262, 37.5, 25);
   strokeWeight(2);
   line(117.5, 262, 117.5, 355);
  

    

  
  
}


