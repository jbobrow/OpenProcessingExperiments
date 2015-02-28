
void setup() {
  size(300, 300);
  background(20);
}
void draw() {
  fill(0, 0, 60, 20);
  rect(0, 0, 500, 200);
  for (int skyh = 0;skyh<30;skyh++) {
    for (int skyv =0;skyv<30;skyv++) {
      pushMatrix();

      float randstars = random(-6, 6);
      float randstars2 = random (-2, 2);

      translate(1+15*skyh+randstars, 1+randstars2 +8*skyv);
      fill(0);
      rect(0, 0, 200, 300);
      fill(255);
      ellipse(0, 0, 2, 2);
      popMatrix();


      fill(110);
      noStroke();
      rect(0, 100, 30, 100);
      fill(95);
      rect(120, 120, 150, 80);
      fill(50);
      rect(30, 70, 120, 130);
      fill(255, 200, 0);
      for (int i=0;i<12;i++) {
        for (int j=0;j<12;j++) {
          pushMatrix();
          fill(255, 200, 0);
          translate(32+10*i, 75+10*j);
          rect(0, 0, 5, 5);
          popMatrix();
        }
        fill(100);
        rect(280, 50, 110, 150);
        fill(70);
        rect(170, 150, 130, 50);
      }
      fill(0);
      rect(0, 200, 300, 200);
      for (int k=0;k<8;k++) {
        for (int l = 0; l<12; l++) {
          float rand = random(-10, 10);
          float rand2 = random(-10, 10);
          pushMatrix();
          fill(255, 200, 0, 220);
          translate(28+rand+15*k, 210+rand2+15*l);
          //rect(0, 0, 5, 7);
          //fill(200,100,0,100);
          rect(0, 0, 18, 3);

          popMatrix();
        }
      }
    }
  }
}



