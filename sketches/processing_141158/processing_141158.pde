
/*Short but good sex scene*/

float a=0;
float b=0;
float angle;
float radius = 100;
float frequency = 3;
float r=0;


void setup() {
  size(300, 600);
  background(0);
}

void draw() {

  a = 75 + sin(radians(angle))*(radius);
  angle -=frequency;
  background(0);

  //BACK TRIANGLES//////////
  for (float i = 0; i<width; i+=10) {
    b=i;
    fill(255, 255, 255, 70);
    triangle(b, height, width/2, a+100, b+5, height);
    triangle(b, height, width/2, a+200, b+5, height);
    triangle(b, height, width/2, a+300, b+5, height);
    fill(255, 255, 255, 25);
    triangle(b, 0, width/2, a+100, b+5, 0);
    triangle(b, 0, width/2, a+150, b+5, 0);
    triangle(b, 0, width/2, a+300, b+5, 0);
  }

  //FRONT TRIANGLE//////////
  triangle(b, height, width/2, a+300, b+5, height);
  fill(250, 0, 0, 50);
  triangle(0, height, width/2, a/2, width, height);
  triangle(0, height, width/2, -a, width, height);
  a--;

  //CIRCLE//////////
  b = sin(radius);
  noStroke();
  fill(0, 255, 200, a/2);
  ellipse(width/2, b+80, r*1.5, r*1.5);
    ellipse(width/2, b+80, a/4, a/4);
//  fill(0, 255, 0, r);
//  ellipse(width/2, b+a, r, r);
  fill(255, 255, 255);
  ellipse(width/2, a, 5, 5);



  angle -= frequency;
  r+=b;

  //TEMPTO/////

  if (frameCount <200) {
    println("TEMPO");
  }


  //BUILDING////
  else if (frameCount <300) {
    frequency+=.01;
    radius+=2; 
    println("Building 1");
  }
  else if (frameCount <400) {
    frequency-=.01;
    radius--;
    println("Building 2");
  }
  else if (frameCount <600) {
    frequency+=.01;
    radius++;
    println("Building 3");
  }

  //CLIMAX/////
  else if (frameCount <1100) {
    frequency+=.025;
    radius--;
    print(frameCount);
    println("CLIMAX1");
  }

  //CLIMAX/////
  else if (frameCount <1200) {
    fill(255, 255, 255, a);
    rectMode(CENTER);
    ellipse(width/2, height/2, a*4, a*4);
    println("CLIMAX2");
  }

  //FADE//////
  else if (frameCount <1300) {
    frequency=100;
    radius=10;
    println("FADE 1");
  }
  else if (frameCount <1700) {
    frequency=1;
    radius=1;
    println("FADE 2");
  }

  else if (frameCount >1800) {
    exit();
  }
}

