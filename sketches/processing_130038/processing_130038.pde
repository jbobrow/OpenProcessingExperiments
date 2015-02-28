
float rad= 0.0;
float timer= 0.0;
float x= 0.0;
float theScale= 0.0;
float y= 0.0;
float Speed= .01;

void setup()
{
 size(500,500); 
 frameRate(30);
}

void draw()
{
  x= x + 1.0;
  y= y + 3.0;
  timer= timer+ (1.0/30.0);
  rad= rad+ .1;
  colorMode(RGB);
  strokeWeight(1);
  pushMatrix();
  fill(random(225),0,random(225));
  translate(250,250);
  rotate(rad);
  rectMode(CENTER);
  rect(0,0,100,100);
  popMatrix();
  if (timer >= 1.0 && timer <= 10)
  {
    float timerScaler= 20.0;
    colorMode(HSB,360,100,100);
    pushMatrix();
    translate(0,100);
    fill(timer*timerScaler,100,100,255);
    rect(x,0,50,50);
    rect(x,350,50,50);
    rect(x,175,50,50);
    colorMode(RGB);
    fill(0,random(255),random(255));
    ellipse(50,y,100,450);
    ellipse(200,y,100,450);
    ellipse(350,y,100,450);
    ellipse(500,y,100,450);
    fill(random(255),0,random(255));
    ellipse(100,y,100,450);
    ellipse(250,y,100,450);
    ellipse(400,y,100,450);
    fill(random(255),random(255),0);
    ellipse(0,y,100,450);
    ellipse(150,y,100,450);
    ellipse(300,y,100,450);
    ellipse(450,y,100,450);
    popMatrix();
  }
  if (timer >= 12 && timer <= 13)
  {
    background(255,0,0);
  }
  else if (timer >= 14 && timer<= 20)
  {
    strokeWeight(random(10));
    stroke(random(225),random(225),random(255));
    line(0,random(500),500,random(500));
  }
  if (timer >= 22 && timer <= 23)
  {
    background(0,0,255);
  }
  if (timer >= 24 && timer <=29)
    {
      theScale= theScale + Speed;
    }
    else if (timer >= 30 && timer <= 35)
    {
      theScale= theScale - Speed;
    }
   pushMatrix();
   scale(theScale);
   fill(255,255,0);
   translate(150,250);
   ellipse(0,0,245,178);
   fill(0,255,150);
   translate(500,300);
   ellipse(500,300,150,100);
   popMatrix();
}


