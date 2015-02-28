
 import processing.opengl.*;
 
float diam = 0;
color brown = #DE2F81;
color blu = #A4E6FA;
color aqua = #A4FAD1;
float var = 5;
 
 
 
void setup(){
  size(400,600);
  smooth();
  noStroke();
  fill(brown);
  frameRate(12);
}
 
//azules
 
void draw(){
  background (blu);
  for (int y = 10; y < 200; y+=40){
    for (int x = 10; x < 600; x+=40){
      rotate(radians(var));
      diam = random (2, 300);
      fill (random(200,255), 255, 255,80);
      stroke(255,80);
      strokeWeight(3);
      ellipse (x, y, diam+3 , diam+3);
      noStroke();
      fill(255,80);
      ellipse (x+(diam/8), y-(diam/6), diam/6, diam/6);
      fill(255,110);
      ellipse (x-(diam/8), y+(diam/3), diam/3, diam/3);
      diam +=2;
    }
 
  }
 
  //magenta
 
  for (int y = 10; y < 600; y+=20){
    for (int x = 10; x < 600; x+=20){
      rotate (radians(var));
      diam = random (10, 30);
      fill (random(200,256), 15, 129,250);
      stroke(255,80);
      strokeWeight(3);
      ellipse (x, y+(random(4)), diam , diam);
      noStroke();
      fill(255);
      ellipse (x+(diam/8), y-(diam/6), 2, 2);
      fill(255,110);
      ellipse (x-(diam/8), y+(diam/3), diam/3, diam/3);
      fill (240);
      diam +=2;
    }
  }
 
  var-=0.005;
  if (var < 3) {
    var=6;
  }
  println(var);
 
  //filter(BLUR,1);
}


