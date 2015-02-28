
int starsize = 20;
int testmod = 0;
int heatwave = 64;
Stars[] starysky;

void starset() {
  if (yourlevel+testmod >= ceil(2*float(final_level)/3)) {
    MyRandom();
    starysky = new Stars[ceil(random(100*platforms.length))];
    for (int i=0; i<starysky.length; i++) {
      starysky[i] = new Stars(platforms[platforms.length-1].cx+platforms[platforms.length-1].cw/2);
    }
  }
}

void drawBackground() {
  int b = ceil(255*(1-(float(yourlevel+testmod)-1)/final_level));
  int rg = floor(.7*float(b));
  background(rg,rg,b);
  //Sun
  if (yourlevel+testmod <= ceil(.7*float(final_level))) {
    pushMatrix();
      int sundelx = floor(2*myCreature.xspeed*.9);
      int sundely;
      float sunsize = (1-(float(yourlevel+testmod)/(final_level*4)));
      if (myCreature.creY < 1.5*height) {
        sundely = myCreature.creY;
      }
      else {
        sundely = floor(1.5*height);
      }
      if (yourlevel+testmod < ceil(.4*float(final_level))) {
        //Midday
        sundely += ceil((3*(float(yourlevel+testmod)-1)/float(final_level))*(height/2));
        stroke(255,255,0,255);
        fill(255,255,0,255);
      }
      else {
        //Evening
        sundely += 3*height/4;
        stroke(255,b,0,255);
        fill(255,b,0,255);
      }
      translate(myCreature.creX+(width/2+sundelx),sundely-(height/2));
      scale(sunsize);
      ellipse(0,0,height,height);
      for (float i=1; i<=heatwave; i++) {
        pushMatrix();
          rotate(2*PI*i/heatwave);
          strokeWeight(2);
          line(0,floor(.6*height),0,.9*height);
          strokeWeight(1);
        popMatrix();
      }
      
    popMatrix();
  }
  //Stars
  else {
    for (int i=0; i<starysky.length; i++) {
      starysky[i].starcheck();
    }
  }
}

class Stars {
  int localx;
  int localy;
  int localsize;
  Stars(int stagelength) {
    MyRandom();
    localx = ceil(random(stagelength));
    localy = -6*height+ceil(random(8*height));
    localsize = floor(random(starsize));
  }
  void starcheck() {
    if (localx >= ScreenXPos()-(width/2+starsize+abs(2*myCreature.xspeed)) && localx <= ScreenXPos()+(width/2+starsize+abs(2*myCreature.xspeed))) {
      stardraw();
    }
  }
  void stardraw() {
    pushMatrix();
      translate(localx,localy);
      rotate(PI/4);
      noStroke();
      fill(255,255);
      rect(0,0,localsize,localsize);
    popMatrix();
  }
}

