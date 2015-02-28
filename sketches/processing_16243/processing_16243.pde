
PFont font;
PFont bigScore;
PFont titles;

float backgroundVal = 200;

float t = 0;
float theta = 0;

float currX = random(0,800);
float currY = random(0,480);


float easing = 0.5;


boolean clicked = false;
boolean clickedOnce = false;

float highscore = 0;

void setup()
{
  size(800, 480);
  smooth();
  frameRate(60);


  font = loadFont("Gungsuh-22.vlw");
  bigScore = loadFont("ArialNarrow-BoldItalic-180.vlw");
  titles = loadFont("ArialNarrow-BoldItalic-48.vlw");


  PVector a = new PVector(0.0, 0.1);
  PVector v = new PVector(0.0, 0.0);
  PVector p = new PVector(width/2, height/2);
  player = new Ball(a,v,p);



  PVector a2 = new PVector(0.0, 0.1);
  PVector v2 = new PVector(0.0, 0.0);
  PVector p2 = new PVector(random(0,width), random(0,height));
  target = new Target(a2,v2,p2);

  PVector a3 = new PVector(0.0, 0.1);
  PVector v3 = new PVector(0.0, 0.0);
  PVector p3 = new PVector(random(0,width/4), random(0,height));
  enemy1 = new Enemy(a3,v3,p3);
}

Ball player;
Target target;
Enemy enemy1;

void draw()
{



  if (enemy1.health <= 0)
  {
    background(200);
    if(target.score > highscore)
    {
      highscore = target.score;
    }
    fill(255);
    textFont(titles);
    textAlign(CENTER);

    text("Game Over", width/2, height/2);

    textFont(font);
    text("High score: " + int(highscore), width/2, height/2 + 50);
    text("Click to play again", width/2, height/2 + 175);

    if(mousePressed && clicked)
    {

      enemy1.health = 100;
      target.score = 0;
      draw();
    }
    //noLoop();
  }



  else {

    background(backgroundVal);



    player.run();
    if(mousePressed)
    {
      clickedOnce = true;
      PVector mouse  = new PVector(mouseX, mouseY);
      PVector difference = PVector.sub(mouse, player.position);
      difference.normalize();
      float magnitude = 1.0;
      difference.mult(magnitude);
      player.accel  = difference;

      stroke(0,100);  
      strokeWeight(2);  
      line(mouseX, mouseY, player.position.x, player.position.y);

      if(player.diameter >= 5)
      {
        player.diameter-= 0.5;
      }
      clicked = false;
    }
    else
    {
      player.accel = new PVector(0,0);
      if(player.diameter < 80)
      {
        player.diameter +=1;
      }
    }


    target.run();
    PVector rand = new PVector((noise(millis()/100.0 +10 )-0.48) * 2.0, (noise(millis()/100.0 +4)-0.48) * 2.0);
    target.accel = rand;

    if(target.score > 0)
    {
      fill(0,255-t);
      textFont(bigScore);
      textAlign(CENTER);

      text("+" + (int)target.addScore, width/2,height/2 + 60);


      textFont(font);
      fill(0);
      text("score: " + (int)target.score, width - 100,22);
      text("health: " + (int)enemy1.health, width - 100,48);
    }


    enemy1.run();

    PVector test = new PVector(player.position.x - enemy1.position.x, player.position.y - enemy1.position.y);


    test.normalize();

    enemy1.accel = test;

    if(!clickedOnce || (target.score <= 0))
    {
      fill(255);
      textFont(titles);
      textAlign(CENTER);

      text("Slingshot", width/2, height/2);
    }


    t+=8;
  }
}

void mouseReleased()
{
  clicked = true;
  //clickedOnce = true;
}


class Ball
{
  PVector position;
  PVector velocity;
  PVector accel;
  float strokeWidth = 6;
  float diameter = 74 + strokeWidth;
  float maxvel;

  Ball (PVector a, PVector v, PVector p)
  {
    position = p;
    velocity = v;
    accel = a;
    maxvel = 10;
  }

  void run()
  {
    update();
    borders();
    display();
  }

  void update() 
  {
    velocity.add(accel);
    position.add(velocity);

    velocity.limit(maxvel);
  }

  void borders()
  {
    if(position.x >= width - (diameter/2))
    {
      velocity.x *= -1;
      if(position.x >= width)
      {
        position.x -= (diameter/2);
      }
    }
    if(position.x <= 0 + (diameter/2))
    {
      velocity.x *= -1;
      if(position.x <= 0)
      {
        position.x += (diameter/2);
      }
    }
    if(position.y >= height - (diameter/2))
    {
      velocity.y *= -1;
      if(position.y >= height)
      {
        position.y -= (diameter/2);
      }
    }
    if(position.y <= 0 + (diameter/2))
    {
      velocity.y *= -1;
      if(position.y <= 0)
      {
        position.y += (diameter/2);
      }
    }
  }


