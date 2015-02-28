
//IN-CLASS CHALLENGE EXERCISE
    //VISUAL CLOCK

//UCLA Design|Media Arts Interactivity 28
//by Stephen Ou

int s, m, h, h1, hf;
float angle;
PFont font;
boolean prevention = true;
PImage hour_layer, minute_layer, hour_dot, minute_dot;

void setup()
{
  size(300,600);
  colorMode(HSB, 360, 100, 100);
  noStroke();
  rectMode(CENTER);
  ellipseMode(CENTER);
  textAlign(CENTER);
  imageMode(CENTER);
  background(360);
  smooth();
  font = loadFont("AtomicClockRadio-23.vlw");
  textFont(font);
  hour_layer = loadImage("hour_layer.png");
  minute_layer = loadImage("minute_layer.png");
  hour_dot = loadImage("hour_dot.png");
  minute_dot = loadImage("minute_dot.png");
}

void draw()
{
  s = second();
  m = minute(); 
  h = hour();
  h1 = hour()%12;
  hf = hour()%12;
  
  if(h1 == 0 && h == 0)
  {hf = 12;}  
  if(h1 == 0 && h == 12)
  {hf = 12;}
  
  if(h>16 || h<6)
  {background(0);}
  else
  {background(360);}

  float mappedH = map(hf, 0,12, 0,360);
  float mappedH2 = map(h, 0,24, 0, 360);  //Changed to 24 hr scale to add color variety between each hour of the day
  float mappedM = map(m, 0,60, 0,360);
  float mappedS = map(s, 0,60, 0,360);
  
  pushMatrix();
  fill(mappedH2, 100, 100);
  translate(width/2,height/2-160);
  ellipse(0,0, 200,200);
  popMatrix();
  
  if(mousePressed == true && prevention == true)
  {
    pushMatrix();
    translate(width/2,height/2-160);
    image(hour_layer, 0,0);
    popMatrix();
    
    pushMatrix();
    translate(width/2,height/2-160);
    rotate(radians(mappedH));
    image(hour_dot, 0,0);
    popMatrix();  
  }

  pushMatrix();
  fill(mappedM, 100, 100);
  translate(width/2,height/2-30);
  scale(1.15);
  rotate(radians(mappedM+45));
  rect(0,0, 100,100);
  popMatrix();
  
  if(mousePressed == true && prevention == true)
  {
    pushMatrix();
    translate(width/2,height/2-30);
    image(minute_layer, 0,0);
    popMatrix();
    
    pushMatrix();
    translate(width/2,height/2-30);
    rotate(radians(mappedM));
    image(minute_dot, 0,0);
    popMatrix();
  }

  pushMatrix();
  fill(mappedS, 100, 100);
  translate(width/2,height/2+50);
  rotate(radians(mappedS));
  scale(0.5);
  triangle(0, -103.47, 89.56,51.86, -89.81, 51.86);
  popMatrix();
  
  if(mousePressed == true && prevention == true)
  {
    pushMatrix();
    translate(width/2,height/2+50);
    scale(0.65);
    image(minute_layer, 0,0);
    popMatrix();
    
    pushMatrix();
    translate(width/2,height/2+50);
    rotate(radians(mappedS));
    scale(0.65);
    image(minute_dot, 0,0);
    popMatrix();
  }
  
  if(hf<10) 
  {
    fill(mappedH2, 100, 100);
    textAlign(CENTER); 
    text(("0" + hf), width/2-45, height/2+210);
  }
  else
  {
    fill(mappedH2, 100, 100);
    text((hf), width/2-45, height/2+210);
  }

  if(m<10)
  {
    fill(mappedM, 100, 100);
    text(("0" + m), width/2+2.5, height/2+210);
  }
  else
  {
    fill(mappedM, 100, 100);
    text((m), width/2, height/2+210);
  }
  
  if(s<10)
  {
  fill(mappedS, 100, 100); 
  text(("0"+s), width/2+46, height/2+210);
  }
  else
  {
  fill(mappedS, 100, 100);
  text((s), width/2+46, height/2+210); 
  }
  
  if(s%2 == 0)
  {
  fill(mappedS, 100, 100);
  text((":"), width/2+22, height/2+210);
  
  fill(mappedM, 100, 100);
  text((":"), width/2-24, height/2+210);
  }
}

void mousePressed()
{prevention = true;}

void mouseReleased()
{prevention = false;}


