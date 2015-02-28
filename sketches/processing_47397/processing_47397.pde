
void mode1() {
  image(img1, 0, 0); 
  player.loop();

  if (currentTime > timer) {

    float r = random(1.0);

    if (r > 0.5) { 
      story = 0;
      mode = 10;
      timer = currentTime + 8000;
    } 
    else {
      story = 1;
      mode = 20;
      timer = currentTime + 8000;
    }
  }
}

void mode10() { 
  if (currentTime > timer - 5000) {

    float yposDown_In = map(currentTime, timer-5000, timer, -height, 0);
    float fade = map(currentTime, timer-5000, timer, 0, 255);

    tint(255, 255-fade); 
    image(img10, 0, 0);
    tint(fade, 255); 
    image(img11, 0, yposDown_In);
  } 
  else {
    image(img10, 0, 0);
  }
  if (currentTime > timer) {
    mode = 11;
    timer = currentTime + 6000;
  }
}

void mode11() {  

  if (currentTime > timer-4000) {

    float xposLR_In = map(currentTime, timer-4000, timer, -width, 0);
    float fade = map(currentTime, timer-4000, timer, 0, 255);

    noTint();
    image(img11, 0, 0);
    tint(255, fade);
    image(img12, xposLR_In, 0);
  } 
  else {
    image(img11, 0, 0);
  }

  if (currentTime > timer) {

    mode = 12;
    timer = currentTime + 7000;
  }
}

void mode12() {

  if (currentTime > timer-3000) {

    float xposLR_In = map(currentTime, timer-3000, timer, -width, 0);
    float fade = map(currentTime, timer-3000, timer, 0, 255);

    noTint();
    image(img12, 0, 0);
    tint(255, fade);
    image(img13, xposLR_In, 0);
  } 
  else {
    image(img12, 0, 0);
  }

  if (currentTime > timer) {

    mode = 13;
    timer = currentTime + 5000;
  }
}

void mode13() {

  if (currentTime > timer-2000) {

    float xposRL_In = map(currentTime, timer-2000, timer, width, 0);
    float fade = map(currentTime, timer-2000, timer, 0, 255);

    noTint();
    image(img13, 0, 0);
    tint(255, fade);
    image(img14, xposRL_In, 0);
  } 
  else {
    image(img13, 0, 0);
  }

  if (currentTime > timer) {
    mode = 14;
    timer = currentTime + 7000;
  }
}

void mode14() {
  if (currentTime > timer-6000) {

    float xposLR_Out = map(currentTime, timer-6000, timer, 0, width);
    float fade = map(currentTime, timer-6000, timer, 0, 255);

    noTint();
    image(img14, 0, 0);
    tint(255, fade);
    image(img14, xposLR_Out, 0);
    tint(255, 255-fade);
  }
  if (currentTime > timer) {
    mode = 2;
    timer = currentTime + 5000;
  }
}

void mode2(int gotohere) {

  if (currentTime > timer-4000) {

    float xposRL_In = map(currentTime, timer-4000, timer, width, 0);
    float fade = map(currentTime, timer-4000, timer, 0, 255);

    noTint();
    text("NEXT DAY", width/3, height/2); 
    tint(255, fade);
    image(img15, xposRL_In, 0);
  } 
  else {
    text("NEXT DAY", width/3, height/2);
  }
  if (currentTime > timer) {
    mode = gotohere;
    timer = currentTime + 4000;
  }
}

void mode15() {
  if (currentTime > timer-4000) {

    float yposDown_In = map(currentTime, timer-4000, timer, -height, 0);
    float fade = map(currentTime, timer-4000, timer, 0, 255);

    noTint();
    image(img15, 0, 0);
    tint(255, fade); 
    image(img16, 0, yposDown_In);
  } 
  else {
    image(img15, 0, 0);
  }
  if (currentTime > timer) {
    mode = 16;
    timer = currentTime + 10000;
  }
}

void mode16() {
  if (currentTime > timer-10000) {

    float yposUp_In = map(currentTime, timer-10000, timer, height, 0);
    float fade = map(currentTime, timer-10000, timer, 0, 255);

    noTint();
    image(img16, 0, 0);
    tint(255, fade);
    image(img17, 0, yposUp_In);
  } 
  else {
    image(img16, 0, 0);
  }
  if (currentTime > timer) {
    mode = 17;
    timer = currentTime + 8000;
  }
}

void mode17() {
  if (currentTime > timer-6000) { 

    float xposRL_In = map(currentTime, timer-6000, timer, width, 0);
    float fade = map(currentTime, timer-6000, timer, 0, 255);

    noTint();
    image(img17, 0, 0);
    tint(255, fade);
    image(img18, xposRL_In, 0);
  } 
  else {
    image(img17, 0, 0);
  }
  if (currentTime > timer) {
    mode = 18;
    timer = currentTime + 6000;
  }
}


