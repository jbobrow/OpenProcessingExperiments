
void setup() {
  size(300, 300);
  background(20);
}
void draw() {
  fill(0, 0, 60, 20);
  rect(0, 0, 500, 200);
  for (int skyh = 0;skyh<15;skyh++) {
    for (int skyv =0;skyv<15;skyv++) {
      pushMatrix();

      float randstars = random(-20, 20);
      float randstars2 = random (-20, 20);

      translate(1+30*skyh+randstars, 1+randstars2 +16*skyv);
      fill(0);
      rect(0, 0, 200, 300);
      fill(255);
      ellipse(0, 0, 1, 1);
      popMatrix();

//Adding the buildings of the city
      fill(110);
      noStroke();
      rect(0, 100, 30, 100);
      //adding lit windows to  this particualr building
      for (int b2=0; b2 < 3; b2++) {
        for (int b3 = 0; b3<8;b3++) {
          pushMatrix();
          fill(200, 220, 255);
          translate(3+10*b2, 110+10*b3);
          rect(0, 0, 4, 5);
          popMatrix();
          //continuing to add buildings
          fill(95);
          rect(120, 120, 150, 80);
          fill(50);
          rect(30, 70, 120, 130);
          fill(255, 200, 0);
          //adding lights to this particular building also
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
          //adding a reflection in the water for the yellow building
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
            }}
            
              for (int reflectb2=0;reflectb2<4;reflectb2++) {
                for (int reflectb3 = 0; reflectb3<12; reflectb3++) {
                  float randb2 = random(-10, 10);
                  float randb3 = random(-10, 10);
                  pushMatrix();
                  fill(200, 220, 255, 220);
                  translate(randb2+15*reflectb2, 210+randb3+15*reflectb3);
                  rect(0, 0, 18, 3);

                  popMatrix();
                }
              }
            }
          }
        }
      }
    }
  



