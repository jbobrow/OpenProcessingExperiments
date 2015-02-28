
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: LIM HYUNSEUNG
// ID: 201420104

void setup() {
  size(1024, 768);
  background(0);
  noLoop();
}

void draw() {
  //CENTR LINE(Background)
  for (int y = 512;y>0; y-=10) {
    for (int x = 384;x>0; x-=5) {
      if (x<400) {
        stroke(200);
        line(x*2, y*2, x, y);
      }
      else {
        rect(x, y, x*2, y*2);
      }
    }
  }


  //White LINE Circle #1
  smooth();
  for (int x = 150; x<400; x+=10) {
    noFill();
    stroke(255);
    ellipse(50, 50, x, x);
  }


  //White LINE Circle #2
  smooth();
  for (int x = 150; x< 600; x+=30) {
    noFill();
    stroke(255);
    ellipse(300, 300, x, x);
  }


  //Black Circle
  for (int y = 20;y<=500; y+=3) {
    for (int x = 20; x<500; x+=10) {
      stroke(4);
      strokeWeight(4);
      ellipse(300, 300, x-100, x-100);
    }
  }


  //Gradation Stick1
  noStroke();
  for (int y= 0;y<200;y+=20) {
    for (int x= 0;x<300;x+=10) {
      fill(x*0.6);
      rect(x+380, y+100, 12*x, 12);
    }
  }


  //Random Surface Background
  fill(0, 76);
  smooth();
  noFill();
  stroke(255, 20);
  strokeWeight(1);
  for (int y = -10; y<=1024;y+=20) {
    for (int x = -10; x<=768;x+=20) {
      ellipse(random(width), random(height), random(width), random(height));
    }
  }



  //Gradation Stick2
  for (int y= 100;y<200;y+=10) {
    for (int x= 100;x<200;x+=10) {
      if (x<200) {
        noStroke();
        fill(5);
        rect(x*4, y*4, 5, 5);
      }
    }
  }



  //Gradation Stick2
  for (int y= 0; y<200; y+=10) {
    for (int x =0; x<300; x+=10) {
      if (x<200) {
        stroke(10);
        noStroke();
        fill(x*0.2);
        rect(x+100, 500-y, 10, 5);
      }
    }
  }
}


void keyPressed() {
  background(100);
  redraw();
}



