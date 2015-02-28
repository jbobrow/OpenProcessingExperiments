
//PeterSantos FaceAssignment

float v;
float x;
float mp;
float mp2;

void setup()
{
  size(600, 600);
  smooth();
}


void draw()
{
  background(255);
  v=mouseX/5;
  float v2 = map(v, 30, 120, 0, 120);


  noStroke();
  fill(200+v/2);
  quad(175, 100, 195, 100, 200, 250, 150, 250);
  quad(405, 100, 425, 100, 450, 250, 400, 250);




  //lines

  noStroke();
  fill(200+v/2);
  ellipse(300, 300, 330, 330);

  noStroke();
  fill(190+v/2);
  ellipse(300, 300, 320, 320);

  noStroke();
  fill(180+v/2);
  ellipse(300, 300, 310, 310);

  noStroke();
  fill(170+v/2);
  ellipse(300, 300, 300, 300);

  noStroke();
  fill(160+v/2);
  ellipse(300, 300, 290, 290);

  stroke(100+v, 0, 0);
  strokeWeight(8);
  line(300, 490, 300, 220);
  line(285, 480, 285, 210);
  line(315, 480, 315, 210);

  stroke(120+v, 0, 0);
  line(330, 470, 330, 200);
  line(270, 470, 270, 200);
  line(255, 460, 255, 190);
  line(345, 460, 345, 190);

  stroke(150+v, 0, 0);
  line(240, 450, 240, 180);
  line(360, 450, 360, 180);
  line(225, 440, 225, 170);
  line(375, 440, 375, 170);

  stroke(180+v, 0, v);
  line(210, 430, 210, 160);
  line(390, 430, 390, 160);
  line(195, 350, 195, 160);
  line(405, 350, 405, 160);

  stroke(225+v, v, 0);
  line(180, 340, 180, 160);
  line(420, 340, 420, 160);
  line(165, 330, 165, 160);
  line(435, 330, 435, 160);
  line(150, 300, 150, 200);
  line(450, 300, 450, 200);
  line(135, 280, 135, 220);
  line(465, 280, 465, 220);
  line(120, 260, 120, 230);
  line(480, 260, 480, 230);
  line(105, 250, 105, 240);
  line(495, 250, 495, 240);

  stroke(0);
  strokeWeight(1);
  line(300, 490, 300, 220);
  line(285, 480, 285, 210);
  line(315, 480, 315, 210);

  stroke(v,v+50,0);
  line(330, 470, 330, 200);
  line(270, 470, 270, 200);
  line(255, 460, 255, 190);
  line(345, 460, 345, 190);

  stroke(v,0,v+50);
  line(240, 450, 240, 180);
  line(360, 450, 360, 180);
  line(225, 440, 225, 170);
  line(375, 440, 375, 170);

  stroke(0);
  line(210, 430, 210, 160);
  line(390, 430, 390, 160);
  line(195, 350, 195, 160);
  line(405, 350, 405, 160);

  stroke(0);
  line(180, 340, 180, 160);
  line(420, 340, 420, 160);
  line(165, 330, 165, 160);
  line(435, 330, 435, 160);
  line(150, 300, 150, 200);
  line(450, 300, 450, 200);
  line(135, 280, 135, 220);
  line(465, 280, 465, 220);
  line(120, 260, 120, 230);
  line(480, 260, 480, 230);
  line(105, 250, 105, 240);
  line(495, 250, 495, 240);

  //noseline
  stroke(255);
  strokeWeight(20);
  line(300, 100, 300, 250); 

  //eyeline
  strokeWeight(10);
  line(300, 250, 200, 250);
  line(300, 250, 400, 250);




  //nose
  fill(255);
  noStroke();
  arc(300, 350, 100, v, 0, PI);


  //mouth
  fill(255);
  noStroke();
  arc(300, 250, 50, 50, 0, PI );

  //eyes
  noStroke();
  fill(255, mp);
  ellipse(200, 250, 30+v/2, 30+v/2);
  ellipse(400, 250, 30+v/2, 30+v/2);
}

void mouseReleased() {
  if(mp == 0) {
    mp = 255;
    mp2 = 0;
  } else {
    mp = 0;
    mp2 = 255;
  }
}


