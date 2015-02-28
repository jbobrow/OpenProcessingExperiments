
//Tian Jason Tian
//Assignment 2: Animals

void setup() {

  size(900,900);
  background(100);
  strokeWeight(2);
  stroke(0);
  smooth();
  fill(13,113,42);
  rect(10,10,880,5);
  rect(10,885,880,5);
  rect(10,10,5,880);
  rect(885,10,5,880);
  beginShape();
  for(int i=0;i<350;i++)
  {
    curveVertex((3*i/4)*sin(i/5.0),(3*i/4)*cos(i/5.0));
  }
  endShape(); 
  translate(900,900);
  beginShape();
  for(int i=0;i<350;i++)
  {
    curveVertex((3*i/4)*sin(i/5.0),(3*i/4)*cos(i/5.0));
  }
  endShape(); 
  noLoop();
}

void draw() {
  translate(-100,-100);
  scale(1.2,1.2);
  //fill color block for the body
  int i = floor(255*mouseX/900);
  int j = floor(150*mouseY/900);
  int r = floor(random(2)*i);
  int g = floor(random(2)*i);
  int b = floor(random(2)*i);
  int o = floor(random(2)*j);
  fill(r, g, b, o);

  int x_top = 350;
  int y_top = 300;
  int x_bot = 550;
  int y_bot = 600;
  int tail_x_t = 570;
  int tail_y_t = 370;
  int tail_x_b = 330;
  int tail_y_b = 530;

  //top Chameleon
  fill(r, g, b, o);
  triangle(x_top-150,y_top,x_top,y_top,x_top,y_top-100);
  triangle(x_top-100,y_top+50,x_top,y_top,x_top,y_top-20);

  beginShape();
  vertex(x_top,y_top);
  bezierVertex(x_top-20,y_top+35,x_top-40,y_top+40,x_top-100,y_top+50);
  endShape();

  arc(x_top,y_top,300,200,PI,TWO_PI-PI/2);
  ellipse(x_top,y_top,50,50);

  triangle(x_top,y_top,x_top+300,y_top,x_top+150,y_top-130);
  arc(x_top+150,y_top,300,260,PI,TWO_PI-PI/2);
  arc(x_top+150,y_top,300,260,TWO_PI-PI/2,TWO_PI);

  triangle(x_top+50,y_top,x_top+90,y_top,x_top+70,y_top+25);
  triangle(x_top+180,y_top,x_top+220,y_top,x_top+200,y_top+25);
  ellipse(x_top+300,y_top,50,50);

  beginShape();
  vertex(x_top+300,y_top);
  bezierVertex(tail_x_t+200,tail_y_t-50,tail_x_t,tail_y_t+50,tail_x_t,tail_y_t);
  endShape();

  for(int e=0;e<6;e++) {
    ellipse(tail_x_t,tail_y_t,130-20*e,130-20*e);
  }

  //bottom Chameleon
  fill(255-r,255-g,255-b,o);
  triangle(x_bot+150,y_bot,x_bot,y_bot,x_bot,y_bot+100);
  triangle(x_bot+100,y_bot-50,x_bot,y_bot,x_bot,y_bot+20);

  beginShape();
  vertex(x_bot,y_bot);
  bezierVertex(x_bot+20,y_bot-35,x_bot+40,y_bot-40,x_bot+100,y_bot-50);
  endShape();

  arc(x_bot,y_bot,300,200,0,PI/2);
  ellipse(x_bot,y_bot,50,50);

  triangle(x_bot,y_bot,x_bot-300,y_bot,x_bot-150,y_bot+130);
  arc(x_bot-150,y_bot,300,260,0,PI/2);
  arc(x_bot-150,y_bot,300,260,PI/2,PI);

  ellipse(x_bot-300,y_bot,50,50);
  triangle(x_bot-50,y_bot,x_bot-90,y_bot,x_bot-70,y_bot-25);
  triangle(x_bot-180,y_bot,x_bot-220,y_bot,x_bot-200,y_bot-25);

  beginShape();
  vertex(x_bot-300,y_bot);
  bezierVertex(tail_x_b-200,tail_y_b+50,tail_x_b,tail_y_b-50,tail_x_b,tail_y_b);
  endShape();

  for(int e=0;e<6;e++) {
    ellipse(tail_x_b,tail_y_b,130-20*e,130-20*e);
  }

  //eyeballs
  fill(255);
  ellipse(x_top-50,y_top-60,40,56);
  ellipse(x_bot+50,y_bot+60,40,56);

  fill(0);
  int eye_x_t = x_top-50 + floor(14*(mouseX-450)/450);
  int eye_y_t = y_top-60 + floor(21*(mouseY-450)/450);
  int eye_x_b = x_bot+50 + floor(14*(mouseX-450)/450);
  int eye_y_b = y_bot+60 + floor(21*(mouseY-450)/450);
  ellipse(eye_x_t,eye_y_t,10,10);
  ellipse(eye_x_b,eye_y_b,10,10);
}

void mouseMoved() {
  redraw();
}


