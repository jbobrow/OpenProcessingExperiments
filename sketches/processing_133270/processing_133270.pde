
//by Devon McNerney

Cloud cloud1, cloud2, cloud3;
int ref;

void setup() {
  size(500, 500);
  frameRate(30);
  cloud1=new Cloud(-50, 1.5);
  cloud2=new Cloud(-150, 1.4);
  cloud3=new Cloud(-250, 1.3);
  
}

void draw() {
  
  //Sky
  background(#C6D5F2);
  fill(0, 0, 0, transparency);
  
  sun();
  
  //Clouds
  cloud1.display();
  cloud1.move();
  cloud2.display();
  cloud2.move();
  cloud3.display();
  cloud3.move();
  
  //Night
  fill(0, 0, 0, transparency*.75);
  rect(0, 0, width, height);
  
  if (transparency>100) {
  
  //grass
  noStroke();
  fill(#2B6C0F);
  rect(0, 450, 500, 500);
  
  //house
  noStroke();
  fill(#C90822);
  rect(60, 250, 200, 200);
  
  //siding
  noStroke();
  fill(#B2172C);
  rect(30, 250, 30, 200);
  
  //roof
  noStroke();
  fill(#48161D);
  triangle(10, 250, 280, 250, 150, 75);
  
  //doors
  //left
  fill(#B2172C);
  stroke(250);
  strokeWeight(4);
  rect(110, 371, 50, 75);
  //right
  rect(160, 371, 50, 75);
  
  //windows
  //left
  fill(0);
  stroke(250);
  strokeWeight(4);
  rect(70, 310, 40, 40);
  //right
  rect(210, 310, 40, 40);
  
  //clock
  fill(250);
  stroke(0);
  strokeWeight(3);
  ellipse(160, 280, 40, 40);
  line(160, 280, 170, 285);
  line(160, 280, 160, 265);
  
  //Tree
  //Green
  fill(#0C3E21);
  noStroke();
  triangle(460, 420, 410, 270, 350, 420);
  //Trunk
  fill(#A56511);
  rect(395, 420, 25, 60);
 }
}

class Cloud {
  float cloudX, cloudY, r;
  Cloud (float moveCloud, float rate) {
    println(r);
    cloudY=150;
    r=rate;
    cloudX=moveCloud;
  }
  void display() {
    noStroke();
    fill(255, 255, 255, 200);
    ellipse(cloudX, cloudY, 200, 60);
  }
  void move() {
    cloudX+=r;
    if (cloudX>width+100) {
      cloudX=-100;
      cloudY=random(20, 200);
    }
    if (cloudX<0-100)
      cloudY=random(20, 200);
  }
}

//Sun Axis
int sunRadius = 75; //size of sun
int xStart = -sunRadius; //initial x
int yStart = 20; //initial y
float xSun = xStart;
float ySun = yStart;

float t = 0;
float duration = 60 * 1000;
float conversionFactor = 2 * 3.14 / duration;
float transparency;

void sun()
{
  //Sun
  noStroke();
  fill( 247+50, 199+50, 114+50);
  ellipse(xSun, ySun, sunRadius, sunRadius);
  
  t += 0.01;
  t= millis() * conversionFactor;
  
  //parametric form
  float Rx = width/2 + sunRadius/2;
  float Ry = height/2 - sunRadius/2;
  float centerX = width/2;
  float centerY = height/2;
  xSun = cos(t) * Rx + centerX;
  ySun = sin(t) * Rx + centerY;
  
  transparency=map(ySun, 200, height, 0, 255);
   for (int starX=0; starX > width; starX += random(10)) {
    for (int starY=0; starY > height; starY += random(10)) {
      stroke(255, 255, 255, -1*transparency);
      fill(255, 255, 255, -1*transparency);
      noSmooth();
      point(starX, starY);
    }
  }
}



