
/*

monster sketch
Julie Kim 2013 February

*/

void setup(){
  size(600, 600);
  smooth();
  rectMode(CENTER);
}

void draw(){
  background(252,251,199);

 // left wing 
  // style
  fill(0);
  stroke(0);
  triangle(100, 185, 25, 250, 150, 300);

  // left wing front
  // style
  fill(110, 178, 198);
  noStroke();
  triangle(115, 195, 45, 250, 150, 300);

  // right wing 
  // style
  fill(0);
  noStroke();
  triangle(500, 185, 575, 250, 450, 300);

  // right wing front
  // style
  fill(110, 178, 198);
  noStroke();
  triangle(485, 195, 555, 250, 450, 300);

  //body outer
  // style
  fill(68, 143, 165);
  noStroke();
  ellipse(300, 385, 450, 300);
  
  //body inner
  // style
  fill(110, 178, 198);
  noStroke();
  ellipse(300, 385, 375, 350);
  
  //body front circle
  // style
  fill(255, 100);
  noStroke();
  ellipse(300, 385, 170, 200);

    
  //left line to eye
  stroke(68, 143, 165);
  strokeWeight(3);
  line(200, 100, 225, 200);
  
  //right line to eye
  stroke(68, 143, 165);
  line(400, 100, 375, 200);
  
  //left eye outer
  // style
  fill(255);
  stroke(68, 143, 165);
  ellipse(200, 75, 75, 75);
  
  //right eye outer
  // style
  fill(255);
  stroke(68, 143, 165);
  ellipse(400, 75, 75, 75);

  //left eye inner
  // style
  fill(0);
  stroke(0);
  ellipse(200, 80, 25, 25);
  
  //right eye inner
  // style
  ellipse(400, 80, 25, 25);
  
  //lower face
  // style
  fill(68, 143, 165);
  noStroke();
  ellipse(300, 225, 300, 180);
      
  // left nostril
  // style
  fill(0);
  stroke(0);
  ellipse(290, 240, 8, 5);

  // right nose
  // style
  ellipse(310, 240, 8, 5);

  // mouth
  // style
  fill(0);
  stroke(0);
  strokeWeight(1);
  ellipse(300, 280, 100, 30);
  
  // tooth
  // style
  fill(255);
  stroke(0);
  rect(295, 273, 10, 15);
  
  // tooth
  // style
  fill(255);
  stroke(0);
  rect(305, 273, 10, 15);
  
   //left foot
  // style
  fill(0);
  ellipse(200, 515, 70, 90);
  
  //right foot
  // style
  fill(0);
  ellipse(400, 515, 70, 90);

  
   
}


