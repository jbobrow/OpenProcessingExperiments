
void drawFirst() { 
  if (audio.position() <= 33000) { 
    background(freq*random(10), freq*random(3), freq*random(10));

    pushMatrix(); 
    translate(50, 20); 
    for (int i = 1; i< 200; i+=4) {
      stroke(255);
      rotate(HALF_PI % 7.7);
      strokeWeight(.7);
      line(width*20, height*.7, i*freq/7, i*3);
      strokeWeight(random(4));
      fill(255, random(150), random(150, 255));
      rect(random(width), random(height), freq/2.2, freq+10);
    }
    popMatrix();
  }
}

void drawSecond() {

  vol = lerp(vol, audio.mix.level(), smoothing);
  freq = audio.left.get(10)*500;

  if (audio.position() > 33406) { 
    for (float i = random(width/7); i <= width/7; i += 50) {
      fill(random(255, 150));
      ellipse(random(150), i+100, freq, freq);
      line(random(200), 120, freq, freq);
      ellipse(150, i, freq, freq);
      line(i+300, i-50, freq+20, freq+20);
    }
    stroke(237, 222, 48);
    strokeWeight(1); 
    line(vol*500, 100+vol*300, 150-vol*500, 100+vol*300);
    line(100+vol*400, 70+vol*200, 150-vol*400, 50+vol*300);
    noFill();
    rect(230, 120, vol*500, vol*500);
    rect(230, 120, vol*300, vol*300);
    rect(230, 120, vol*100, vol*100);
  }
}

void drawThird() {

  if (audio.position() > 94800) {
    //set flicker effect
    background (freq*random(256), freq*random(256), freq*random(255));
    noFill();
    smooth();
    stroke(237, 222, 48);
    strokeWeight(4);
    ellipse(width/2, height/2, freq, freq);
    strokeWeight(2.5);
    ellipse(width/4, height/3.5, freq*1.7, freq*1.7);
    rect(random(300, 400), random(100), freq, freq);
    noStroke();
    fill(freq*random(256), freq*random(256), freq*random(255));
    ellipse(width/2.5, height/2.5, freq, freq);

    for (float i =2; i< 100; i+=7) {
      stroke(237, 222, 48);
      strokeWeight(.7);
      line(width*.65, height*.7, i*freq/7, i*3);
    }
  }
}


