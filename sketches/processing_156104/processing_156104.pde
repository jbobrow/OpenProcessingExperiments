
//int y;

void setup() {
  size(500, 500);
  background(255);
}

void draw() {
    background(255);
  fill(0,0,0);
  textAlign(CENTER);
  text("Click and Hold to feed me!", 250, 460);
  
    
  //apple
  noStroke();
  fill(255, 0, 0);
  ellipse(mouseX, mouseY, 25, 25);
  fill(0, 153, 0);
  ellipse((mouseX + 5), (mouseY - 13), 10, 5); 


  
  //spikes
  noStroke();
  fill(214,255,48);
  triangle(250, 110, 300, 100, 250, 160);
  triangle(270, 130, 330, 130, 250, 180);
  triangle(285, 155, 350, 155, 250, 200);
  
  //whole dinosaur!
  fill(48,255,79,255);
  noStroke();
    beginShape();
    vertex(290, 335);
    vertex(270, 360);
    vertex(260, 404);
    vertex(217, 404);
    vertex(215, 400);
    vertex(217, 397);
    vertex(237, 395);
    vertex(240, 375);
    vertex(220, 335);
    vertex(225, 325);
    vertex(230, 320);
    vertex(215, 290);
    vertex(210, 270);
    vertex(215, 230);
    vertex(175, 240);  
    vertex(180, 230);
    vertex(215, 220);
    vertex(220, 180);
    vertex(210, 160);
    //vertex(185, 160);
    //vertex(175, 150);
    vertex(210, 130);
    vertex(170, 130);
    vertex(180, 110);
    vertex(200, 90);
    vertex(230, 80);
    vertex(260, 100);
    vertex(300, 200);
    vertex(330, 300);
    vertex(350, 330);
    vertex(370, 340);
    vertex(390, 345);
    vertex(430, 350);
    vertex(360, 360);
    vertex(320, 350);
    vertex(290, 335);
  endShape();
  
  //eyes!
  stroke(155);
  fill(255,255,255);
  ellipse(205, 110, 10, 10);

  fill(0,0,0);
  ellipse(203, 110, 5, 5);
  

  
  //mousepressed to feed dino!
  if (mousePressed) {
    //we want y to oscillate between 150 and 130.
    float sinOfTime = sin( millis() * 0.02 );
    float sinMappedY = map( sinOfTime, -1.0, 1.0, 150, 130 ); 
  
    fill(48,255,79,255);
    noStroke();
    beginShape(); 
      vertex(210, 160);
      vertex(185, 160);
      vertex(175, sinMappedY);
      //vertex(175, 150);
      vertex(210, 130);
    endShape();  
  } else {
    fill(48,255,79,255);
    noStroke();
    beginShape(); 
      vertex(210, 160);
      vertex(185, 160);
      //vertex(175, sinMappedY);
      vertex(175, 150);
      vertex(210, 130);
    endShape();      
  }

  

  
  
}




