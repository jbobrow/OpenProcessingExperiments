
void setup() {
  size(300, 300);
}

int circleSize = 10; //leaf size


void draw() {

  if (mousePressed) { //mousepressed makes scene turn to autumn
    background(0,0,255);
   
    fill(255); // clouds in sky
    ellipse(50,80,80,80); 
    ellipse(100,50,80,80);
    ellipse(60,30,60,60);
    
    fill(124, 83, 40); // tree shape and branches
    quad(140, 250, 160, 250, 180, 150, 172, 160);
    strokeWeight(3);
    stroke(124, 83, 40);
    line(172, 160, 130, 100);
    line(180, 150, 250, 120);
    line(185, 150, 220, 180);
    line(160, 150, 120, 200);
    line(150, 140, 170, 110);
    
    noStroke(); // ground
    fill(201,189,130);
    rect(0,250,300,50);
    
    fill(250, 215, 40); // leaves on tree
    noStroke();
    ellipse(width/2, height/2, circleSize, circleSize);
    ellipse(200, 140, circleSize, circleSize);
    ellipse(220, 130, circleSize, circleSize);
    ellipse(240, 132, circleSize, circleSize);
    ellipse(250, 125, circleSize, circleSize);
    ellipse(190, 160, circleSize, circleSize);
    ellipse(215, 170, circleSize, circleSize);
    ellipse(220, 175, circleSize, circleSize);
    ellipse(165, 155, circleSize, circleSize);
    ellipse(175, 144, circleSize, circleSize);
    ellipse(165, 120, circleSize, circleSize);
    ellipse(155, 130, circleSize, circleSize);
    ellipse(145, 115, circleSize, circleSize);
    ellipse(135, 110, circleSize, circleSize);
    ellipse(135, 190, circleSize, circleSize);
    ellipse(125, 200, circleSize, circleSize);
    ellipse(140, 175, circleSize, circleSize);

    ellipse(140, 245, circleSize, circleSize); // leaves on ground
    ellipse(180, 240, circleSize, circleSize);
    ellipse(200, 235, circleSize, circleSize);
    ellipse(170, 260, circleSize, circleSize);
    ellipse(130, 275, circleSize, circleSize);
    ellipse(190, 243, circleSize, circleSize);
    ellipse(165, 230, circleSize, circleSize);
  }
  else { // when not mousepressed, scene is summer season
    background(0, 0, 255);
    
    fill(250,255,3); // sun 
    ellipse(50,80,80,80);
    
    fill(0, 255, 100); // ground
    rect(0, 250, 300, 50);
    
    fill(124, 83, 40); // tree shape and branches for summer
    quad(140, 250, 160, 250, 180, 150, 172, 160);
    strokeWeight(3);
    stroke(124, 83, 40);
    line(172, 160, 130, 100);
    line(180, 150, 250, 120);
    line(185, 150, 220, 180);
    line(160, 150, 120, 200);
    line(150, 140, 170, 110);
    
    fill(0, 255, 0); // leaves for summer
    noStroke();
    ellipse(width/2, height/2, circleSize, circleSize);
    ellipse(200, 140, circleSize, circleSize);
    ellipse(220, 130, circleSize, circleSize);
    ellipse(240, 132, circleSize, circleSize);
    ellipse(250, 125, circleSize, circleSize);
    ellipse(190, 160, circleSize, circleSize);
    ellipse(215, 170, circleSize, circleSize);
    ellipse(220, 175, circleSize, circleSize);
    ellipse(165, 155, circleSize, circleSize);
    ellipse(175, 144, circleSize, circleSize);
    ellipse(165, 120, circleSize, circleSize);
    ellipse(155, 130, circleSize, circleSize);
    ellipse(145, 115, circleSize, circleSize);
    ellipse(135, 110, circleSize, circleSize);
    ellipse(135, 190, circleSize, circleSize);
    ellipse(125, 200, circleSize, circleSize);
    ellipse(140, 175, circleSize, circleSize);
  }
}


