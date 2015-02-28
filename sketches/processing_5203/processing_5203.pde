
float x, y;
float targetX, targetY;
float easing = .05;

void setup() {
  background(#FFD4A5);
  size(480, 320);
  smooth();
}

void draw() {
  background(#FFD4A5);
  targetX = mouseX;
  targetY = mouseY;
  x = x + ((targetX - x) * easing); // makes donut follow the cursor on X with fluidity
  y = y + ((targetY - y) * easing); // makes donut follow the cursor on Y with fluidity
  
  
  if (mousePressed == true) { //when mouse is pressed, donut gets squished on Y
    noStroke();
    fill(#97652C); 
    ellipse(x, y, 210, 180);
    
    fill(#DE8DB5);
    ellipse(x, y-40, 90, 90); //top middle
    ellipse(x+56, y-18, 90, 90);  //top right
    ellipse(x-58, y-8, 90, 90); //top left
    ellipse(x-22, y+40, 90, 90); //bottom left
    ellipse(x+42, y+32, 90, 90); //bottom right
    ellipse(x, y, 90, 90); //middle
 
     //hole
    fill(#FFD4A5);
    ellipse(x, y, 30, 30);
  
  //eyes
    fill(0);
    ellipse(x-50, y-8, 10, 10); //left eye
    ellipse(x+50, y-8, 10, 10); //right eye
    stroke(0);
    strokeWeight(3); // sad eyebrows
    line (x-60, y-8, x-50, y-18); //left eyebrow
    line (x+60, y-8, x+50, y-18); //right eyebrow
    
  
    //mouth
    stroke(0);
    strokeWeight(3);
    strokeCap(ROUND);
    noFill();
    line(x-20, y+30, x+20, y+30); //straight line for mouth
  
  } else {  //when mouse is not pressed, regular donut appears
  
  //main donut
      noStroke();
      fill(#97652C); 
      ellipse(x, y, 210, 210);
  
  //frost
      fill(#DE8DB5);
      ellipse(x, y-50, 90, 90); //top middle
      ellipse(x+56, y-18, 90, 90);  //top right
      ellipse(x-58, y-8, 90, 90); //top left
      ellipse(x-22, y+50, 90, 90); //bottom left
      ellipse(x+42, y+42, 90, 90); //bottom right
      ellipse(x, y, 90, 90); //middle
  
  //hole
      fill(#FFD4A5);
      ellipse(x, y, 30, 30);
  
  //eyes
      fill(0);
      ellipse(x-50, y-8, 10, 10);
      ellipse(x+50, y-8, 10, 10);
  
  //mouth
      stroke(0);
      strokeWeight(3);
      noFill();
       beginShape(); 
      vertex(x-20, y+22);
      bezierVertex(x-18, y+42, x+20, y+42, x+20, y+22);
      endShape();
  }
  
}

