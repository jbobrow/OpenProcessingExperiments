
void setup() {
  size(400, 400);
  smooth();
}
void draw() {
  background(68,78,242);
  strokeWeight(2);
  stroke(255, 50, 50);
  fill(255);
  rect(0, 130, 400, 5);
  if (mousePressed&&(mouseButton==LEFT)) {
    //UPup
    stroke(1);
    // man prtotype  
    strokeWeight(2);
    ellipse(300, height/4+15, 20, 20);
    strokeWeight(6);
    line(300, 98, 300, 60);
    //feet
    strokeWeight(4);
    line(305, 60,315, 40);
    line(295, 60, 285, 40);
    line(305, 15, 315, 35);
    line(295, 15, 285, 35);
    //arm
    strokeWeight(4);
    line(310, 90, 320, 125);
    line(290, 90, 280, 125);
    //UPup
    stroke(1);
    // man prtotype  
    strokeWeight(2);
    ellipse(100, height/4+15, 20, 20);
    strokeWeight(6);
    line(100, 98, 100, 60);
    //feet
    strokeWeight(4);
    line(105, 60, 115, 40);
    line(95, 60, 85, 40);
    line(105, 15, 115, 35);
    line(95, 15, 85, 35);
    //arm
    strokeWeight(4);
    line(110, 90, 120, 125);
    line(90, 90, 80, 125);
    // man prtotype  
    strokeWeight(2);
    ellipse(width/2, 3*height/4, 20, 20);
    strokeWeight(6);
    line(200, 312, 200, 350);
    //feet
    strokeWeight(4);
    line(205, 350, 215, 370);
    line(195, 350, 185, 370);
    line(205, 395, 215, 375);
    line(195, 395, 185, 375);
    //arm
    strokeWeight(4);
    line(210, 330, 220, 280);
    line(190, 330, 180, 280);
  }
  else if (mousePressed&&(mouseButton==RIGHT)) {
    //UPup
    stroke(1);
    // man prtotype  
    strokeWeight(2);
    ellipse(width/2, height/4+15, 20, 20);
    strokeWeight(6);
    line(200, 98, 200, 60);
    //feet
    strokeWeight(4);
    line(205, 60, 215, 40);
    line(195, 60, 185, 40);
    line(205, 15, 215, 35);
    line(195, 15, 185, 35);
    //arm
    strokeWeight(4);
    line(210, 90, 220, 125);
    line(190, 90, 180, 125);
    // manIDn
    stroke(1);
    strokeWeight(2);
    ellipse(100, 3*height/4, 20, 20);
    strokeWeight(6);
    line(100, 312, 100, 350);
    //feet
    strokeWeight(4);
    line(105, 350, 115, 370);
    line(95, 350, 85, 370);
    line(105, 395, 115, 375);
    line(95, 395, 85, 375);
    //arm
    strokeWeight(4);
    line(110, 330, 120, 280);
    line(90, 330, 80, 280);
 // manIII DN
    stroke(1);
    strokeWeight(2);
    ellipse(300, 3*height/4, 20, 20);
    strokeWeight(6);
    line(300, 312, 300, 350);
    //feet
    strokeWeight(4);
    line(305, 350, 315, 370);
    line(295, 350, 285, 370);
    line(305, 395, 315, 375);
    line(295, 395, 285, 375);
    //arm
    strokeWeight(4);
    line(310, 330, 320, 280);
    line(290, 330, 280, 280);
  }
  else {
    //manII UPdn
    stroke(1);
    // man prtotype  
    strokeWeight(2);
    ellipse(width/2, 50+height/4, 20, 20);
    strokeWeight(6);
    line(200, 162, 200, 200);
    //feet
    strokeWeight(4);
    line(205, 200, 215, 220);
    line(195, 200, 185, 220);
    line(205, 245, 215, 225);
    line(195, 245, 185, 225);
    //arm
    strokeWeight(4);
    line(210, 170, 220, 135);
    line(190, 170, 180, 135);
stroke(1);
    // man prtotype  
    strokeWeight(2);
    ellipse(100, 50+height/4, 20, 20);
    strokeWeight(6);
    line(100, 162, 100, 200);
    //feet
    strokeWeight(4);
    line(105, 200, 115, 220);
    line(95, 200, 85, 220);
    line(105, 245, 115, 225);
    line(95, 245, 85, 225);
    //arm
    strokeWeight(4);
    line(110, 170, 120, 135);
    line(90, 170, 80, 135); 
    stroke(1);
    // man prtotype  
    strokeWeight(2);
    ellipse(300, 50+height/4, 20, 20);
    strokeWeight(6);
    line(300, 162, 300, 200);
    //feet
    strokeWeight(4);
    line(305, 200, 315, 220);
    line(295, 200, 285, 220);
    line(305, 245, 315, 225);
    line(295, 245, 285, 225);
    //arm
    strokeWeight(4);
    line(310, 170, 320, 135);
    line(290, 170, 280, 135);
}
  }
