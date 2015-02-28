
void setup() {
  size(550, 550);
  background(random(255), random(255), random(255));
}

boolean once = true;

void draw() {
  if (once == true) {
    for (int i=0; i<10; i++) {

      for (int j =0; j<10; j++) {
        newDude(j*50 + 10, i*50 + 10, random(255), random(255), random(255), random(255), random(255), random(255), random(255), random(255), random(255), random(20)+1);
      }
    }
  }

  once=false;
}

void newDude(float backX, float backY, float rgbA, float rgbB, float rgbC, float rgbA2, float rgbB2, float rgbC2, float rgbAHead, float rgbBHead, float rgbCHead, float eyeHeight) {


  //thing thing shaft color
  fill(110, 123, 139);

  //head thing shaft
  rect(backX+30, backY+5, 5, 10);

  //head thing circle color
  fill(rgbAHead, rgbBHead, rgbCHead);
  
  //head thing circle
  ellipse(backX+33, backY+5, 9, 9);

  //head color
  fill(rgbA, rgbB, rgbC);

  //head
  ellipse(backX+30, backY+30, 40, 35);

  //eye color
  fill(rgbA2, rgbB2, rgbC2);
  
  //eyes
  ellipse(backX+20, backY+30, 4, eyeHeight);
  ellipse(backX+30, backY+30, 4, eyeHeight);
}