void mode18() {

  if (currentTime > timer-5000) {
    float fade = map(currentTime, timer-5000, timer, 0, 255);

    noTint();
    image(img18, 0, 0);
    tint(255, fade);
    tint(255-fade, 255);
  }
}


void mode20() {
  if (currentTime > timer-5000) {

    float xposLR_In = map(currentTime, timer-5000, timer, -width, 0);
    float fade = map(currentTime, timer-5000, timer, 0, 255);

    tint(255, 255-fade); 
    image(img20, 0, 0);
    tint(fade, 255); 
    image(img21, xposLR_In, 0); 
  } 
  else {
    image(img20, 0, 0);
  }
  if (currentTime > timer) {
    mode = 21;
    timer = currentTime + 6000;
  }
}

void mode21() {
  if (currentTime > timer-4000) {

    float yposUp_In = map(currentTime, timer-4000, timer, height, 0);
    float fade = map(currentTime, timer-4000, timer, 0, 255);

    noTint();
    image(img21, 0, 0);
    tint(255, fade);
    image(img22, 0, yposUp_In);
  } 
  else {
    image(img21, 0, 0);
  }
  if (currentTime > timer) {
    mode = 22;
    timer = currentTime + 6000;
  }
}

void mode22() {
  if (currentTime > timer-3000) {

    float yposDown_In = map(currentTime, timer-3000, timer, -height, 0);
    float fade = map(currentTime, timer-3000, timer, 0, 255);

    noTint();
    image(img22, 0, 0);
    tint(255, fade);
    image(img23, 0, yposDown_In);
  } 
  else {
    image(img22, 0, 0);
  }
  if (currentTime > timer) {
    mode = 23;
    timer = currentTime + 8000;
  }
}

void mode23() {
  if (currentTime > timer-5000) {

    float xposLR_In = map(currentTime, timer-5000, timer, -width, 0);
    float fade = map(currentTime, timer-5000, timer, 0, 255);

    noTint();
    image(img23, 0, 0);
    tint(255, fade);
    image(img24, xposLR_In, 0);
  } 
  else {
    image(img23, 0, 0);
  }
  if (currentTime > timer) {
    mode = 24;
    timer = currentTime + 5000;
  }
}
void mode24() {
  if (currentTime > timer-3000) {

    float xposRL_In = map(currentTime, timer-3000, timer, width, 0);
    float fade = map(currentTime, timer-3000, timer, 0, 255);

    noTint();
    image(img24, 0, 0);
    tint(255, fade);
    image(img25, xposRL_In, 0);
  } 
  else {
    image(img24, 0, 0);
  }
  if (currentTime > timer) {
    mode = 25;
    timer = currentTime + 6000;
  }
}

void mode25() {
  image(img25, 0, 0); 
  if (currentTime > timer-5000) {

    float xposLR_Out = map(currentTime, timer-5000, timer, 0, width);
    float fade = map(currentTime, timer-5000, timer, 0, 255);

    noTint();
    image(img25, 0, 0);
    tint(255, fade);
  } 
  else {
    image(img25, 0, 0);
  }
  if (currentTime > timer) {
    mode = 2;
    timer = currentTime + 5000;
  }
}

void mode2() {

  if (currentTime > timer-4000) {

    float xposRL_In = map(currentTime, timer-4000, timer, width, 0);
    float fade = map(currentTime, timer-4000, timer, 0, 255);

    noTint();
    text("NEXT DAY", width/3, height/2); 
    tint(255, fade);
    image(img26, xposRL_In, 0);
  } 
  else {
    text("NEXT DAY", width/3, height/2);
  }

  if (currentTime > timer) {
    mode = 26;
    timer = currentTime + 6000;
  }
}

void mode26() {
  if (currentTime > timer-2000) {

    float yposUp_In = map(currentTime, timer-2000, timer, height, 0);
    float fade = map(currentTime, timer-2000, timer, 0, 255);

    noTint();
    image(img26, 0, 0);
    tint(255, fade);
    image(img27, 0, yposUp_In);
  } 
  else {
    image(img26, 0, 0);
  }
  if (currentTime > timer) {
    mode = 27;
    timer = currentTime + 4000;
  }
}

void mode27() {
  if (currentTime > timer-2000) {

    float xposLR_In = map(currentTime, timer-2000, timer, -width, 0);
    float fade = map(currentTime, timer-2000, timer, 0, 255);

    noTint();
    image(img27, 0, 0);
    tint(255, fade);
    image(img28, xposLR_In, 0);
  } 
  else {
    image(img27, 0, 0);
  }
  if (currentTime > timer) {
    mode = 28;
    timer = currentTime + 8000;
  }
}

void mode28() {

  if (currentTime > timer-5000) {
    float fade = map(currentTime, timer-5000, timer, 0, 255);

    noTint();
    image(img28, 0, 0);
    tint(255, fade);
    tint(255-fade, 255);
  }
}


