
PImage[] pic = new PImage[6];
PShape spic5 ;
float test;

void setup() {
  size(640, 480);
  for(int i =0; i<4;i++)
  {
    pic[i]= loadImage("pic"+i+".png");
  }
  spic5= loadShape("spic5.svg");

  smooth();
  // frameRate(12);
  background(0);
  // noLoop();
}

void draw() {

  if(mousePressed) {
    //background(0);
    test = map(mouseX, 0, width, 0, 5.5);
    println(mouseX + ":"+ test);
    fill(0, 5);
    rect(0, 0, width, height);

    fill(255);

    float x = random(-100, 740);
    float y = random(-100, 580);
    float s = random(10, 100);
    
     float sx = random(-100, 740);
    float sy = random(-100, 580);
    float sz = random(100, 400);

    float z = random(10, 300);

    if(test>0 && test <1.5) {
      tint(255, 100);
      image(pic[0], x,y,s,s);
    }

    if(test>1 && test <2.5) {
      tint(255, 255);
      image(pic[1], x,y,z,z);
    }

    if(test>2 && test <3.5) {
      tint(255, 255);
      image(pic[2], x,y,z,z);
    }

    if(test>3 && test <4.5) {
      tint(255, 255);
      image(pic[3], x,y,z,z);
    }
    
    if(test>4 && test <5.5) {
      tint(255, 255);
      shape(spic5, sx,sy,sz,sz+200);
    }
    
  }
}


