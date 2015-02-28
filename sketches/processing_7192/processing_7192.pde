
void setup() {
  size(640, 480);
  cursor(HAND);
  smooth(); 
}


void draw() {
  background(0);
  float v = dist(mouseX, mouseY, pmouseX, pmouseY);
  float o = map(v, 0, 50, 0, 255);



  strokeWeight(1);        //base
  stroke(126); 
  fill(30, 165, 185);
  rect(100, 100, 180, 60);
  rect(360, 100, 180, 60);


  noStroke();             //shadow
  fill(63, 93, 92);
  rect(100, 100, 180, 20);
  rect(360, 100, 180, 20);

  //when there's no motion
  fill(200);
  rect(107, 105, 168, 50);
  rect(367, 105, 168, 50);


  //bored
  fill(0, 219, 146, o); 
  rect(107, 105, 168, 50);
  rect(367, 105, 168, 50);


  fill(255, 200);              //refecltion
  int refl = 260;
  beginShape();
  vertex(367-refl, 105);
  vertex(535-refl, 105);
  vertex(535-refl, 107);
  bezierVertex(565-refl, 107, 370-refl, 100, 370-refl, 155);
  vertex(367-refl, 155);
  endShape();    
  beginShape();
  vertex(367, 105);
  vertex(535, 105);
  vertex(535, 107);
  bezierVertex(565, 107, 370, 100, 370, 155);
  vertex(367, 155);
  endShape();  


  //angry
  if(mouseY > 105 && mouseY < 155 && mousePressed) {
    if(mouseX > 107 && mouseX < 275 || mouseX > 367 && mouseX < 535) {
      fill(234, 68, 2);
      triangle(100, 100, 280, 160, 100, 160);
      triangle(360, 160, 540, 160, 540, 100);
      fill(57, 0, 33);
      triangle(100, 100, 280, 160, 280, 100);
      triangle(360, 160, 360, 100, 540, 100);
    }
  }


  //tickled
  
  if(mouseX > 280 && mouseX < 360 && mouseY > 105 && mouseY < 155) {
    if(v > 1){  
      stroke(255, 93, 180);
      strokeWeight(3);
      noFill();
      rect(100, 100, 180, 60);
      rect(360, 100, 180, 60);
      fill(191, 193, 137);
      noStroke();
      rect(107, 105, 168, 50);
      rect(367, 105, 168, 50);
      fill(0, 200);     
    }
  }




  float y = 153.0;       //eye gradient
  noStroke();
  for (int g = 200; g > 0; g -= 10) {
    fill(20, 28, 80, g); 
    rect(107, y, 168, 2);
    rect(367, y, 168, 2);
    y -= 2; 
  } 



  //confused
  int cf = 260;
  noFill();
  stroke(180, o);
  strokeWeight(1);
  for (int i = 50; i < 350; i += 50) {
    for (float c = 0.0; c < 0.1; c += 0.05) {
      if(mouseX < 50 || mouseX > 590 || mouseY > 430 || mouseY < 50) {
        ellipse(190+mouseX*c, 130+mouseY*c, i, i);    
        ellipse(190+cf+mouseX*c, 130+mouseY*c, i, i);

      }
    }
  }



  //sz
  int a = 100;
  float sx = map(mouseX, 0, 640, -30, 30);
  float sy = map(mouseY, 0, 480, -30, 30);
  stroke(60);
  strokeWeight(1);
  for (int i = 0; i < 270; i += 260) {
    line(100+i, 130, 150+i+0.1*sx, 130+0.1*sy);
    line(230+i+0.07*sx, 130+0.11*sy, 280+i, 130);
    line(150+i+0.1*sx, 130+0.08*sy, 160+i+0.12*sx, 120+0.1*sy);
    line(160+i+0.1*sx, 120+0.1*sy, 170+i+0.09*sx, 145+0.13*sy);
    line(170+i+0.1*sx, 145+0.1*sy, 180+i+0.1*sx, 115+0.07*sy);
    line(180+i+0.1*sx, 115+0.1*sy, 190+i+0.08*sx, 140+0.14*sy);
    line(190+i+0.08*sx, 140+0.14*sy, 200+i+0.13*sx, 110+0.1*sy);
    line(200+i+0.13*sx, 110+0.1*sy, 210+i+0.1*sx, 140+0.1*sy);
    line(210+i+0.11*sx, 140+0.07*sy, 220+i+0.1*sx, 125+0.1*sy);
    line(220+i+0.1*sx, 125+0.12*sy, 225+i+0.08*sx, 140+0.1*sy);
    line(225+i+0.1*sx, 140+0.1*sy, 230+i+0.07*sx, 130+0.11*sy);
  }





}//vdraw bracket














