
import ddf.minim.*;
float colour1 = 232;
float colour2 = 149;
float colour3 = 62;
float dist1 = 100;
float xpos = 0;
float ypos = 0;
float csize1 = 50;
float csize2 = 50;
/////// Area 1
int active2 = 0;
int active1 = 0;
float offset = +25;

float[] colour = {
  128, 87, 91, 100, 210, 199, 232, 237, 255, 186, 161,199,186,161
};
float[] xc1 = {
  100, 100, 100, 100, 600, 600, 600, 600
};

float[] yc1 = {
  80, 160, 240, 320, 80, 160, 240, 320
};



//float xc2 = 150;
//float yc2 = 200;
AudioPlayer ac2_clap;
AudioPlayer ac1_clap;
//////

Minim m;
AudioPlayer clap1;

int clicked = 0;

void setup() {
  size(700, 400);
  background(58, 92, 75);
  m = new Minim(this);
  clap1 = m.loadFile("808-clap.wav");
  ac1_clap = m.loadFile("808-clap.wav");
  ac2_clap = m.loadFile("808-clap.wav");
}

void draw() {
  background(0);
  smooth();

  ////Area 1
  noStroke();
  fill(colour[5], colour[9], colour[10]);

  //Take the MODULO
  float temp1 = (active1 % offset);
  float temp2 = (active2 % offset);

  for (int i =0; i <8; i++) {
    if (i < 4) {
      ellipse(xc1[i]-42+temp1, yc1[i], csize1, csize1);
      ellipse(xc1[i]+42-temp1, yc1[i], csize1, csize1);
    }

    else {
      fill(colour[11],colour[12],colour[13]);
      ellipse(xc1[i]-42 +temp2, yc1[i], csize2, csize2);
      ellipse(xc1[i]+42 -temp2, yc1[i], csize2, csize2);
    }
  }
  //ellipse(xc1+temp, yc1, 50, 5t0);
  //ellipse(xc2-temp, yc2, 50, 50);

  if (active1 > 0) {
    active1 = active1 - 2;
    println(active1 + " TEMP: " + temp1);
  }
  if (active2 > 0) {
    active2 = active2 - 2;
  }

  if (ac1_clap.isPlaying() == true) {
    colour[5] = 255;
    colour[9] = 63;
    colour[10] = 15;
    csize1 = 60;
  }
  else {
    colour[5] = 199;
    colour[9] = 186;
    colour[10] = 161;
    csize1 = 50;
  }

  if (temp1 == 1.0) {
    if (ac1_clap.isPlaying() == false) {
      ac1_clap.loop(0);
    }
  }
  if (ac2_clap.isPlaying() == true) {
    colour[11] = 255;
    colour[12] = 63;
    colour[13] = 15;
    csize2 = 60;
  }
  else {
    colour[11] = 199;
    colour[12] = 186;
    colour[13] = 161;
    csize2 = 50;
  }

  if (temp2 == 1.0) {
    if (ac2_clap.isPlaying() == false) {
      ac2_clap.loop(0);
    }
  }
  ////


  fill(colour[8], colour[4], colour[0],220);
  ellipse(mouseX + dist1, mouseY, 70, 70);
  ellipse(mouseX - dist1, mouseY, 70, 70);

  fill(colour[8]);
  //ellipse(random(150, 550), random(100, 300), 30, 30);
  //ellipse(random(150, 550), random(100, 300), 30, 30);
  //ellipse(180,330,50,50);

  //ellipse(xpos,ypos,35,35);
  //xpos = xpos + 1;
  //ypos = ypos + 1;


  if (clicked > 0) {
    if (clap1.isPlaying() == false) {
      clap1.loop(0);
    }
    colour[4] = 63 ;
    colour[0] = 15;
    dist1 = 35;

    clicked = clicked - 1;
  } 
  else {
    dist1 = 100;
    colour[8] = 255;
    colour[4] = 210;
    colour[0] = 128;
  }
}

void mousePressed() {
  if (clicked == 0) {
    clicked = 9;
    //if(dist(mouseX, mouseY, (xc2 - xc1)/2 + xc1, yc1) < 200){
    //  active1 = active1 +50;
    //}
    if (mouseX < 200) {
      active1 = active1 + 50;
      
    }
    else if (mouseX > 500) {
      active2 = active2 + 50;
    }
  }
}


