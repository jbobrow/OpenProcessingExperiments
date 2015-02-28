
//Jake Coltrane
//The goal of this code was to replicate the first year 4:6 notecard composition style
//The 2 spanning black elements create the ground condition and do not change
//The 2 black figures are added and subtracted to on a modular basis
//The yellow trace elements interacts with the ground condition surrounding the figures


void setup() {
  size(400,600);
  background(200);
}

void draw() {

 for (int x=100; x<width; x+=100) {
    for (int y=50; y<height; y+=50) {
      strokeWeight (1);
      stroke(50);
      line(0, 600, 400, 0);
      line(0, 0, 400, 600);
      line(0, 0, 400, 300);
      line(0, 600, 400, 300);
      line(x, 0, x, height);
      line(0, y*4, width, y*4);
      line(0, y*6, width, y*6);
    }
  }
}

void mousePressed() {
  background(200);
  
  //tartan grid
 
  
  for (int x=25; x<width; x+=100) {
    for (int y=25; y<height; y+=50) {
      strokeWeight (.25);
      stroke(0);
      line(x, 0, x, height);
    }
  }
  
  //black paper
  
  for (int x=50; x<width; x+=100) {
    for (int y=50; y<height; y+=50) {
      noStroke();
      fill(0, random(100));
      rect(100, 200, x/3.5, y/5.5);
    }
  }
  
  //black paper 2
  
  for (int x=50; x<width; x+=200) {
    for (int y=50; y<height; y+=100) {
      noStroke();
      fill(0, random(255));
      rect(100, 400, x/1.11, y/4.5);
    }
  }
  
  //black paper 3
  
  for (int x=25; x<width; x+=100) {
    for (int y=50; y<height; y+=100) {
      noStroke();
      fill(0, random(255));
      rect(25, 40, 300, y/16);
    }
  }
  
  //black paper 4
  
  for (int x=25; x<width; x+=100) {
    for (int y=25; y<height; y+=100) {
      noStroke();
      fill(0, random(255));
      rect(25, 40, x/16, 485);
    }
  }
  
  //yellow trace 1
  
  for (float recta=100; recta<300; recta+=random(100,300)) {
    for (float rectb=100; rectb<300; rectb+=random(100,600)) {
      noStroke();
      fill(250, 250, 210, random(100));
      rect(100, 300, recta, rectb);
    }
  }
  
  //yellow trace 2
  
  for (float rectc=125; rectc<600; rectc+=random(300,600)) {
    for (float rectd=100; rectd<600; rectd+=random(100,600)) {
      noStroke();
      fill(250, 250, 210, random(100));
      rect(200, 100, rectc, rectd);
    }
  }
}

