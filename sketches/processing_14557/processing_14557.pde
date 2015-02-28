

                
                void setup() {
  size(200,200);
}
void draw() {
  smooth();
  background(255);
  
  translate(100,100);
  scale(0.3);
  for (int i = 0; i < 12; i++) {
    scale(1);
    rotate(radians(frameCount*0.9));

    mydraw();
  }
}    

void mydraw() {

  int[] a = {
    20,40,60,80,100,120,140,160,180,200
  };
  int[] b = {
    20,40,60,80,100,120,140,160,180,200
  };

  noStroke(); 
  if(mouseX>100 && mouseY>100) {
    fill(a[1],b[2],100);
  }
  else {
    fill(a[1],b[4],20);
  }
  for(int x = 10; x<200; x=x+20)
    for(int y = 10; y<200; y=y+20) {
      ellipse(x,y,10,10);
    }



  stroke(1);
  //the leg of back on the left side.
  beginShape();
  fill(253,231,24);
  vertex(107,140);
  vertex(104,158);
  bezierVertex(85,176,120,170,122,158);
  endShape();

  //tale
  beginShape();
  vertex(134,125);
  bezierVertex(136,123,153,130,155,107);
  vertex(150,107);
  bezierVertex(153,103,150,127,134,120);
  //vertex(130,120);
  endShape();

  //leg 4
  beginShape();
  vertex(125,142);
  vertex(132,162);
  bezierVertex(120,182,157,184,148,159);
  vertex(132,134);
  endShape();

  //chest
  beginShape();
  vertex(93,135);
  bezierVertex(98,156,150,150,130,112);
  endShape();

  //the leg of front
  beginShape();
  vertex(106,140);
  vertex(110,172);
  bezierVertex(90,200,140,200,126,175);
  vertex(126,175);
  vertex(120,137);
  endShape();

  //legs
  beginShape();
  vertex(80,125);
  vertex(68,168);
  bezierVertex(48,178,85,200,85,168);
  vertex(85,168);
  vertex(93,135);
  endShape();

  //tale -0
  ellipse(153,110,12,12);


  //hair
  beginShape();
  fill(251,155,52);
  vertex(95,18);
  bezierVertex(80,0,55,18,54,30);
  bezierVertex(35,30,20,50,36,62);
  bezierVertex(15,72,20,103,43,102);
  bezierVertex(38,120,60,140,75,126);
  bezierVertex(70,130,115,150,123,116);
  bezierVertex(150,120,155,90,145,77);
  bezierVertex(155,85,170,36,139,38);
  bezierVertex(145,10,100,0,94,20);
  endShape();

  //face
  fill(253,231,24);
  ellipse(85,65,65,65);

  //eyes
  fill(0);
  ellipse(67,43,4,4);
  ellipse(92,41,4,4);

  //mouth
  fill(253,231,24);
  ellipse(78,64,15,25);
  fill(246,8,3);
  ellipse(78,60,10,25);

  //nose-1
  fill(253,231,24);
  beginShape();
  vertex(72,45);
  bezierVertex(63,47,60,60,77,54);
  vertex(77,52);
  bezierVertex(100,70,100,30,72,47);
  endShape();

  //nose
  fill(208,65,106);
  ellipse(75,45,6,6);

  //line-1
  noStroke();
  fill(251,155,52);
  beginShape();
  vertex(76,100);
  vertex(140,100);
  vertex(140,40);
  vertex(120,40);
  bezierVertex(105,52,105,60,117,74);
  vertex(127,73);
  bezierVertex(100,77,108,80,102,94);
  vertex(102,94);
  bezierVertex(100,90,80,90,76,100);
  endShape();

  //line-2
  stroke(0);
  noFill();
  beginShape();
  vertex(120,40);
  bezierVertex(105,52,105,60,117,74);
  vertex(127,73);
  bezierVertex(100,77,108,80,102,94);
  vertex(102,94);
  bezierVertex(100,90,80,90,76,100);
  endShape();
}

