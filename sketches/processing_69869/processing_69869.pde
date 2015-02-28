

void setup(){
  
  background(84, 139, 84); 
  size(400, 400); 
}

void draw(){
  
  smooth(); 
  
  fill(94, 38, 18); 
  noStroke(); 
  ellipse(260, 70, 90, 90); //ball of hair 
  
  fill(94, 38, 18); 
  noStroke(); 
  rect(215, 70, 90, 250); //long hair
  
  fill(255, 0, 0); 
  noStroke(); 
  ellipse(245, 70, 40, 38); //hairtie 
  
    fill(94, 38, 18); 
  noStroke(); 
  ellipse(200, 140, 155, 180); //hairline 
  
  fill(238,  232, 170);
  noStroke(); 
  ellipse(200, 160, 150, 180); //face
  
  stroke(1); 
  line(220, 129, 240, 128); 
  line(240, 128, 250, 130); 
  line(250, 130, 260, 134);   //right eyebrow
  
  stroke(1); 
  line(180, 129, 160, 128); 
  line(160, 128, 150, 130); 
  line(150, 130, 140, 134); //left eyebrow
  
  fill(238, 203, 173); 
  noStroke(); 
  ellipse(200, 180, 20, 30); 
  ellipse(190, 180, 10, 20); 
  ellipse(210, 180, 10, 20); //nose shadow
  
  fill(238, 232, 170); 
  ellipse(200, 176, 20, 30);
  ellipse(190, 176, 10, 20); 
  ellipse(210, 176, 10, 20); //nose
  
  fill(255, 0, 0); 
  
  beginShape(); 
  vertex(180, 215); 
  vertex(195, 210); 
  vertex(200, 215); 
  vertex(205, 210); 
  vertex(220, 215); 
  vertex(205, 225); 
  vertex(190, 225); 
  endShape(CLOSE); //horrible excuse for lips
  
  
  fill(255, 255, 255); 
  noStroke(); 
  ellipse(165, 160, 35, 28); 
  ellipse(235, 160, 35, 28); //outer eyes
  
  fill(80, 38, 13); 
  ellipse(165, 162, 23, 23); 
  ellipse(235, 162, 23, 23); //pupils
  
  fill(0, 0, 0); 
  ellipse(165, 162, 14, 14); 
  ellipse(235, 162, 14, 14); //retinas
  
  stroke(1); 
  line(240, 146, 245, 137); 
  line(243, 147, 250, 139); 
  line(246, 148, 255, 142); 
  line(249, 149, 260, 145); //right eyelashes
  
  line(160, 146, 155, 137); 
  line(157, 147, 150, 139); 
  line(154, 148, 145, 142); 
  line(151, 149, 140, 145); //left eyelashes

  fill(238, 232, 170); 
  noStroke(); 
  ellipse(120, 160, 30, 40); //left ear
  
  fill(238, 232, 170); 
  ellipse(280, 160, 30, 40); //right ear
  
  fill(220, 20, 60); 
  ellipse(120, 173, 20, 20); 
  ellipse(280, 173, 20, 20); //earrings
  
  fill(238, 232, 170); 
  rect(175, 230, 60, 50); //neck 
  
  beginShape(); 
  vertex(175, 280); 
  vertex(235, 280); 
  vertex(305, 300); 
  vertex(320, 335); 
  vertex(320, 400); 
  vertex(80, 400); 
  vertex(80, 335); 
  vertex(95, 300); 
  endShape(CLOSE); // body
  
  fill(255, 114, 86); 
  noStroke(); 
  beginShape(); 
  vertex(175, 280); 
  vertex(205, 340); 
  vertex(235, 280); 
  vertex(290, 292); 
  vertex(295, 400); 
  vertex(120, 400); 
  vertex(120, 292); 
  endShape(CLOSE); // shirt 
  
  fill(205, 112, 84); 
  triangle(175, 280, 205, 340, 170, 340); 
  triangle(235, 280, 240, 340, 205, 340); 
  stroke(5); 
  line(205, 340, 205, 400); //collar and shirtline
  
  ellipse(215, 360, 5, 5); 
  ellipse(215, 390, 5, 5); // buttons 
  
  
  
  
  
  
  
  
}

