
float numBots = 5;
float spacer;
float legs, arms, arms2;
float head;
float antenna;
float smile;


void setup()
{
  size(800, 400);
  smooth(); 
  strokeCap(SQUARE);
  noLoop();
  colorMode(RGB);
  spacer = width / numBots; 
}


void draw()
{
  background(255);
  for (float i=1; i<numBots; i++)
  
  {
    arms = random(-40, 60);
    arms2 = random(-100, 50);
    legs = random(5, 120);
    head = random(70, 77);
    antenna = random(5,10);
    smile = random(10, 45);
    
    float rs = random(70, 100);
    float rh = random(200);
    float rh2 = random(100);
    float rh3 = random(100);
    float rsw = random(0.1, 6);
    botsneck(i*spacer, height/2, rs, color (rh/2, rh2, rh3), rsw);
    botshead(i*spacer, height/2, rs, color (rh, rh2, rh3), rsw);
    botsarms(i*spacer, height/2, rs, color (0), rsw);
    botslegs(i*spacer, height/2, rs, color (0), rsw);
    botsbody(i*spacer, height/2, rs, color (rh, rh2, rh3), rsw);
    botstri(i*spacer, height/2, rs, color (rh/2, rh2, rh3), rsw);
    botsantenna(i*spacer, height/2, rs, color (255), rsw);        
    botsantenna2(i*spacer, height/2, rs, color (rh/2, rh2, rh3), rsw);
    botsface(i*spacer, height/2, rs, color (255), rsw);
  }
}

//NECK
void botsneck(float x, float y, float s, color c, float sw)
{
  fill(c);
  strokeWeight(8);

  pushMatrix();
  translate(x, y);
  
  line(0, legs, 0, -70);
  
  popMatrix();
}

//HEAD
void botshead(float x, float y, float s, color c, float sw)
{
  fill(c);
  strokeWeight(2);

  pushMatrix();
  translate(x, y);
  
  ellipse(0, -80, 70, head);
  popMatrix();
}

//ARMS
void botsarms(float x, float y, float s, color c, float sw)
{
  fill(c);
  strokeWeight(2);

  pushMatrix();
  translate(x, y);
  
  triangle(0, legs, s/2.5, legs, 60, arms);
  line(60, arms, 65, arms);
  
  triangle(0, legs, -s/2.5, legs, -60, arms);
  line(-60, arms, -65, arms);
  
  popMatrix();
}

//LEGS
void botslegs(float x, float y, float s, color c, float sw)
{
  fill(c);
  strokeWeight(2);

  pushMatrix();
  translate(x, y);
  
  triangle(0, legs, -30, legs, -40, 180);
  triangle(0, legs, 30, legs, 40, 180);
  
  popMatrix();
}

//BODY
void botsbody(float x, float y, float s, color c, float sw)
{
  fill(c);
  strokeWeight(2);

  pushMatrix();
  translate(x, y);
  
  ellipse(0, legs, s, 90);
  popMatrix();
}

//TRIANGLE
void botstri(float x, float y, float s, color c, float sw)
{
  fill(c);
  strokeWeight(2);

  pushMatrix();
  translate(x, y);
  
  triangle(0, legs-45, -s/2, legs, s/2, legs);
  
  popMatrix();
}

//ANTENNA
void botsantenna(float x, float y, float s, color c, float sw)
{
  fill(c);
  strokeWeight(1.5);

  pushMatrix();
  translate(x, y);
  
  ellipse(0, -120-antenna, 33, 6);
  ellipse(0, -125-(antenna*2), 28, 5);
  ellipse(0, -130-(antenna*3), 23, 4);
  

  popMatrix();
}

void botsantenna2(float x, float y, float s, color c, float sw)
{
  fill(c);
  strokeWeight(1.5);

  pushMatrix();
  translate(x, y);

  ellipse(0, -137-(antenna*4), 10, s/8);
  popMatrix();
}

//FACE&BUTTONS
void botsface(float x, float y, float s, color c, float sw)
{
  fill(c);
  strokeWeight(1.5);

  pushMatrix();
  translate(x, y);
  
  ellipse(-30, -90, 10, 10);
  ellipse(+30, -90, 10, 10);
  arc(0,-75, smile, smile, 0, PI);
  line(-smile/2, -75, smile/2, -75);
  
  ellipse(-20, legs+20, 10, 10);
  ellipse(0, legs+20, 10, 10);
  ellipse(20, legs+20, 10, 10);
  popMatrix();
}

void mousePressed()
{
  redraw();
}


