
// dma fall 2010, brian phan

// variables

PImage bg;
float currX = 0.0;
float currY = 0.0;
float easing = 0.005;
float slowmouse = 0.0;
float angle;
float jitter;
float weight = 0.2;

void setup() {
  size(640, 480);
  bg = loadImage ("bg.png");
  smooth();
  rectMode(CENTER);
  frameRate(24);
  image(bg, 320, 240);
}

void draw() {
  
  // setup
  background(255);
  image(bg, 0, 0);
  
  // rotate
  jitter = 0.0025;
  angle = angle + jitter;
  float c = angle;
  
  // translation
  translate(320, 240);
  rotate(c);
  pushMatrix();
  drawarray(mouseX);
  popMatrix();
  
}

// array function
void drawarray (int xpos)
{
  
  // easing
  float targetX = mouseX;
  float targetY = mouseY;
  float dx = (targetX - currX);
  float dy = (targetY - currY);
  currX += (dx * easing);
  currY += (dy * easing);
  
  // setup
  fill(0);
  strokeWeight(weight);
  
  // rotational speed
  float jx = (targetX/120 - slowmouse);
  slowmouse += (jx * 0.001);
  
  // lines
  ellipse(-10, -30, 8, 8);
  ellipse(30, 100, 8, 8);
  line(-10, -30, 10+currX/6, 50);
  line(10+currX/6, 50, 30, 100);
  
  ellipse(30, 100, 8, 8);
  ellipse(30, -80, 8, 8);
  line(30, 100, 80-currX/6, 40);
  line(80-currX/6, 40, 10, -50);
  line(10, -50, 30, -80);
  
  ellipse(-30, -120, 8, 8);
  ellipse(-50, 60, 8, 8);
  line(-30, -120, -80, (200-currX)/8);
  line(-80, (200-currX)/8, -50, 60);
  
  ellipse(-50, -150, 8, 8);
  ellipse(-30, 70, 8, 8);
  line(-50, -150, (40-currX)/4, 0);
  line((40-currX)/4, 0, -30, 70);
  
  ellipse(-110, 0, 8, 8);
  ellipse(50, -20, 8, 8);
  line(-110, 0, 20, (200-currX)/4);
  line(20, (200-currX)/4, 50, -20);
  
  ellipse(-150, 30, 8, 8);
  ellipse(30, -40, 8, 8);
  line(-150, 30, 50, (50-currX)/4);
  line(50, (50-currX)/4, 30, -40);
  
  ellipse(-100, -50, 8, 8);
  ellipse(0, -10, 8, 8);
  line(-100, -50, -70, (100-currX)/3);
  line(-70, (100-currX)/3, 0, -10);
  
  ellipse(-150, -20, 8, 8);
  ellipse(0, 50, 8, 8);
  line(-150, -20, -70, (120-currX)/9.3);
  line(-70, (120-currX)/9.3, 0, 50);
  
  ellipse(70, -100, 8, 8);
  ellipse(-90, 50, 8, 8);
  line(70, -100, -70, (12+currX)/9.3);
  line(-70, (12+currX)/9.3, -90, 50);
  
  ellipse((300-currX)/5, -150, 8, 8);
  ellipse((250-currX)/4.5, 100, 8, 8);
  line((300-currX)/5, -150, 15, -10);
  line(15, -10, (250-currX)/4.5, 100);
  
  ellipse((500-currX)/3.4, -100, 8, 8);
  ellipse((200-currX)/2.5, 120, 8, 8);
  ellipse((10+currX)/6.5, 50, 8, 8);
  line((500-currX)/3.4, -100, -20, 50);
  line(-20, 50, (200-currX)/2.5, 120);
  line((200-currX)/2.5, 120, (10+currX)/6.5, 50);
  
  ellipse((10+currX)/14, -85, 8, 8);
  ellipse((30+currX)/6.4, 33, 8, 8);
  ellipse((120-currX)/5.1, -45, 8, 8);
  line((10+currX)/14, -85, (30+currX)/6.4, 33);
  line((30+currX)/6.4, 33, 0, 120);
  line(0, 120, (120-currX)/5.1, -45);
  
  ellipse((500+currX)/14, -120, 8, 8);
  ellipse((currX-400)/3.4, -78, 8, 8);
  ellipse((currX-300)/5.1, -45, 8, 8);
  line((500+currX)/14, -120, (currX-400)/3.4, -78);
  line((currX-400)/3.4, -78, -33, 120);
  line(-33, 120, (currX-300)/5.1, -45);
  
  ellipse((30+currX)/14, -35, 8, 8);
  ellipse((20+currX)/6.4, -110, 8, 8);
  ellipse((120-currX)/2.8, 35, 8, 8);
  line((30+currX)/14, -35, (30+currX)/6.4, -110);
  line((20+currX)/6.4, -110, 0, -30);
  line(0, -30, (120-currX)/2.8, 35);

  ellipse((currX-200)/13, -35, 8, 8);
  ellipse((currX-100)/8.4, 150, 8, 8);
  ellipse((130-currX)/2.8, 55, 8, 8);
  line((currX-200)/13, -35, (currX-100)/8.4, 150);
  line((currX-100)/8.4, 150, 30, -50);
  line(30, -50, (130-currX)/2.8, 55);
  
  ellipse((currX-600)/4, (currX-340)/12.4, 8, 8);
  ellipse((currX-200)/15.4, 130, 8, 8);
  ellipse(100, 60, 8, 8);
  line((currX-600)/4, (currX-340)/12.4, (currX-200)/15.4, 130);
  line((currX-200)/15.4, 130, 100, 60);
  
  //////////////
  
  rotate(30);
  ellipse((500-currX)/3.4, -100, 8, 8);
  ellipse((200-currX)/2.5, 120, 8, 8);
  ellipse((10+currX)/6.5, 50, 8, 8);
  line((500-currX)/3.4, -100, -20, 50);
  line(-20, 50, (200-currX)/2.5, 120);
  line((200-currX)/2.5, 120, (10+currX)/6.5, 50);
  
  ellipse((10+currX)/14, -85, 8, 8);
  ellipse((30+currX)/6.4, 33, 8, 8);
  ellipse((120-currX)/5.1, -45, 8, 8);
  line((10+currX)/14, -85, (30+currX)/6.4, 33);
  line((30+currX)/6.4, 33, 0, 120);
  line(0, 120, (120-currX)/5.1, -45);
  
  ellipse((500+currX)/14, -120, 8, 8);
  ellipse((currX-400)/3.4, -78, 8, 8);
  ellipse((currX-300)/5.1, -45, 8, 8);
  line((500+currX)/14, -120, (currX-400)/3.4, -78);
  line((currX-400)/3.4, -78, -33, 120);
  line(-33, 120, (currX-300)/5.1, -45);
  
  rotate(25);
  ellipse((30+currX)/14, -35, 8, 8);
  ellipse((20+currX)/6.4, -110, 8, 8);
  ellipse((120-currX)/2.8, 35, 8, 8);
  line((30+currX)/14, -35, (30+currX)/6.4, -110);
  line((20+currX)/6.4, -110, 0, -30);
  line(0, -30, (120-currX)/2.8, 35);

  ellipse((currX-200)/13, -35, 8, 8);
  ellipse((currX-100)/8.4, 150, 8, 8);
  ellipse((130-currX)/2.8, 55, 8, 8);
  line((currX-200)/13, -35, (currX-100)/8.4, 150);
  line((currX-100)/8.4, 150, 30, -50);
  line(30, -50, (130-currX)/2.8, 55);
  
  rotate(-15);
  ellipse((currX-600)/4, (currX-340)/12.4, 8, 8);
  ellipse((currX-200)/15.4, 130, 8, 8);
  ellipse(100, 60, 8, 8);
  line((currX-600)/4, (currX-340)/12.4, (currX-200)/15.4, 130);
  line((currX-200)/15.4, 130, 100, 60);
  
  rotate(320);
  ellipse((30+currX)/14, -35, 8, 8);
  ellipse((20+currX)/6.4, -110, 8, 8);
  ellipse((120-currX)/2.8, 35, 8, 8);
  line((30+currX)/14, -35, (30+currX)/6.4, -110);
  line((20+currX)/6.4, -110, 0, -30);
  line(0, -30, (120-currX)/2.8, 35);

  ellipse((currX-200)/13, -35, 8, 8);
  ellipse((currX-100)/28.4, 150, 8, 8);
  ellipse((130-currX)/22.8, 55, 8, 8);
  line((currX-200)/13, -35, (currX-100)/28.4, 150);
  line((currX-100)/28.4, 150, 30, -50);
  line(30, -50, (130-currX)/22.8, 55);
  
  ellipse((currX-600)/14, (currX-340)/22.4, 8, 8);
  ellipse((currX-200)/25.4, 130, 8, 8);
  ellipse(100, 60, 8, 8);
  line((currX-600)/14, (currX-340)/22.4, (currX-200)/25.4, 130);
  line((currX-200)/25.4, 130, 100, 60);
  
  rotate(90);
  ellipse((500-currX)/3.4, -100, 8, 8);
  ellipse((200-currX)/2.5, 120, 8, 8);
  ellipse((10+currX)/6.5, 50, 8, 8);
  line((500-currX)/3.4, -100, -20, 50);
  line(-20, 50, (200-currX)/2.5, 120);
  line((200-currX)/2.5, 120, (10+currX)/6.5, 50);
  
  ellipse((20+currX)/14, -85, 8, 8);
  ellipse((80+currX)/6.4, 33, 8, 8);
  ellipse((100-currX)/25.1, 95, 8, 8);
  line((20+currX)/14, -85, (80+currX)/6.4, 33);
  line((80+currX)/6.4, 33, 0, 70);
  line(0, 70, (100-currX)/25.1, 95);
  
  rotate(90);
  ellipse((300-currX)/13.4, -130, 8, 8);
  ellipse((200-currX)/12.5, 120, 8, 8);
  ellipse((30+currX)/6.5, 50, 8, 8);
  line((300-currX)/13.4, -130, -20, 50);
  line(-20, 50, (200+currX)/12.5, -120);
  line((200+currX)/12.5, -120, (30+currX)/6.5, 50);
  
  ellipse((currX-300)/34, -85, 8, 8);
  ellipse((80+currX)/26.4, -30, 8, 8);
  ellipse((130-currX)/25.1, 95, 8, 8);
  line((currX-300)/34, -85, (80+currX)/26.4, -30);
  line((80+currX)/26.4, -30, 0, -70);
  line(0, -70, (130-currX)/25.1, 95);
  
  rotate(-30);
  ellipse(-150, -90, 8, 8);
  ellipse(30, -15, 8, 8);
  line(-150, -90, 50, (120-currX)/3);
  line(50, (120-currX)/3, 30, -15);
  
  ellipse(-50, -150, 8, 8);
  ellipse(10, -80, 8, 8);
  line(-50, -150, -130, (120-currX)/14.3);
  line(-130, (120-currX)/14.3, 10, -80);
  
  ellipse(70, -100, 8, 8);
  ellipse(-90, 50, 8, 8);
  line(70, -100, -70, (12+currX)/9.3);
  line(-70, (12+currX)/9.3, -90, 50);
  
  rotate(-30);
  translate(70, 100);
  ellipse(-150, -90, 8, 8);
  ellipse(30, -15, 8, 8);
  line(-150, -90, 50, (120-currX)/3);
  line(50, (120-currX)/3, 30, -15);
  
  ellipse(-50, -150, 8, 8);
  ellipse(10, -80, 8, 8);
  line(-50, -150, -130, (120-currX)/14.3);
  line(-130, (120-currX)/14.3, 10, -80);
  
  ellipse(70, -100, 8, 8);
  ellipse(-90, 50, 8, 8);
  line(70, -100, -70, (12+currX)/9.3);
  line(-70, (12+currX)/9.3, -90, 50);
  
  /////////////////////////////////////////////
  
  rotate(180);
  ellipse((500-currX)/23.4, -100, 8, 8);
  ellipse((200-currX)/7.5, 20, 8, 8);
  ellipse((10+currX)/6.5, 70, 8, 8);
  line((500-currX)/23.4, -100, -20, 20);
  line(-20, 20, (200-currX)/7.5, 20);
  line((200-currX)/7.5, 20, (10+currX)/6.5, 70);
  
}


