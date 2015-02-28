
float s = 0;
float angle = 0.0;
float r = random(0, 100);


void setup() {
  size(1300, 300);

  fill(0);
  background(#FFCB1C, 200);

}


void draw() {

  angle += .5;  
  for (float x = 0; x<=width; x+=50) {
    for (float y = 0; y<= height; y+=50) {

  translate(width, 0);
  scale(-1, 1);
      angle += .5;
      pushMatrix();
      smooth();
      scale((cos(angle / 9.0) + 1.2) * 4.0);
      noStroke();
      smooth();
      fill(155, 50);//gray
      ellipse(random(x/9), random(y/4), .5, .5);
      fill(#061D8B, 30);//dark blue      ellipse(random(x/8), random(y/4), random(.5, 1), random(.5, 1));
      fill(255, 160, 44, 18);//light orange
      ellipse(random(x/2), random(y), random(.5, .7), random(.5, .7));
      fill(#011752, 40);//darker blue
      ellipse(random(x/3), random(y), random(.7, 1), random(.7, 1));
      fill(#FFE23E, 170);//bright yellow
      ellipse(random((x/5)+850), random((y/3)+450), random(.6, .7), random(.6, .7));
      fill(#F7A807, 170);//light orange
      ellipse(random((x/5)+850), random((y/3)+450), random(.6, .7), random(.6, .7));
      fill(#FF5512, 185);//orange
      ellipse(random((x/5)+950), random((y)+650), random(.4, .7), random(.4, .7));
      fill(#2A0858, 180);//dark purple
      ellipse(random(x), random(y/1.2), random(.6), random(.6));
      frameRate(150);

    popMatrix();
      
        float sec = millis()/1000.0;
        if (sec > 5.0) {
          fill(#450474, 255);//dark purple
          ellipse(random(x/2), random(y/1.2), random(.5, 1), random(.5, 1));
          frameRate(40);
          if (sec > 10.0) {
            fill(#2A0858, 255);//dark blue
            ellipse(random(x/7), random(y/.8), random(1), random(1));
            frameRate(50);
            if (sec > 17.0) {
              fill(#200236, 255);//dark dark purple
              ellipse(random(x), random(y), (2), 2);
              frameRate(50);
              if (sec > 23.0) {
                fill(#07012C, 255); //dark dark blue
                ellipse(random(x), random(y), 3.5, 3.5);
                frameRate(45);
                if (sec > 29.0) {
                  fill(#030112, 255);//bascially black
                  ellipse(random(x), random(y), 5, 5);
                  frameRate(45);
                  if (sec > 34.0) {
                    fill(#05002C);
                    ellipse(random(x), random(y), 7, 7);
                    frameRate(50);
                    if (sec > 38.0) {
                      fill(#01000D);
                      ellipse(random(x), random(y), 10, 10);
                      frameRate(55);
                      if (sec > 45.0) {
                        fill(0);
                        ellipse(random(x), random(y), 15, 15);
                        frameRate(60);
                        if (sec > 52.0) {
                          fill(0);
                          ellipse(random(x), random(y), 25, 25);
                          frameRate(70);
                          if (sec > 57.0) {
                            fill(0);
                            ellipse(random(x), random(y), 45, 45);
                            frameRate(80);
                            if (sec > 61.0) {
                              fill(0);
                              ellipse(random(x), random(y), 100, 100);
                              if (sec > 68.0) {
                                fill(0);
                                ellipse(width/2, height/2, 1300, 400);
                              }
                  
                            }
          }
        }
    }
        }
  }

  }
        }
}
  }

  }
}
}
}

