
  float wormsize;
void setup(){
  size(400, 400);
  smooth();
  wormsize = 70;
}

void draw(){
  //background(227, 196, 255);
  if(wormsize > width){
     wormsize = 10;
  }
  else{
  wormsize = wormsize*1.01;
  }
  
  //background
  noStroke();
    fill(212, 244, 250);
  ellipse(wormsize-150, 600, wormsize+1600, wormsize+1600);
  fill(178, 204, 255);
  ellipse(wormsize-150, 600, wormsize+1550, wormsize+1550);
    fill(212, 244, 250);
  ellipse(wormsize-150, 600, wormsize+1500, wormsize+1500);
  fill(178, 204, 255);
  ellipse(wormsize-150, 600, wormsize+1450, wormsize+1450);
    fill(212, 244, 250);
  ellipse(wormsize-150, 600, wormsize+1400, wormsize+1400);
  fill(178, 204, 255);
  ellipse(wormsize-150, 600, wormsize+1350, wormsize+1350);
    fill(212, 244, 250);
  ellipse(wormsize-150, 600, wormsize+1300, wormsize+1300);
  fill(178, 204, 255);
  ellipse(wormsize-150, 600, wormsize+1250, wormsize+1250);
    fill(212, 244, 250);
  ellipse(wormsize-150, 600, wormsize+1200, wormsize+1200);
  fill(178, 204, 255);
  ellipse(wormsize-150, 600, wormsize+1150, wormsize+1150);
    fill(212, 244, 250);
  ellipse(wormsize-150, 600, wormsize+1100, wormsize+1100);
  fill(178, 204, 255);
  ellipse(wormsize-150, 600, wormsize+1050, wormsize+1050);
    fill(212, 244, 250);
  ellipse(wormsize-150, 600, wormsize+1000, wormsize+1000);
  fill(178, 204, 255);
  ellipse(wormsize-150, 600, wormsize+950, wormsize+950);
    fill(212, 244, 250);
  ellipse(wormsize-150, 600, wormsize+900, wormsize+900);
  fill(178, 204, 255);
  ellipse(wormsize-150, 600, wormsize+850, wormsize+850);
    fill(212, 244, 250);
  ellipse(wormsize-150, 600, wormsize+800, wormsize+800);
  fill(178, 204, 255);
  ellipse(wormsize-150, 600, wormsize+750, wormsize+750);
    fill(212, 244, 250);
  ellipse(wormsize-150, 600, wormsize+700, wormsize+700);
  fill(178, 204, 255);
  ellipse(wormsize-150, 600, wormsize+650, wormsize+650);
    fill(212, 244, 250);
  ellipse(wormsize-150, 600, wormsize+600, wormsize+600);
  fill(178, 204, 255);
  ellipse(wormsize-150, 600, wormsize+550, wormsize+550);
    fill(212, 244, 250);
  ellipse(wormsize-150, 600, wormsize+500, wormsize+500);
  fill(178, 204, 255);
  ellipse(wormsize-150, 600, wormsize+450, wormsize+450);
    fill(212, 244, 250);
  ellipse(wormsize-150, 600, wormsize+400, wormsize+400);
  fill(178, 204, 255);
  ellipse(wormsize-150, 600, wormsize+350, wormsize+350);
    fill(212, 244, 250);
  ellipse(wormsize-150, 600, wormsize+300, wormsize+300);
  fill(178, 204, 255);
  ellipse(wormsize-150, 600, wormsize+250, wormsize+250);
    fill(212, 244, 250);
  ellipse(wormsize-150, 600, wormsize+200, wormsize+200);
  fill(178, 204, 255);
  ellipse(wormsize-150, 600, wormsize+150, wormsize+150);
    fill(212, 244, 250);
  ellipse(wormsize-150, 600, wormsize+100, wormsize+100);
  fill(178, 204, 255);
  ellipse(wormsize-150, 600, wormsize+50, wormsize+50);
    fill(212, 244, 250);
  ellipse(wormsize-150, 600, wormsize, wormsize);

  //hair band
  
  float band_rotation = -mouseX/2;
  
  translate(mouseX/5, -(400-mouseY)/5);
  
  translate(200, 180);
  rotate(radians(band_rotation));
  translate(-200, -180);
  
  noFill();
  stroke(250, 235, 255);
  strokeWeight(12);
  arc(200, 180, 200, 220, PI-radians(10), PI+PI+radians(10));
  noStroke();
  fill(128, 65, 217);
  ellipse(115, 118, 20, 20);
  ellipse(125, 103, 20, 20);  
  
  translate(200, 180);
  rotate(radians(-band_rotation));
  translate(-200, -180);
  
  translate(-mouseX/5, (400-mouseY)/5);
  
  //bottom hair
  fill(102, 75, 0);
  rect(100, 200, 200, 130, 1, 1, 20, 20);

  //face
  fill(250, 236, 197);
  noStroke();
  ellipse(200, 180, 200, 220);
    
  //left eye
  fill(255, 255, 255);
  noStroke();
  arc(150, 160, 50, 50, -0.3, PI-0.3);
  fill(102, 75, 0);
  ellipse(152, 172, 20+mouseX/35, 20+(400-mouseY)/35);
  
  //right eye
  fill(255, 255, 255);
  noStroke();
  arc(250, 160, 50, 50, 0.3, PI+0.3);
  fill(102, 75, 0);
  ellipse(248, 172, 20+mouseX/35, 20+(400-mouseY)/35);
  
  //up hair
  noFill();
  stroke(102, 75, 0);
  strokeWeight(8);
  arc(200, 180, 195, 215, PI-radians(10), PI+PI+radians(10));
  
  //front hair
  fill(102, 75, 0);
  noStroke();
  triangle(176, 75, 147, 120, 287+(mouseX/10), 120-(height/10-(mouseY/10)));
  triangle(176, 75, 147, 120, 120, 120);
  triangle(176, 75, 147, 120, 287, 120);
  quad(176, 75, 287, 123, 260, 92, 220, 72);
  quad(122, 115, 226+(mouseX/6), 142-(height/6-(mouseY/6)), 298+(mouseX/5.5), 172-(height/5.5-(mouseY/5.5)), 280, 115);
  quad(180, 70, 110+(mouseX/6), 180-(height/6-(mouseY/6)), 115, 125, 120, 115);
  
  //hat
  float hat_rotation = 30+mouseX/3;
  
  fill(128, 65, 217);
  
  translate(mouseX/5, -(400-mouseY)/5);
  
  translate(300, 100);
  rotate(radians(hat_rotation));
  translate(-300, -100);
 
  ellipse(250, 125, 140, 40);
  arc(250, 135, 100, 120, PI, PI+PI);
 
  translate(300, 100);
  rotate(radians(-hat_rotation));
  translate(-300, -100);


  translate(-mouseX/5, (400-mouseY)/5);
  
  
  //clothes
  noStroke();
  fill(255, 255, 255);
  quad(128, 300, 268, 300, 286, 370, 110, 370);
  quad(140, 500, 250, 500, 286, 370, 110, 370);
  quad(128, 300, 70, 400, 100, 400, 120, 370);
  quad(268, 300, 330, 400, 300, 400, 280, 370);
  fill(128, 65, 217);
  arc(198, 300, 110, 110, 0, PI);
  fill(255, 255, 255);
  arc(198, 300, 115, 115, radians(75), PI-radians(75));
  
  //neck
  fill(250, 236, 197);
  noStroke();
  rect(173, 285, 50, 20);
  arc(198, 300, 70, 70, 0, PI);
  
  //nose
  stroke(214, 200, 161);
  strokeWeight(3);
  line(200, 185, 190, 215);
  line(190, 215, 205, 220);
  
  //lips
  fill(255, 167, 167);
  noStroke();
  quad(205, 250, 195, 245, 185, 250, 195, 255);
  quad(215, 250, 205, 245, 195, 250, 205, 255);
  
  //ears
  fill(250, 236, 197);
  noStroke();
  ellipse(104, 200, 20, 35);
  ellipse(296, 200, 20, 35);
  
  //starting wind
  noFill();
  stroke(108, 192, 255);
  strokeWeight(3);
  bezier(50, 320, 90, 280, 80, 375, 10, 375);
  bezier(70, 300, 100, 270, 90, 395, 20, 385);
  
}
