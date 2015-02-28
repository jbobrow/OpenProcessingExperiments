
float angle = 0.0;
float offset = 290;
float scalar = 20;
float speed = .3;

void setup() {
  size(800, 800);
}

void draw ()
{
  background(51); 
  
  //face
  noStroke();
  fill(255, 235, 205);
  ellipse(400, 400, 400, 500);
  
  //eyes open
  int a = 480;
  int b = 365;
  int c = 90;
   noStroke();
  fill(235, 213, 181);
  ellipse(a, b, c, c);
  ellipse(a-160, b, c, c);
  noStroke();
  fill(255);
  ellipse(a, b+15, c+10, c+10);
  ellipse(a-160, b+15, c+10, c+10);
  fill(124, 80, 14);
  ellipse(a, b+15, c-30, c-30);
  ellipse(a-160, b+15, c-30, c-30);
  noStroke();
  fill(0);
  ellipse(a, b+15, c-50, c-50);
  ellipse(a-160, b+15, c-50, c-50);
  
  //eybrows
  float y1 = offset + sin(angle) * scalar;
  float y3 = offset + sin(angle) * scalar;
  fill(77, 53, 17);
  ellipse(320, y1, 100, 10);
  ellipse(480, y3, 100, 10);
  angle += speed;

  //nose
  strokeWeight(10);
  stroke(255, 170, 150);
  noFill();
  bezier(385, 460, 380, 440, 400, 425, 410, 430);
  
   //mouthClosed
  strokeWeight(10);
  stroke(191, 109, 109);
  noFill();
  bezier(330, 515, 360, 535, 440, 535, 470, 515);
  
  //mouth
  if(mouseX > 325 && mouseX < 515)
  {
    if(mouseY > 515 && mouseY < 535)
    {
       noStroke();
  fill(110, 49, 49);
  arc(400, 510, 150, 150, 0, PI, CHORD);
  fill(0);
  ellipse(400, 530, 30, 30);
  fill(218, 157, 157);
  ellipse(400, 560, 50, 50);
  stroke(182, 135, 135);
  strokeWeight(3);
  line(400, 550, 400, 580);
    }
  }

  
  //cheeks
  noStroke();
  fill(235, 213, 181);
  arc(320, 420, 200, 200, 2, 3.5, CHORD);
  arc(470, 420, 200, 200, 6, 7.5, CHORD);
  
  //hair
  int aa = 150;
  int bb = 200;
  int cc = 270;
  int dd = 300;
  int ee = 500;
  int ff = 400;
  noStroke();
  fill(30, 14, 2);
  arc(ee+100, ee+50, aa, bb, 5, 7.5, CHORD);
  arc(ee+80, ee+50, aa, dd, 5, 7.5, CHORD);
  arc(ee+50, ee+50, aa, bb, 5, 7.5, CHORD);
  fill(40, 14, 2);
  ellipse(620, 460, 120, 140);
  fill(53, 28, 4);
  arc(cc, ff+20, bb, ff, 2, 4.3, CHORD);
  arc(dd, ff+20, bb, ee+100, 2, 4, CHORD);
  arc(dd, dd+20, bb, dd, 2, 4.5, CHORD);
  arc(cc+10, dd+20, bb, dd, 2, 4.5, CHORD);
  arc(ee+20, dd+20, bb, dd, 5, 7.5, CHORD);
  arc(ff, dd, ff, bb+50, 3, 5, CHORD);
  arc(ff, cc, ff, dd, 3, 5, CHORD);
  arc(ff, cc, ff, dd, 5, 7, CHORD);
  arc(ff, cc, ff, dd, 3, 5.5, CHORD);
  arc(ee+20, ff+30, aa, ee+50, 5, 7.5, CHORD);
  arc(ee+50, ff, aa, dd, 5, 7.5, CHORD);

}