  void display () 
  {
    fill(0,100);
    stroke(200 - (2 * enemy1.health));
    strokeWeight(strokeWidth);

    rectMode(CENTER);

    ellipse (position.x, position.y, diameter,diameter);
  }
}


class Target
{
  PVector position;
  PVector velocity;
  PVector accel;
  int diameter = int(random(10,60));
  float maxvel;
  float score = 0;
  float addScore = 0;

  Target (PVector a2, PVector v2, PVector p2)
  {
    position = p2;
    velocity = v2;
    accel = a2;
    maxvel = 6;
  }

  void run()
  {
    update();
    borders();
    collision();
    display();
  }

  void update() 
  {
    velocity.add(accel);
    position.add(velocity);

    velocity.limit(maxvel);
  }

  void borders()
  {
    if(position.x >= width - (diameter/2))
    {
      velocity.x *= -1;
      if(position.x >= width)
      {
        position.x -= (diameter/2);
      }
    }
    if(position.x <= 0 + (diameter/2))
    {
      velocity.x *= -1;
      if(position.x <= 0)
      {
        position.x += (diameter/2);
      }
    }
    if(position.y >= height - (diameter/2))
    {
      velocity.y *= -1;
      if(position.y >= height)
      {
        position.y -= (diameter/2);
      }
    }
    if(position.y <= 0 + (diameter/2))
    {
      velocity.y *= -1;
      if(position.y <= 0)
      {
        position.y += (diameter/2);
      }
    }
  }

  void collision()
  {
    if(position.dist(player.position) <= ((player.diameter/2) + (diameter/2)))
    {
      addScore = (6 - (diameter/10));
      if(clickedOnce == true)
      {
        score += addScore;
      }
      println(addScore);
      t=0;

      respawn();
    }
  }

  void respawn()
  {
    position = new PVector(random(0,width), random(0,height));
    diameter = int(random(10,60));
  }


  void display () 
  {
    theta+= 0.1;
    float targetFill = abs(sin(theta) * 100); 

    fill(targetFill,100);
    //stroke(0);
    //strokeWeight(0);
    noStroke();
    rectMode(CENTER);


    ellipse (position.x, position.y, diameter,diameter);
  }
}

class Enemy
{
  PVector position;
  PVector velocity;
  PVector accel;
  int diameter = 20;
  float maxvel;
  float rectHeight = 20;
  float rectWidth = 50; 
  float health = 100;

  Enemy (PVector a3, PVector v3, PVector p3)
  {
    position = p3;
    velocity = v3;
    accel = a3;
    maxvel = 2;
  }

  void run()
  {
    update();
    borders();
    collision();
    display();
  }

  void update() 
  {
    velocity.add(accel);
    position.add(velocity);

    velocity.limit(maxvel);
  }

  void borders()
  {
    if(position.x >= width - (rectWidth/2))
    {
      velocity.x *= -1;
      if(position.x >= width)
      {
        position.x -= (rectWidth);
      }
    }
    if(position.x <= 0 + (rectWidth/2))
    {
      velocity.x *= -1;
      if(position.x <= 0)
      {
        position.x += (rectWidth);
      }
    }
    if(position.y >= height - (rectHeight/2))
    {
      velocity.y *= -1;
      if(position.y >= height)
      {
        position.y -= (rectHeight);
      }
    }
    if(position.y <= 0 + (rectHeight/2))
    {
      velocity.y *= -1;
      if(position.y <= 0)
      {
        position.y += (rectHeight);
      }
    }
  }

  void collision()
  {

    if(collide())
    {
      if(target.score > 0)
      {
        health -= 0.5;
      }
    }
  }

  boolean collide()
  {
    float circleDistanceX = abs(player.position.x - position.x - rectWidth/2);
    float circleDistanceY = abs(player.position.y - position.y - rectHeight/2);

    if (circleDistanceX > (rectWidth/2 + (player.diameter/2))) { 
      return false;
    }
    if (circleDistanceY > (rectHeight/2 + (player.diameter/2))) { 
      return false;
    }

    if (circleDistanceX <= (rectWidth/2)) 
    { 
      player.velocity.x *= -1;
      return true;
    } 
    if (circleDistanceY <= (rectHeight/2)) 
    { 
      player.velocity.y *= -1;
      return true;
    }

    float cornerDistance_sq = pow(circleDistanceX - rectWidth/2, 2) +
      pow(circleDistanceY - rectHeight/2, 2);

    if (cornerDistance_sq <= pow((player.diameter/2),2))
    {

      player.velocity.y *= -1;
      return true;
    }
    else {
      return false;
    }
  }


  void display () 
  {
    fill(255,0,0,180);
    //stroke(0);
    //strokeWeight(0);
    noStroke();
    rectMode(CORNER);

    rect(position.x, position.y, rectWidth,rectHeight);
  }
}


