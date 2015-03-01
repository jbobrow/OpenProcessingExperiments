

void setup() {
  size(600, 600);
  noStroke();
  colorMode(RGB, 255,255,255);
  ellipseMode(CENTER);
  strokeWeight(2);
  strokeCap(ROUND);
  smooth();
}


void mouseDragged() {
  
  noFill();
  stroke(255);
  strokeWeight(2);
  bezier(330,300,280,320,280,320,190,280);
}

void mouseReleased() {
  
  fill(255);
  noStroke();
  bezier(330,300,280,320,280,320,190,280);
}


void draw() {
    
  float r1 = map(mouseX, 0, width, 0, height);
  float r2 = height-r1;
  float r3 = map(mouseY, 0, width, 0, height/2);

//face

  fill(0);
  stroke(0);
  strokeWeight(2);
  ellipse(250,200,300,300);
  
  fill(0, 104, 179);
  noStroke();
  triangle(80,20,160,100,250,49);
  
  fill(255);
  noStroke();
  bezier(300, 200, 400, 220, 400, 300, 300, 200);

  noFill();
  stroke(90);
  strokeWeight(4);
  bezier(mouseX+10, mouseY, mouseX-100, mouseY+250,mouseX+150, 500, 352, 312);
  
  noFill();
  stroke(90);
  strokeWeight(4);
  bezier(mouseX-10, mouseY, mouseX-100, mouseY+250,mouseX-50, 500, 148, 312);


//eyes

  noStroke();
  fill(210);
  ellipse(width/2 + r1/4, height/3.5, r1/4, r1/4);  
  fill(210);
  ellipse(width/2 - r2/4, height/3, r2/4, r2/4);

  fill(0);
  ellipse(width/2 + r1/4, height/3.5, r3/5, r3/5);
  fill(0);
  ellipse(width/2 - r2/4, height/3, r3/5, r3/5);


  fill(255,50);
  noStroke();
  rect(0,0,width,height);
  
    
  fill(255, 88, 10);
  noStroke();
  triangle(mouseX, mouseY-mouseY/4, mouseX-20, mouseY, mouseX+20, mouseY);

  //stroke(14, 128, 160);
  //line(width/2,height/2,mouseX,mouseY);
  
}


