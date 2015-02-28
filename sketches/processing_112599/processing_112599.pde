
//Drawing App Experiment
//VIIRJ.COM, 2013





void setup() {

  background(255);

  size(600, 600);
  smooth();
}


void draw() {
  float d = dist(mouseX, mouseY, pmouseX, pmouseY);
  //noStroke();
  float r = random(53, 12);


  //FIRST draws +++++++++++++++++++++++++++++
  stroke(20, 20, 200, 20);
  //float fillVal = map(d,0,50,100,HSB);
  // fill(fillVal*HSB);
  ellipse(mouseX, mouseY, 4, 4);
  strokeWeight(10); 
  stroke(20, 20, 200, 10);
  // ellipse(mouseX,mouseY,10,10);


  //ERASER+++++++++++++++++++++++++++++++++
  if (mousePressed) {
    //noStroke();
    //strokeWeight(1);
    //fill(0);
    // fill(0,0,0,10);
    fill(255, 0, 0);
    stroke(50, 50, 50, 110);
    strokeWeight(2);
    line(mouseX, mouseY, pmouseX, pmouseY);
  }

  //MENU+++++++++++++++++++++++++++++++++
  fill(0, 50);
  text("[R] effect", 75, 47);
  ellipse(50, height, 0, 0);

  text("[B] effect", 75+100, 47);
  ellipse(50, height, 0, 0);

  text("[G] effect", 75+200, 47);
  ellipse(50, height, 0, 0);

  //   text("[X]RANDOM",75+300,47);
  // ellipse(50,height,0,0);



  //R EFFECT++++++++++++++++++++++++++++++++
  if (keyPressed) {
    if (key=='r'||key=='R') {

      fill(d, r, r, 10);
      stroke(255);

      strokeWeight(1);
      ellipse(mouseX, mouseY, 20, d+20);
    }

    //B EFFECT++++++++++++++++++++++++++++++++
    if (keyPressed) {
      if (key=='b'||key=='B') {


        fill(255);
        stroke(50, 50, 50, 70);
        strokeWeight(0.5);
        line(mouseX, mouseY, pmouseX+d*10, pmouseY);
      }
      //G EFFECT+++++++++++++++++++++++++++++++
      if (keyPressed) {
        if (key=='g'||key=='G') {
          fill(50, 150, 50, 10);
          // stroke(0,0,255);
          strokeWeight(1);
          //    ellipse(mouseX, mouseY, 10, 10);
          fill(50, 50, 50, 100);
          line(mouseY, mouseX, 150, 150);

          line(mouseX, mouseY, 50, 50);
          line(mouseX, mouseY, 450, 450);
          line(mouseX, mouseY, 550, 550);

          line(mouseX, mouseY, 550, 50);
          line(mouseX, mouseY, 50, 550);
          line(mouseX, mouseY, 50, 450);
          line(mouseX, mouseY, 450, 50);
        }
      }
    }
  }
}



