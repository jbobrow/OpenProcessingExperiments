
PFont mono;
PImage img;
int r = int(random(0,12));
int s, m, h;
int lastSecond = 0;

void setup()
{
  size(640,480);
  mono = loadFont("RosewoodStd-Regular-48.vlw");

  img = loadImage("clownbomb.jpg");
  if(r<6)
  {
    image(img,0,400,560,80);
    image(img,560,0,80,400);
  
    tint(127,255,12);
    image(img,0,0,560,400);
   
    tint(154,50,205);
    image(img,560,400,80,80);
    line(0,400,640,400);
    line(560,0,560,480);
  }
  else if(r>6)
  {
    background(200,0,0);
    translate(-100,0);
    rotate(degrees(85));
    image(img,0,0,100,100);
  }
  else if(r==6)
  {
    background(0);
    smooth();
  }
  else
  {
  }
}

void draw()
{
  if(r <6)
  {
    /*pushMatrix();
    strokeCap(PROJECT);
    strokeWeight(20);
    line(
    line(560,100,400,220);
    popMatrix();*/
    fill(random(0,255),random(0,255),255,random(50,100));
    textFont(mono);
    textSize(random(0,75));
    text("clownbomb", random(-700,700), random(-500,500));
    float sec=millis()/1000.0;
    if (sec>10.0)
    {
      noLoop();
    }
  }
  else if(r>6)
  {
    pushMatrix();
    translate(width/2,height/2);
    rotate(PI/6);
    image(img,0,0,width,height);
    popMatrix();
        ellipse(200,200,200,200);
    float y=constrain(mouseY,0,480);
    stroke(200);
    line(0,y,480,y);
    textSize(300);
    translate(500,200);
    fill(200);
    rotate(PI/2);
    text("R",100,100);
  }
  else if (r==6)
  {
    s = second();
    m = minute();
    h = hour()%12;

    float mappedH = map(h, 0,12,0,255);
    float mappedM = map(m, 0,60,0,255);
    float mappedS = map(s, 0,60,0,255);


    rectMode(CENTER);
    translate(width/2,height/2); 
    scale(mappedH*.07);
    rotate(radians(10*mappedM));
    stroke(150,0,150);
    fill(mappedS);
    rect(0,0,20,20);
  }
  else
  {
  }
}

void keyPressed()
{
  loop();
}

