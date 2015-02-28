
float d = 125;


void setup() {
  size(500, 500);
  smooth();

  pushMatrix();
  popMatrix();
}


void draw() {

  noStroke();
  background(51, 200, 243);

  for (int y = 0; y <= height; y += 5) {
    for (int x = 0; x <= width; x += 5) {
      fill(255);
      ellipse(x, y, 5, 5);
        }
      }


  float v = map(mouseX, 0, 500, 50, 200);
  float m = map(mouseX, 0, 500, 80, 125);


  //triangle
  fill(255, 0, 0);
  triangle(250, 50, 50, 450, 450, 450);
  //angles
  //a = 52
  //b = 64
  

  //eyes blue section
  fill(51, 200, 243);
  arc(175, 200, v, v, radians(116), radians(297));
  arc(325, 200, v, v, radians(-116), radians(64));

  //eyes white section
  fill(255);
  arc(325, 200, v, v, radians(64), radians(244));
  arc(175, 200, v, v, radians(-64), radians(116));


  //random eyes
  float randE = random(v-10, v+10);
  
  //random mouth
  float randM = random(m-15, m-5);


  //sad
  if (v <100) {
    pushMatrix();
    //mouth
    fill(255);
    arc(250, 350, m, m, radians(-180), 0);
    popMatrix();
  } 

  //happy
  else if (v > 100 && v < 150) { 
    
    //if 2   
    if (v > 100 && v < 110)
    {
      pushMatrix();
      translate(250, 350);
      rotate(PI/3);
      arc(0, 0, m, m, radians(-180), 0);
      popMatrix();
    }

    // if 3
          if (v>110 && v < 120){
            pushMatrix();
            translate(250, 350);
            rotate(PI/2);
            arc(0, 0, m, m, radians(-180), 0);
            popMatrix();
            }

    //if 4
                if (v>120 && v < 130){
                  pushMatrix();
                  translate(250, 350);
                  rotate(2*PI/3);
                  arc(0, 0, m, m, radians(-180), 0);
                  popMatrix();
                  }

    //if 5
                      if (v>130 && v < 140){
                        pushMatrix();
                        translate(250, 350);
                        rotate(5*PI/6);
                        arc(0, 0, m, m, radians(-180), 0);
                        popMatrix();
                        }


    // if 6  
                            if (v>140 && v < 160){
                              pushMatrix();
                              translate(250, 350);
                              rotate(PI);
                              arc(0, 0, m, m, radians(-180), 0);
                              popMatrix();
                              }

    //    pushMatrix();
    //    translate(250, 350);
    //    //rotate(PI/6);
    //    arc(0, 0, m, m, radians(-180), 0);
    //    popMatrix();

  }

  //surprised
  else {
    
      


      
    background(255);
    for (int y = 0; y <= height; y += 5) {
      for (int x = 0; x <= width; x += 5) {
        fill(51, 200, 243);
        ellipse(x, y, 5, 5);
      }
    }
        //red stripes
        stroke(255,0,0);
        strokeWeight(4);
        for (int i = 0; i < height; i = i+11) {
          line(0, i, width, i);
        }
    
    noStroke();
    //background(51, 200, 243);
    fill(255);
    triangle(250, 50, 50, 450, 450, 450);

    fill(255, 0, 0);
    arc(175, 200, randE, randE, radians(116), radians(297));
    arc(325, 200, randE, randE, radians(-116), radians(64));


    fill(51, 200, 243);
    ellipse(250, 350, randM, randM);
    arc(325, 200, randE, randE, radians(64), radians(244));
    arc(175, 200, randE, randE, radians(-64), radians(116));
  }

  //println(v);
}


