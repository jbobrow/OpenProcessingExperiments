
//Homework 3
//Sun Park; sunkyunp
//Copyright Sun Park, Sept 2012

float x, y, wd, ht;

void setup()
{
  size(400, 400);
  x=100;
  y=100;
  wd=50;
  ht=50;
  textSize(5);
}

void draw()
{
  //snow
  background(5, 5, 5);
  smooth();

  fill(234, 54, 54);
  noStroke();
  ellipse(x/2, frameCount%height, wd/2, ht/2);
  y=y-1;
  fill(240, 140, 14);
  noStroke();
  ellipse(x, frameCount%height*1.5, wd/4, ht/4);
  y=y-20;
  fill(231, 240, 12);
  noStroke();
  ellipse(x/1.5, frameCount%height*2, wd/8, ht/8);
  y=y-3;
  fill(140, 240, 12);
  noStroke();
  ellipse(x*2, frameCount%height*1.8, wd*0.6, ht*0.6);
  y=y+6;
  fill(23, 142, 17);
  noStroke();
  ellipse(x*3, frameCount%height*1.2, wd*0.8, ht*0.8);
  y=y-10;
  fill(120, 242, 177);
  noStroke();
  ellipse(x*1.5, frameCount%height*1.2, wd*0.4, ht*0.4);
  y=y-5;
  fill(120, 242, 227);
  noStroke();
  ellipse(x*1.2, frameCount%height*1.3, wd*0.5, ht*0.5);
  y=y-2;
  fill(120, 188, 242);
  noStroke();
  ellipse(x*3.8, frameCount%height*1.4, wd*0.2, ht*0.2);
  y=y-15;
  fill(46, 69, 191);
  noStroke();
  ellipse(x*3.2, frameCount%height*1.6, wd*0.3, ht*0.3);
  y=y-4;
  fill(107, 44, 245);
  noStroke();
  ellipse(x*4.6, frameCount%height*1.5, wd*0.25, ht*0.25);
  y=y-2;
  fill(201, 106, 250);
  noStroke();
  ellipse(x*4.5, frameCount%height*0.9, wd*0.37, ht*0.37);
  y=y-6;
  fill(240, 148, 231);
  noStroke();
  ellipse(x*3.7, frameCount%height*0.8, wd*0.28, ht*0.28);
  y=y-6.5;
  fill(247, 35, 163);
  noStroke();
  ellipse(x*3.3, frameCount%height*0.6, wd*0.48, ht*0.48);
  y=y-2.8;
  fill(173, 26, 56);
  noStroke();
  ellipse(x*3.2, frameCount%height*0.7, wd*0.69, ht*0.69);
  y=y-4.8;
  fill(118, 6, 29);
  noStroke();
  ellipse(x*3.7, frameCount%height*0.4, wd*0.39, ht*0.39);
  y=y-5.2;
  fill(240, 191, 189);
  noStroke();
  ellipse(x*3.1, frameCount%height*0.3, wd*0.28, ht*0.28);
  y=y-4.7;
  fill(250, 183, 76);
  noStroke();
  ellipse(x*2.2, frameCount%height*0.4, wd*0.58, ht*0.58);
  y=y-2.7;
  fill(7, 140, 245);
  noStroke();
  ellipse(x*2.3, frameCount%height*0.6, wd*0.34, ht*0.34);
  y=y-4.4;
  fill(9, 82, 12);
  noStroke();
  ellipse(x*2.4, frameCount%height*0.5, wd*0.25, ht*0.25);
  y=y-1.4;
  fill(237, 240, 126);
  noStroke();
  ellipse(x*3.5, frameCount%height*0.8, wd*0.47, ht*0.47);
  y=y-1.3;
  fill(240, 186, 77);
  noStroke();

  ellipse(x*21.5, frameCount%height*0.75, wd*0.42, ht*0.42);
  y=y-1.1;
  fill(random(255), random(255), random(255));
  noStroke();

  loop();

  //ground
  ellipse(mouseX, mouseY, pmouseX/4, pmouseY/4);

  //mouse
  ellipse(mouseX, mouseY, wd, ht);
  
  stroke(155);
  line(pmouseX, pmouseY, wd/2, ht/2);
  
}






//frameCount



